--[[
JSON4Lua example script.
Demonstrates the simple functionality of the json module.
]]--
json = require('json')

-- lua 5.1+ compat
local foreach = table.foreach or loadstring("local t,f = ... for k,v in pairs(t) do if f(k,v) ~= nil then break end end")


-- Object to JSON encode
test = {
  one='first',two='second',three={2,3,5}
}

jsonTest = json.encode(test)

print('JSON encoded test is: ' .. jsonTest)

-- Now JSON decode the json string
result = json.decode(jsonTest)

print ("The decoded table result:")
foreach(result, print)
print ("The decoded table result.three")
foreach(result.three, print)
