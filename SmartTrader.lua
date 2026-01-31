local addonName, ns = ...

-- Shared state
ns.initialized = false

function ns.Print(msg)
    print("|cff88ff88SmartTrader:|r " .. msg)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        ns.initialized = true
        ns.Print("Loaded v1.0.0")
    end
end)
