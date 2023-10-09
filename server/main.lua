------------------------------------------------------------
ESX = exports['es_extended']:getSharedObject()
------------------------------------------------------------

-- Define the function to add an item to the player's inventory
RegisterServerEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(itemName, count)
end)