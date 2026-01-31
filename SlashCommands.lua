local addonName, ns = ...

SLASH_SMARTTRADER1 = "/smarttrader"
SLASH_SMARTTRADER2 = "/st"

SlashCmdList["SMARTTRADER"] = function(msg)
    local cmd = msg:lower():trim()

    if cmd == "" or cmd == "help" then
        ns.Print("Commands:")
        ns.Print("  /st help - Show this help message")
    else
        ns.Print("Unknown command: " .. cmd)
    end
end
