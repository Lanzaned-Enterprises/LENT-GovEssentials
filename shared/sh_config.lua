Config = Config or {}

Config.Settings = {
    ['Gender'] = {
        ['Male'] = "Mr.",
        ['Female'] = "Mrs.",
    },
    ['Timer'] = 2000,
    ['AllowedJobs'] = {
        -- ['name-in-core'] = { -- Must match the name as specified in qb/shared/job.lua
        --     ['Label'] = "", -- Can be any form of string
        --     ['LogoLink'] = "", -- Should end in .png preferabbly.
        -- },
        ['sasp'] = {
            ['Label'] = "San Andreas State Troopers",
            ['LogoLink'] = "https://cdn.discordapp.com/attachments/1079043045871337532/1091305238675329034/latest.png",
        },
        ['police'] = {
            ['Label'] = "Los Santos Police Department",
            ['LogoLink'] = "https://cdn.discordapp.com/attachments/1079043045871337532/1091305238125875210/latest.png",
        },
        ['bcso'] = {
            ['Label'] = "Los Santos County Sheriff's Office",
            ['LogoLink'] = "https://cdn.discordapp.com/attachments/1079043045871337532/1091305237744209960/latest.png",
        },
        ['doc'] = {
            ['Label'] = "Department of Corrections",
            ['LogoLink'] = "https://cdn.discordapp.com/attachments/1079043045871337532/1091305427213504582/latest.png",
        },
        ['ambulance'] = {
            ['Label'] = "San Andreas Fire Department",
            ['LogoLink'] = "https://cdn.discordapp.com/attachments/1079043045871337532/1091305238360772638/image.png",
        },
    },
}