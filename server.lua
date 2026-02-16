
rednet.open('left')

print('turtle launcher v2')
print('========')
print('waiting for instruction: deploy or deploy')

while true do
    local senderPc, msg = rednet.receive()


    print('got message from computer:', senderPc, msg)

    if msg == "deploy" then
        rednet.send(senderPc, "OK: sending turtle now")
    else
        rednet.send(senderPc, "unknown command")
    end
end

