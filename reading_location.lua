-- Description: This script reads location from AHRS and sends it to the GCS

-- atitude frame types
local ALT_FRAME_ABOVE_HOME = 1
local ALT_FRAME_ABSOLUTE = 0

function read_location()

    -- read current location of the vehicle
    local check_location = ahrs:get_location()

    -- check for valid location (check if gps is avaliable)
    if check_location then

        -- change altitude frame
        check_location:change_alt_frame(ALT_FRAME_ABOVE_HOME)

        -- get latitude, longitude and altitude of the vihicle
        local latitude = check_location:lat() * 1e-7
        local longitude = check_location:lng() * 1e-7
        local altitude = check_location:alt() * 1e-2 

        -- notify GCS with the current location
        gcs:send_text(7, string.format("Location -> Latitude %f Longitude %f Altitude %f", latitude, longitude, altitude))
    else
        gcs:send_text(7, string.format("No GPS"))
    end


    return read_location, 1000
end

return read_location()