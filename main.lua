local addonName, addonTable = ...
local LootARangClassic = CreateFrame("Frame", addonName.."Frame", UIParent)

local prefixInfo   = "|cffffff00[|r|cffd597ffLoot A Rang|r|cffffff00]|r "
local prefixError  = "|cffffff00[|r|cffff00ffLoot A Rang|r|cffffff00]|r "

local L = {}
local locale = GetLocale()

if locale == "esES" or locale == "esMX" then
    L["toyName"] = "Despojador a distancia"
    L["enabled"]  = prefixInfo .. "|cff00ff00Activado: Doble click derecho para usar.|r"
    L["disabled"] = prefixError .. "|cffff0000Desactivado.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Comandos disponibles:|r",
        "   |cffffff00/lar activar|r  - activar el doble click",
        "   |cffffff00/lar cancelar|r - desactivar el doble click",
        "   |cffffff00/lar help|r     - mostrar ayuda"
    }
elseif locale == "enUS" or locale == "enGB" then
    L["toyName"] = "Loot-A-Rang"
    L["enabled"]  = prefixInfo .. "|cff00ff00Enabled: Right double click to use.|r"
    L["disabled"] = prefixError .. "|cffff0000Disabled.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Available commands:|r",
        "   |cffffff00/lar enable|r - enable right double click",
        "   |cffffff00/lar cancel|r - disable right double click",
        "   |cffffff00/lar help|r   - show help"
    }
else
    L["toyName"] = "Loot-A-Rang"
    L["enabled"]  = prefixInfo .. "|cff00ff00Enabled: Right double click to use.|r"
    L["disabled"] = prefixError .. "|cffff0000Disabled.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Available commands:|r",
        "   |cffffff00/lar enable|r - enable right double click",
        "   |cffffff00/lar cancel|r - disable right double click",
        "   |cffffff00/lar help|r   - show help"
    }
end

-- Macro
local macroName = "LootARangMacro"
local macroText = "#showtooltip " .. L["toyName"] .. "\n/use " .. L["toyName"]

local function EnsureMacro()
    local macroId = GetMacroIndexByName(macroName)
    if macroId == 0 then
        CreateMacro(macroName, "INV_MISC_QUESTIONMARK", macroText, true)
    else
        EditMacro(macroId, macroName, "INV_MISC_QUESTIONMARK", macroText, true, 1)
    end
end

-- Botón para el juguete
local secureButton = CreateFrame("Button", addonName.."Button", UIParent, "SecureActionButtonTemplate")
secureButton:SetAttribute("type", "macro")
secureButton:SetAttribute("macrotext", macroText)
secureButton:Hide()

-- Control de clicks
local lastClick, clickDelay = 0, 0.3
local active = true -- por defecto activado

WorldFrame:HookScript("OnMouseDown", function(_, btn)
    if not active then return end
    if btn == "RightButton" and not InCombatLockdown() then
        local now = GetTime()
        if now - lastClick <= clickDelay then
            SetOverrideBindingClick(secureButton, true, "BUTTON2", secureButton:GetName())
            C_Timer.After(0.1, function()
                ClearOverrideBindings(secureButton)
            end)
        end
        lastClick = now
    end
end)

-- Slash commands
SLASH_LOOTARANG1 = "/lootarang"
SLASH_LOOTARANG2 = "/lar"
SlashCmdList["LOOTARANG"] = function(msg)
    msg = string.lower(msg or "")
    if msg == "" or msg == "help" then
        for _, line in ipairs(L["help"]) do
            print(line)
        end
    elseif msg == "cancel" or msg == "cancelar" or msg == "off" or msg == "disable" then
        active = false
        print(L["disabled"])
    elseif msg == "activar" or msg == "enable" or msg == "on" then
        active = true
        print(L["enabled"])
    else
        print(prefixError .. "|cffff0000Comando desconocido. Usa /lar help|r")
    end
end

-- Evento de inicio
LootARangClassic:RegisterEvent("PLAYER_LOGIN")
LootARangClassic:SetScript("OnEvent", function(self, event)
    EnsureMacro()
    if active then
        print(L["enabled"])
    else
        print(L["disabled"])
    end
end)
