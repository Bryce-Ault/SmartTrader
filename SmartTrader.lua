local addonName, ns = ...

-- Shared state
ns.initialized = false
ns.blockTrades = false
ns.inBattleground = false

local function IsInBattleground()
    local _, instanceType = IsInInstance()
    return instanceType == "pvp"
end

function ns.Print(msg)
    print("|cff88ff88SmartTrader:|r " .. msg)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("TRADE_SHOW")
frame:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
frame:SetScript("OnEvent", function(self, event, arg1, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        ns.initialized = true
        ns.Print("Loaded v1.0.0")

        C_Timer.After(2, function()
            if IsInBattleground() then
                ns.inBattleground = true
                ns.blockTrades = true
                ns.Print("Battleground detected. Trade blocking ON.")
            else
                ns.inBattleground = false
                ns.blockTrades = false
            end
        end)

    elseif event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" then
        if arg1 and arg1:find("has begun") then
            ns.inBattleground = true
            if not ns.blockTrades then
                ns.blockTrades = true
                ns.Print("Battleground started. Trade blocking ON.")
            end
        end

    elseif event == "TRADE_SHOW" then
        if ns.blockTrades then
            local tradeTarget = TradeFrameRecipientNameText:GetText()
            CancelTrade()
            if tradeTarget then
                SendChatMessage("I'm not trading right now, thank you.", "WHISPER", nil, tradeTarget)
            end
            ns.Print("Trade blocked.")
        end
    end
end)
