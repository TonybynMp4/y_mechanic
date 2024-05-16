return {
    -- Only allow vehicles to be repaired in the repair areas
    restrictToZone = true,
    debugPoly = false,

    locations = {
        harmony = {
            dutyAreas = {
                {
                    coords = vec4(1186.75, 2638.075, 38.2, 90),
                    distance = 2.0,
                    size = vec3(1, 2, 1.0)
                }
            },
            repairAreas = {
                {
                    coords = vec3(1180, 2649.5, 37.5),
                    radius = 35.0
                },
            }
        },
        beekersgarage = {
            dutyAreas = {
                {
                    coords = vec4(100.6, 6619.8, 32.2, 315),
                    distance = 2.0,
                    -- optional: if you want to use target
                    size = vec3(1, 2, 1.0),
                }
            },
            repairAreas = {
                {
                    coords = vec3(121.79, 6613.39, 31.85),
                    radius = 35.0
                },
            }
        },
        bennys = {
            dutyAreas = {
                {
                   coords = vec4(-204.5, -1327.5, 31.25, 170),
                    distance = 2.0,
                    size = vec3(1.5, 1.5, 1.0),
                }
            },
            repairAreas = {
                {
                    coords = vec3(-211, -1311.5, 31),
                    radius = 40.0
                },
            }
        },
        lscustom = {
            dutyAreas = {
                {
                    coords = vec4(-347.51, -133.37, 39.01, 70),
                    distance = 2.0,
                    size = vec3(1.5, 1.5, 1.0),
                },
                {
                    coords = vec4(738.57, -1077.94, 22.20, 270.03),
                    distance = 2.0,
                    size = vec3(1.5, 1.5, 1.0),
                }
            },
            repairAreas = {
                {
                    coords = vec3(-369.83, -126.88, 38.7),
                    radius = 50.0
                },
                {
                    coords = vec3(718.5, -1072.5, 22),
                    radius = 30.0
                },
            }
        },
    },

    backEngineVehicles = {
        [`SC1`] = true,
        [`zorrusso`] = true,
        [`gp1`] = true,
        [`tempestaevo`] = true,
        [`entity2`] = true,
        [`tyrusgtr`] = true,
        [`xa21`] = true,
        [`com20gpr`] = true,
        [`com21gpr`] = true,
        [`emerus`] = true,
        [`MF1`] = true,
        [`osirisr`] = true,
        [`mf1c`] = true,
        [`krieger`] = true,
        [`strombergsu`] = true,
        [`torero`] = true,
        [`torerod`] = true,
        [`italirsx`] = true,
        [`coquette4`] = true,
        [`comet6`] = true,
        [`comet7`] = true,
        [`neross`] = true,
        [`nerossc`] = true,
        [`bulletgt`] = true,
        [`thrax`] = true,
        [`niner`] = true,
        [`ninef`] = true,
        [`adder`] = true,
        [`vagner`] = true,
        [`t20`] = true,
        [`infernus`] = true,
        [`zentorno`] = true,
        [`reaper`] = true,
        [`comet2`] = true,
        [`comet3`] = true,
        [`jester`] = true,
        [`jester2`] = true,
        [`cheetah`] = true,
        [`cheetah2`] = true,
        [`prototipo`] = true,
        [`turismor`] = true,
        [`pfister811`] = true,
        [`ardent`] = true,
        [`nero`] = true,
        [`nero2`] = true,
        [`tempesta`] = true,
        [`vacca`] = true,
        [`bullet`] = true,
        [`osiris`] = true,
        [`entityxf`] = true,
        [`turismo2`] = true,
        [`fmj`] = true,
        [`re7b`] = true,
        [`tyrus`] = true,
        [`italigtb`] = true,
        [`penetrator`] = true,
        [`monroe`] = true,
        [`ninef2`] = true,
        [`stingergt`] = true,
        [`surfer`] = true,
        [`surfer2`] = true,
    }
}
