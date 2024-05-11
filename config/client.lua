return {
    -- Only allow vehicles to be repaired in the repair areas
    restrictToZone = true,

    locations = {
        harmony = {
            duty = {
                coords = vec3(-205.0, -1308.0, 31.3),
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
                    coords = vec3(549.0, -192.0, 54.5),
                    target = {
                        -- optional: if you want to use target
                        coords = vec4(549.0, -192.0, 54.5, 0),
                        size = vec3(1.5, 1.5, 1.0),
                        -- optional: if you want to use a ped instead of a boxzone
                        ped = `s_m_y_xmech_01`,
                    }
                }
            },
            repairAreas = {
                {
                    coords = vec3(121.79, 6613.39, 31.85),
                    radius = 35.0
                },
            }
        }
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
