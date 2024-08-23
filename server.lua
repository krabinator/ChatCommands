function GetNearbyPlayers(SourcePlayerId, Radius)
    local NearbyPlayers = {}
    local SourcePlayerPed = GetPlayerPed(SourcePlayerId)
    local SourceCoords = GetEntityCoords(SourcePlayerPed)

    for _, PlayerId in pairs(GetPlayers()) do
        local TargetPlayerPed = GetPlayerPed(PlayerId)
        local TargetCoords = GetEntityCoords(TargetPlayerPed)
        local Distance = #(SourceCoords - TargetCoords)

        if Distance <= Radius then
            table.insert(NearbyPlayers, PlayerId)
        end
    end

    return NearbyPlayers
end

function FormatString(Source, Title)
    local FormattedString = Title
    :gsub('|', '^7|', 1)
    :gsub('{PlayerName}', GetPlayerName(Source))
    :gsub('{PlayerId}', Source)

    return FormattedString
end

function CommandLog(Name, Command, Message, Color)
    local function RGBToDecimal(r, g, b)
        return (Color[1] << 16) + (Color[2] << 8) + Color[3]
    end

    local EmbedData = {
        ['content'] = '',
        ['embeds'] = {{
            ['title'] = 'Command Log',
            ['type'] = 'rich',
            ['color'] = tonumber(RGBToDecimal(Color)),
            ['fields'] = {
                {
                    ['name'] = 'Sent:',
                    ['value'] = Name,
                    ['inline'] = true
                },
                {
                    ['name'] = 'Command:',
                    ['value'] = Command,
                    ['inline'] = true
                },
                {
                    ['name'] = 'Message:',
                    ['value'] = Message,
                    ['inline'] = true
                }
            }
        }}
    }

    PerformHttpRequest(Config.WebhookUrl, function() end, 'POST', json.encode(EmbedData), {['Content-Type'] = 'application/json'})
end

Citizen.CreateThread(function()
    for Index, Array in pairs(Config.Commands) do
        if Array.Aliases then
            for _, Alias in pairs(Array.Aliases) do
                RegisterCommand(Alias, function(Source, Args)
                    local ChatMessage = table.concat(Args, ' ')
                    local CommandTitle = FormatString(Source, Array.Title)
                    if ChatMessage:len() == 0 then return end
    
                    if Array.Proximity then
                        local PlayerIds = GetNearbyPlayers(Source, Array.Proximity)
    
                        for _, PlayerId in pairs(PlayerIds) do
                            TriggerClientEvent('chat:addMessage', PlayerId, {
                                color = Array.Color,
                                multiline = true,
                                args = {CommandTitle, ChatMessage}
                            })
                        end
                    else
                        TriggerClientEvent('chat:addMessage', -1, {
                            color = Array.Color,
                            multiline = true,
                            args = {CommandTitle, ChatMessage}
                        })
                    end

                    if Config.WebhookUrl then
                        CommandLog(GetPlayerName(Source), Alias, ChatMessage, Array.Color)
                    end
                end, false)
            end
        end
    end
end)