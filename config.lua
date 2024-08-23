Config = {}

--[[
    {PlayerName}, {PlayerId}
]]

Config.WebhookUrl = 'https://discord.com/api/webhooks/' -- or nil

Config.Commands = {
    ['Twitter'] = {
        Color = {0, 170, 255},
        Aliases = {'tweet', 'twt'},
        Suggestion = {'message', 'tweets a message'},
        Title = [[Twitter | {PlayerName}]],
        Proximity = nil
    },
    ['Darkweb'] = {
        Color = {0, 0, 0},
        Aliases = {'darkweb'},
        Suggestion = {'message', 'sends an anonymous message'},
        Title = [[Darkweb | Anonymous]],
        Proximity = nil
    },
    ['Do'] = {
        Color = {52, 237, 12},
        Aliases = {'do'},
        Suggestion = {'message', 'sends context details'},
        Title = [[Do | {PlayerName}]],
        Proximity = 50
    }
}