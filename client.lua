local args = { ... }

local command = args[1] or "deploy"

local x = tonumber(args[2])
local y = tonumber(args[3])
local z = tonumber(args[4])

rednet.open("back")

local baseID = 12

-- If no coords provided, just send command
if x and y and z then
  rednet.send(baseID, { cmd = command, x = x, y = y, z = z })
else
  rednet.send(baseID, command)
end

local id, reply = rednet.receive()

print("reply:", reply)
