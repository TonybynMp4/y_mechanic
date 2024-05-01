# qbx_mechanic

## Items
```lua
    ['advancedrepairkit'] = {
        label = 'Advanced Repair Kit',
        weight = 4000,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your vehicle",
        client = {
            image = 'advancedkit.png',
        },
        server = {
            export = "qbx_mechanic.advancedrepairkit"
        },
        consume = 0.5
    },

    ['repairkit'] = {
        label = 'Repair kit',
        weight = 2500,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your vehicle",
        server = {
            export = "qbx_mechanic.repairkit"
        },
        consume = 0.25
    },

    ['bodykit'] = {
        label = 'Body kit',
        weight = 1000,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your vehicle",
        server = {
            export = "qbx_mechanic.bodykit"
        },
        consume = 0.5
    },

    ['cleaningkit'] = {
        label = 'Cleaning kit',
        weight = 250,
        stack = true,
        close = true,
        description = "Grandpa's cleaning kit",
        server = {
            export = "qbx_mechanic.cleaningkit"
        },
        consume = 0.25
    },

    ['wheelkit'] = {
        label = 'Spare Wheels',
        weight = 1000,
        stack = true,
        close = true,
        description = "Spare wheels'
        server = {
            export = "qbx_mechanic.wheelkit"
        },
        consume = 1
    },
```