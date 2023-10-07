local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

Config = {}

Config.OldESX = false

Config.AllowedDustbinProps = { -- Add name props dustbin in GTA
    "prop_bin_14a",
    "prop_bin_07c",
    "prop_bin_08a",
    "prop_bin_04a",
    "prop_dumpster_01a",
    "prop_dumpster_02a",
    "prop_dumpster_02b",
    "prop_dumpster_3a",
    "prop_dumpster_4a",
    "prop_dumpster_4b",
}

Config.Range = 5

-- Config.SearchDuration = 10

Config.CooldownTime = 3600 -- Cooldown time in seconds 

-- Config.KeysSearch = Keys["E"] -- Key for search in dustbin "E"

Config.BinLootChance = 80 -- Chance to find something in the dustbin

-- Config.SearchAnimationDict = "amb@prop_human_bum_bin@idle_b" -- Animation Dict
-- Config.SearchAnimationName = "idle_d"

-- Config.Language = {
--   -- Translate in French
--   [1] = "Vous avez fouillé la poubelle !",
--   [2] = "Vous ne pouvez pas fouiller une poubelle pour le moment. Attendez ",
--   [3] = " secondes.",
--   [4] = "Fouille dans la poubelle",
--   -- Translate in English
--   [5] = "You searched the dustbin !",
--   [6] = "You cannot search a dustbin right now. Wait ",
--   [7] = " seconds",
--   [8] = "Rummage through the dustbin",
-- }