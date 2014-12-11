--[[
  Some Time Trails for the JSON4Lua package
--]]


require('json')
require('os')
require('table')

local mod = math.mod or math.fmod or (loadstring or load)("local a,b = ... return a % b")

local t1 = os.clock()
local jstr
local v
for i=1,100 do
  local t = {}
  for j=1,500 do
    table.insert(t,j)
  end
  for j=1,500 do
    table.insert(t,"VALUE\n\n\"\t")
  end
  jstr = json.encode(t)
  v = json.decode(jstr)
  --print(json.encode(t))
end

for i = 1,100 do
  local t = {}
  for j=1,500 do
    local m = mod(j,3)
    if (m==0) then
      t['a'..j] = true
    elseif m==1 then 
      t['a'..j] = json.null
    else
      t['a'..j] = j
    end
  end
  jstr = json.encode(t)
  v = json.decode(jstr)
end

--print (jstr)
--print(type(t1))
local t2 = os.clock()

print ("Elapsed time=" .. t2 - t1 .. "s")
