local addonName, ns = ...

-- Shared state
ns.initialized = false
ns.inBattleground = false

function ns.SetBlockTrades(enabled)
    local value = enabled and "1" or "0"
    SetCVar("blockTrades", value)
    if enabled then
        ns.Print("Trade blocking ON (game setting enabled).")
    else
        ns.Print("Trade blocking OFF (game setting disabled).")
    end
end

function ns.IsBlockingTrades()
    return GetCVar("blockTrades") == "1"
end

local function IsInBattleground()
    local _, instanceType = IsInInstance()
    return instanceType == "pvp"
end

function ns.Print(msg)
    print("|cff88ff88SmartTrader:|r " .. msg)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
frame:SetScript("OnEvent", function(self, event, arg1, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        ns.initialized = true
        ns.Print("Loaded v1.1.1")

        C_Timer.After(2, function()
            if IsInBattleground() then
                ns.inBattleground = true
                if not ns.IsBlockingTrades() then
                    ns.SetBlockTrades(true)
                    ns.Print("Battleground detected.")
                end
            else
                if ns.inBattleground and ns.IsBlockingTrades() then
                    ns.SetBlockTrades(false)
                    ns.Print("Left battleground.")
                end
                ns.inBattleground = false
            end
        end)

    elseif event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" then
        if arg1 and arg1:find("has begun") and IsInBattleground() then
            ns.inBattleground = true
            if not ns.IsBlockingTrades() then
                ns.SetBlockTrades(true)
                ns.Print("Battleground started.")
            end
        end
    end
end)
