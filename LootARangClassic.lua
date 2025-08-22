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
elseif locale == "frFR" then
    L["toyName"] = "Plumerang"
    L["enabled"]  = prefixInfo .. "|cff00ff00Activé : Double-clic droit pour utiliser.|r"
    L["disabled"] = prefixError .. "|cffff0000Désactivé.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Commandes disponibles :|r",
        "   |cffffff00/lar activer|r - activer le double-clic droit",
        "   |cffffff00/lar annuler|r - désactiver le double-clic droit",
        "   |cffffff00/lar aide|r     - afficher l'aide"
    }
elseif locale == "deDE" then
    L["toyName"] = "Plünderang"
    L["enabled"]  = prefixInfo .. "|cff00ff00Aktiviert: Rechtsdoppelklick zum Benutzen.|r"
    L["disabled"] = prefixError .. "|cffff0000Deaktiviert.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Verfügbare Befehle:|r",
        "   |cffffff00/lar aktivieren|r - Rechtsdoppelklick aktivieren",
        "   |cffffff00/lar abbrechen|r - Rechtsdoppelklick deaktivieren",
        "   |cffffff00/lar hilfe|r     - Hilfe anzeigen"
    }
elseif locale == "ruRU" then
    L["toyName"] = "Поисковик трофеев"
    L["enabled"]  = prefixInfo .. "|cff00ff00Включено: Правый двойной клик для использования.|r"
    L["disabled"] = prefixError .. "|cffff0000Отключено.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Доступные команды:|r",
        "   |cffffff00/lar включить|r - включить правый двойной клик",
        "   |cffffff00/lar отменить|r - отключить правый двойной клик",
        "   |cffffff00/lar помощь|r   - показать помощь"
    }
elseif locale == "zhCN" then
    L["toyName"] = "远程拾取器"
    L["enabled"]  = prefixInfo .. "|cff00ff00已启用：右键双击使用。|r"
    L["disabled"] = prefixError .. "|cffff0000已禁用。|r"
    L["help"] = {
        prefixInfo .. "|cffffff00可用命令：|r",
        "   |cffffff00/lar 启用|r - 启用右键双击",
        "   |cffffff00/lar 取消|r - 禁用右键双击",
        "   |cffffff00/lar 帮助|r   - 显示帮助"
    }
elseif locale == "zhTW" then
    L["toyName"] = "撿拾套索"
    L["enabled"]  = prefixInfo .. "|cff00ff00已啟用：右鍵雙擊使用。|r"
    L["disabled"] = prefixError .. "|cffff0000已禁用。|r"
    L["help"] = {
        prefixInfo .. "|cffffff00可用命令：|r",
        "   |cffffff00/lar 啟用|r - 啟用右鍵雙擊",
        "   |cffffff00/lar 取消|r - 禁用右鍵雙擊",
        "   |cffffff00/lar 幫助|r   - 顯示幫助"
    }
elseif locale == "koKR" then
    L["toyName"] = "원거리 획득기"
    L["enabled"]  = prefixInfo .. "|cff00ff00활성화됨: 오른쪽 더블 클릭으로 사용.|r"
    L["disabled"] = prefixError .. "|cffff0000비활성화됨.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00사용 가능한 명령어:|r",
        "   |cffffff00/lar 활성화|r - 오른쪽 더블 클릭 활성화",
        "   |cffffff00/lar 취소|r - 오른쪽 더블 클릭 비활성화",
        "   |cffffff00/lar 도움말|r   - 도움말 표시"
    }
elseif locale == "ptBR" then
    L["toyName"] = "Saque-o-rangue"
    L["enabled"]  = prefixInfo .. "|cff00ff00Ativado: Clique duplo direito para usar.|r"
    L["disabled"] = prefixError .. "|cffff0000Desativado.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Comandos disponíveis:|r",
        "   |cffffff00/lar ativar|r - ativar clique duplo direito",
        "   |cffffff00/lar cancelar|r - desativar clique duplo direito",
        "   |cffffff00/lar ajuda|r   - mostrar ajuda"
    }
elseif locale == "itIT" then
    L["toyName"] = "Loot-A-Rang"
    L["enabled"]  = prefixInfo .. "|cff00ff00Abilitato: Doppio clic destro per usare.|r"
    L["disabled"] = prefixError .. "|cffff0000Disabilitato.|r"
    L["help"] = {
        prefixInfo .. "|cffffff00Comandi disponibili:|r",
        "   |cffffff00/lar abilita|r - abilita il doppio clic destro",
        "   |cffffff00/lar annulla|r - disabilita il doppio clic destro",
        "   |cffffff00/lar aiuto|r   - mostra aiuto"
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
