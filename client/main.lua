------------------------------------------------------------
local ESX = nil
local PlayerData = nil

if Config.OldESX then
	ESX = nil
	Citizen.CreateThread(function(spawnPoint)
		while ESX == nil do
			TriggerEvent('esx:getSharedObject8', function(obj) ESX = obj end)
			Citizen.Wait(1000)
		end
        ESX.PlayerData = ESX.GetPlayerData()
	end)
else
	ESX = exports['es_extended']:getSharedObject()
end
-- ESX = exports['es_extended']:getSharedObject()
------------------------------------------------------------
--------------------------FONCTION--------------------------
local binCooldowns = {}

-- Define the key to search the bin
local searchKey = 38-- Change this to the key code you want to use

-- Define the loot chances
local lootChances = {
    {name = 'iron', chance = 50},
    {name = 'gold', chance = 30},
    {name = 'diamond', chance = 20},
}

-- Define the function to check if the player is close to a bin and if the key is pressed
function checkBinSearch()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, binModel in ipairs(Config.AllowedDustbinProps) do
        local bin = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 10.0, GetHashKey(binModel), false, false, false)

        if bin ~= 0 then
            local binCoords = GetEntityCoords(bin)
            local distance = #(playerCoords - binCoords)

            if distance < Config.Range and IsControlJustPressed(0, searchKey) then
		-- Check if the bin is on cooldown
                local binCooldown = binCooldowns[binCoords]
                if not binCooldown or (binCooldown and GetGameTimer() - binCooldown >= Config.CooldownTime) then
		    -- Play the search animation
                    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
		    
		    -- Wait for the search animation to finish
                    Citizen.Wait(10000)

            -- Stop the search animation
                    ClearPedTasks(playerPed)

		    -- Generate a random number to determine if the player finds loot
                    local lootRoll = math.random(1, 100)

                    if lootRoll <= Config.BinLootChance then
			-- Generate another random number to determine the type of loot
                        local lootTypeRoll = math.random(1, 100)
                        local lootType = nil

                        for _, loot in ipairs(lootChances) do
                            if lootTypeRoll <= loot.chance then
                                lootType = loot.name
                                break
                            else
                                lootTypeRoll = lootTypeRoll - loot.chance
                            end
                        end

			-- Add the loot to the player's inventory
                        TriggerServerEvent('esx:addInventoryItem', lootType, 1)

			-- Set the bin on cooldown
                        binCooldowns[binCoords] = GetGameTimer()
                        lib.notify({
                            title = 'Notification title',
                            description = 'Vous avez trouvé ' .. lootType .. ' dans la poubelle !',
                            type = 'success'
                        })
                        -- ShowNotification('Vous avez trouvé ' .. lootType .. ' dans la poubelle !')
                    else
                        lib.notify({
                            title = 'Notification title',
                            description = 'Vous n\'avez rien trouvé dans la poubelle.',
                            type = 'error'
                        })
                        -- ShowNotification('Vous n\'avez rien trouvé dans la poubelle.')
                    end
                else
                    lib.notify({
                        title = 'Notification title',
                        description = 'Cette poubelle a déjà été fouillée récemment.',
                        type = 'error'
                    })
                    -- ShowNotification('Cette poubelle a déjà été fouillée récemment.')
                end
            end
        end
    end
end

-- Call the checkBinSearch function every frame
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        checkBinSearch()
    end
end)