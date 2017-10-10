# json4lua
JSON and JSONRPC for Lua

# Installation #
```
luarocks install --server=http://rocks.moonscript.org/manifests/amrhassan --local json4Lua
```

# JSON Usage #

## Encoding ##

```lua
json = require('json')
print(json.encode({ 1, 2, 'fred', {first='mars',second='venus',third='earth'} }))
```
```json
[1,2,"fred", {"first":"mars","second":"venus","third":"earth"}] 
```

## Decoding ##

```lua
json = require("json")
testString = [[ { "one":1 , "two":2, "primes":[2,3,5,7] } ]]
decoded = json.decode(testString)
for key, item pairs(decoded) do
    print(key, item)
end
print ("Primes are:")
for key, item ipairs(decoded.primes) do
    print(key, item)
end
```
```
one		1
two		2
Primes are:
1		2
2		3
3		5
4		7
```

# JSONRPC Usage #
```lua
json = require('json')
require("json.rpc")
server = json.rpc.proxy("http://jsolait.net/testj.py")
result, error = server.echo('Test echo!')
print(result)
```
```
Test echo!
```
