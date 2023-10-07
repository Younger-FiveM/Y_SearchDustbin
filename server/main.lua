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

-- Define the function to add an item to the player's inventory
RegisterServerEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(itemName, count)
end)