--hahahaha
local args = { ... }
local length = tonumber(args[1])
local width = tonumber(args[2])
local direction = tostring(args[3])
local turnDirection  = direction

turtle.refuel()
turtle.select(2)
turtle.digUp()
turtle.digDown()
turtle.placeDown('torch')

print("Strip mining length:", length)
print("Tunnel spacing:", width)

-- pastebin get MtNQVzvy mine

function mineOverUnder()
    turtle.digUp()
    turtle.digDown()
end

for i = 1, width do
    if turtle.getFuelLevel() == 0 then
        turtle.select(1)
        turtle.refuel()
    end

    if turtle.getSelectedSlot() == 2 then
        turtle.select(3)
    end

    turtle.drop()
    for y = 1, length do
        turtle.dig()
        turtle.forward()

        if turtle.detectDown() then
            turtle.digDown()
        end

        if turtle.detectUp() then
            turtle.digUp()
        end

        -- place torch, at certain row and column, also check it is a torch we have
        if y % 5 == 0 and i % 3 == 1 then
            local itemDetail = turtle.getItemDetail(2)
            if itemDetail.name == "minecraft:torch" then
                turtle.select(2)
                -- if turtle.detectDown() then
                turtle.placeDown('torch')
                -- end
            end
        end
    end

    if turnDirection == 'left' then
        turtle.turnLeft()
        turtle.dig()
        mineOverUnder()
        turtle.forward()
        mineOverUnder()
        turtle.turnLeft()
        turnDirection = 'right'
    elseif turnDirection == 'right' then
        turtle.turnRight()
        turtle.dig()
        mineOverUnder()
        turtle.forward()
        mineOverUnder()
        turtle.turnRight()
        turnDirection = 'left'
    end
end