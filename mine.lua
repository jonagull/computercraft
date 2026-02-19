
--hahahaha
-- seed: 69420070680859076
local args = { ... }
local length = tonumber(args[1])
local width = tonumber(args[2])
local direction = tostring(args[3])
local turnDirection  = direction

turtle.refuel()
turtle.select(2)
turtle.digUp()
turtle.digDown()
turtle.placeDown()

print("Strip mining length:", length)
print("Tunnel spacing:", width)

-- pastebin get r8MQS01f mine
-- mine 300 100 

function mineOverUnder()
    turtle.digUp()
    turtle.digDown()
end

for i = 1, width do
    if turtle.getFuelLevel() == 0 then
        local fuelSlots = {1, 5, 9, 13}
        local refueled = false
    
        for _, slot in ipairs(fuelSlots) do
            local itemDetail = turtle.getItemDetail(slot)
    
            if itemDetail 
            and itemDetail.name == "minecraft:coal_block" 
            and itemDetail.count > 0 then
                
                turtle.select(slot)
                turtle.refuel(1)  -- use 1 coal block
                refueled = true
                break
            end
        end
    
        if not refueled then
            print("No coal blocks found! Out of fuel.")
            return
        end
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
        if y % 8 == 0 and i % 8 == 1 then
            local torchDetail = turtle.getItemDetail(2)
            local torchSlot = 2
        
            if not torchDetail or torchDetail.name ~= "minecraft:torch" or torchDetail.count < 1 then
                torchDetail = turtle.getItemDetail(6)
                torchSlot = 6
            end
        
            if torchDetail and torchDetail.name == "minecraft:torch" and torchDetail.count > 0 then
                turtle.select(torchSlot)
                turtle.placeDown()
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
