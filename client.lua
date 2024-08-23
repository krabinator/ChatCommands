Citizen.CreateThread(function()
    for Index, Value in pairs(Config.Commands) do
        if Value.Aliases then
            for _, Alias in pairs(Value.Aliases) do
                TriggerEvent('chat:addSuggestion', '/' .. Alias, nil, {
                    {name = Value.Suggestion[1], help = Value.Suggestion[2]}
                })
            end
        end
    end
end)