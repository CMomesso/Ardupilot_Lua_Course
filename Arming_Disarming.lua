-- gcs:send_text -> is used to send a mensage from the pixhawk to the groud control station
-- arming:is_armed () -> returns true or false = vehicle is armed or not

function arm_disarm()
    if arming:is_armed() then
        --  gsc:send_text(7, 'Vehicle is ARMED')
        arming:disarmed()
        
    else
        --  gsc:send_text(7, 'Vehicle is DISARMED')
        arming:arm()
    end
    gcs:send_text(7, "Arm status: " .. tostring(arming:is_armed ()))            
    return arm_disarm, 5000
end

return arm_disarm()