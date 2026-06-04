-- Description: This script gets and sets the fligh mode of the vihicle
-- copter modes: https://mavlink.io/en/messages/ardupilotmega.html#COPTER_MODE

-- vehicle:get_mode() returns the mode os the vehicle as a number
-- vehicle:set_mode(mode) sets the mode os the vehicle where mode is a number 

local copter_modes = { [0] = "Stabilize", [1] = "acro", [2] = "Alt_hold",
                        [3] = "Auto", [4] = "Guided", [5] = "Loiter",
                        [6] = "RTL", [7] = "Circle", [9] = "Land",
                        [11] = "Drift", [13] = "Sport", [14] = "Flip"
                        [15] = 'AUTOTUNE', [16] = "Poshold", [17] = "Brake",
                        [18] = "Throw", [19] = "AVOID_ADSB", [20] = "GUIDED_NOGPS",
                        [21] = "SMART_RTL", [22] = "FLOWHOLD", [23] = "FOLLOW",
                        [24] = "ZIGZAG", [25] = "SYSTEMID", [26] = "AUTOROTATE",
                        [27] = "AUTO_RTL"}

local COPTER_MODE_GUIDED = 4
local COPTER_MODE_LAND = 9