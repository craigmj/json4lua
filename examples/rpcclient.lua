
-- this example will work only if cgilua module has this fix https://github.com/pdxmeshnet/cgilua/commit/1b35d812c7d637b91f2ac0a8d91f9698ba84d8d9

local rpc = require("json.rpc")

server = rpc.proxy("http://localhost:8080/jsonrpc")
result, error = server.average(10,15,23)
if error then
  print(error)
else
  table.foreach(result, print)
end
