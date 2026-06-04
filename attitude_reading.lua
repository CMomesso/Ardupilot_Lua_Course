-- Description: This script reads attitude from AHRS and sends it to GCS

-- read attitude from AHRS
-- read altitude from ST VL53L1X Lidar sensor 
-- (25 -> Ardupilot conf. -> down place sensor)

function read_attitude()
    local roll = math.deg(ahrs:get_roll())
    local pitch = math.deg(ahrs:get_pitch())
    local yaw = math.deg(ahrs:get_yaw())

    local altitude = rangefinder:distance_cm_orient(25)

    gcs:send_text(7, string.format("Atittude: -> roll: %0.1f pitch: %0.1f yaw: %0.1f", roll, pitch, yaw))
    gcs:send_text(7, string.format("Altitude: %0.1f", altitude))

    return read_attitude, 1000
end

return read_attitude()