local args = { ... }

local length = tonumber(args[1])
local width = tonumber(args[2])
local direction = tostring(args[3])

print(length)
print(width)

-- if not length then
--   print("Usage: stripmine <length> [width]")
--   return
-- end

print("Strip mining length:", length)
print("Tunnel spacing:", width)

turtle.refuel()
-- local turnDirection  = 'left'
local turnDirection  = direction

function mineOverUnder()
    turtle.digUp()
    turtle.digDown()
end

for i = 1, width do
    turtle.drop()
    for y = 1, length do
        turtle.dig()
        turtle.forward()

        if turtle.detectDown()
        then turtle.digDown()
        end

        if turtle.detectUp()
        then turtle.digUp()
        end
    end

    -- pastebin get tfghxyRD stripMine

    if turnDirection == 'left' then
        turtle.turnLeft()
        turtle.dig()
        mineOverUnder()
        turtle.forward()
        turtle.turnLeft()
        turnDirection = 'right'
    elseif turnDirection == 'right' then
        turtle.turnRight()
        turtle.dig()
        mineOverUnder()
        turtle.forward()
        turtle.turnRight()
        turnDirection = 'left'
    end
end