local modules = {}
local p = io.popen('ls "' .. os.getenv("HOME") .. '/.config/hypr/modules"')
for file in p:lines() do
  if file:match("%.lua$") then
    table.insert(modules, (file:gsub("%.lua$", "")))
  end
end
p:close()

for _, name in ipairs(modules) do
  require("modules." .. name)
end
