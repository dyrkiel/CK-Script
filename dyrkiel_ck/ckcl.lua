ESX                           = nil
local PlayerData                = {}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(500)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)

end)

RegisterCommand('', function()
    TriggerEvent('d_ck:napewno')
end, false)

RegisterNetEvent('d_ck:napewno')
AddEventHandler('d_ck:napewno', function()
    ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'dck_menu',
	{
		title    = 'Czy na pewno chcesz zrobić sobie CK?',
		align    = 'top-left',
		elements = {
			{label = 'Nie',	value = '1'},
			{label = 'Tak',	value = '2'}

		}
	}, function(data, menu)		               
    local action = data.current.value

        if action == '1' then
            ESX.UI.Menu.CloseAll()
		end
		if action == '2' then
            TriggerServerEvent('d_ck:character', source)
        end
	end, function(data, menu)
		menu.close()
	end)
end)