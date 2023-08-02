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

------------------------------------------------------------
--------------------------FONCTION--------------------------
local isSearching = false
local blocked = false

function CanSearchDustbin()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    local props = {}

    for _, model in ipairs(Config.AllowedDustbinProps) do
        local dustbin = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 1.0, GetHashKey(model), false, false, false)
        if DoesEntityExist(dustbin) then
            table.insert(props, dustbin)
        end
    end

    for i = 1, #props do
        local dustbin = props[i]
        local dusbinCoords = GetEntityCoords(dustbin)
        local distance = #(playerCoords - dusbinCoords)

        if not isSearching and distance <= Config.Range and not IsPedInAnyVehicle(playerPed, false) and not blocked[dustbin] then
            return true
        end
    end
    return false
end