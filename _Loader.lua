-- vBot Loader seguro e universal (sem dependência de profiles)

local basePath = "/vBot/"

local function endsWith(str, suffix)
  return str:sub(-#suffix) == suffix
end

-- Importa OTUI e UI
local uiFiles = g_resources.listDirectoryFiles(basePath, true, false)
for _, file in ipairs(uiFiles) do
  if endsWith(file:lower(), ".otui") or endsWith(file:lower(), ".ui") then
    g_ui.importStyle(file)
  end
end

-- Função de carregamento seguro
local function loadScript(fileName)
  local filePath = basePath .. fileName .. ".lua"
  if g_resources.fileExists(filePath) then
    dofile(filePath)
  else
    warn("[vBot loader] Arquivo não encontrado: " .. filePath)
  end
end

-- Ordem dos scripts (ajuste conforme seus arquivos .lua)
local luaFiles = {
  "main",
  "items",
  "vlib",
  "new_cavebot_lib",
  "configs",
  "extras",
  "cavebot",
  "playerlist",
  "BotServer",
  "alarms",
  "Conditions",
  "pushmax",
  "combo",
  "HealBot",
  "new_healer",
  "AttackBot",
  "ingame_editor",
  "xubira",
  "Dropper",
  "Containers",
  "quiver_manager",
  "quiver_label",
  "tools",
  "antiRs",
  "depot_withdraw",
  "eat_food",
  "exeta",
  "analyzer",
  "spy_level",
  "supplies",
  "depositer_config",
  "npc_talk",
  "xeno_menu",
  "hold_target",
  "cavebot_control_panel",
}

for _, name in ipairs(luaFiles) do
  loadScript(name)
end

setDefaultTab("Main")
UI.Separator()
UI.Label("Private Scripts:")
UI.Separator()
