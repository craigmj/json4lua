--[[
JSON4Lua example script.
Demonstrates the simple functionality of the json module.
]]--
json = require('json')


-- Object to JSON encode
test = {
  one='first',two='second',three={2,3,5}
}

jsonTest = json.encode(test)

print('JSON encoded test is: ' .. jsonTest)

-- Now JSON decode the json string
result = json.decode(jsonTest)

print ("The decoded table result:")
for key, item in pairs(result) do
    print(key, item)
end
print ("The decoded table result.three")
for i, item in ipairs(result.three) do
    print(i, item)
end
