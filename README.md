# Chat Commands

Simple and straight forward chat commands.

![ccembed](https://github.com/user-attachments/assets/ead098bf-6bba-4921-9776-492cdb56ed56)
![ccimage](https://github.com/user-attachments/assets/f37050c0-7fb8-4251-9f95-8d596af5e039)

# Example Usage

If you don't want to log commands just replace the quotes with nil. Color is in RGB values.

You can include either of the following in the Title of a command for Player recognition; {PlayerName} {PlayerId}

```lua
Config = {}

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
