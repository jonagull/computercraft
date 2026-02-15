turtle.refuel()
turtle.select(2)

for i = 1, 10 do
    if turtle.detectDown()
    then turtle.digDown()
    end

    turtle.down()
end

-- mine forward 30
-- turn around 180
-- dig down once
-- mine back 30 times
-- go one row over, repeat, as many times it can

local turnDirection  = 'left'

for i = 1, 10 do
    for y = 1, 30 do
        turtle.dig()
        turtle.forward()
        if turtle.detectDown()
        then turtle.digDown()
        end

        if y % 5 then
            turtle.placeDown('torch')
        end
    end

    if turnDirection == 'left' then
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
        turnDirection = 'right'
    elseif turnDirection == 'right' then
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
        turnDirection = 'left'
    end
end


