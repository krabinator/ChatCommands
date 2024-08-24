Citizen.CreateThread(function()
    for Index, Array in pairs(Config.Commands) do
        if Array.Aliases then
            for _, Alias in pairs(Array.Aliases) do
                TriggerEvent('chat:addSuggestion', '/' .. Alias, nil, {
                    {name = Array.Suggestion[1], help = Array.Suggestion[2]}
                })
            end
        end
    end
end)
