print('startup ran')

local src = "disk/main"
local dst = "main"

if fs.exists(src) then
  if fs.exists(dst) then fs.delete(dst) end
  fs.copy(src, dst)
  shell.run(dst)
else
  print("Installer not found: "..src)
end

if fs.exists(src) then
    fs.copy(src, dst)
else
  print("Installer not found: "..src)
end

shell.run('job')