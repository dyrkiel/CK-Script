ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('d_ck:character')
AddEventHandler('d_ck:character', function()
	local webhook = "TUTAJ WKLEJ WEEBHOOKA :)"
	---------------------------------------------------------------------------------------------------------------------------------------------
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local hexgostek = xPlayer.identifier
	local j=GetPlayerName(source)
	local k=GetPlayerEndpoint(source)
    local n= {
        {
        ["color"]="8663711",
        ["title"]="GRACZ ZROBIŁ SOBIE CK",
        ["description"]="\n\n > ``Nick usuwającego postać:``***".. j .."***\n > ``IP usuwającego postać:`` ***".. k .."***\n > ``HEX usuwającego postać:`` ***".. hexgostek .."***",
        ["footer"]=
        {
            ["text"]="dyrkiel_ CharacterKill"},
            ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S'),
        }
    }

    PerformHttpRequest(webhook,function(f,o,h)end,'POST',json.encode({username="Gracz wykonał sobie CK",embeds=n}),{['Content-Type']='application/json'})
        --funkcjesql
        MySQL.Sync.execute("DELETE FROM `user_inventory` WHERE identifier=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `users` WHERE identifier=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `user_accounts` WHERE identifier=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `user_inventory` WHERE identifier=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `phone_users_contacts` WHERE identifier=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `addon_account_data` WHERE owner=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `owned_vehicles` WHERE owner=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `owned_properties` WHERE owner=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `user_licenses` WHERE owner=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `datastore_data` WHERE owner=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `addon_inventory_items` WHERE owner=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `billing` WHERE identifier=@kox", {['@kox'] = hexgostek})
        MySQL.Sync.execute("DELETE FROM `characters` WHERE identifier=@kox", {['@kox'] = hexgostek})

        DropPlayer(source, 'CK zostało wykonane pomyślnie. Zamknij FiveMa i wejdź na serwer jeszcze raz')
end)