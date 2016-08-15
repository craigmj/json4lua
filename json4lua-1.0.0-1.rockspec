package="JSON4Lua"
version="1.0.0"
source = {
  url = "git://github.com/craigmj/json4lua.git",
  tag = "1.0.0"
}
description = {
   summary = "JSON4Lua and JSONRPC4Lua implement JSON (JavaScript Object Notation) encoding and decoding and a JSON-RPC-over-http client for Lua.",
   detailed = [[
      JSON4Lua and JSONRPC4Lua implement JSON (JavaScript Object Notation)
      encoding and decoding and a JSON-RPC-over-http client for Lua.
      JSON is JavaScript Object Notation, a simple encoding of
      Javascript-like objects that is ideal for lightweight transmission
      of relatively weakly-typed data. A sub-package of JSON4Lua is
      JSONRPC4Lua, which provides a simple JSON-RPC-over-http client and server
      (in a CGILua environment) for Lua.
   ]],
   homepage = "http://github.com/craigmj/json4lua/",
   license = "GPL"
}
dependencies = {
   "lua >= 5.2",
   "luasocket",
}

build = {
   type = "builtin",
   modules = {
     ["json"] = "json/json.lua",
     ["json.rpc"] = "json/rpc.lua"
   }
}
