local addonName, ns = ...

SLASH_SMARTTRADER1 = "/smarttrader"
SLASH_SMARTTRADER2 = "/st"

SlashCmdList["SMARTTRADER"] = function(msg)
    local cmd = msg:lower():trim()

    if cmd == "" or cmd == "help" then
        ns.Print("Commands:")
        ns.Print("  /st trade - Toggle trade blocking")
        ns.Print("  /st help - Show this help message")
    elseif cmd == "trade" then
        ns.blockTrades = not ns.blockTrades
        if ns.blockTrades then
            ns.Print("Trade blocking ON - incoming trades will be cancelled.")
        else
            ns.Print("Trade blocking OFF - trades allowed.")
        end
    else
        ns.Print("Unknown command: " .. cmd)
    end
end
