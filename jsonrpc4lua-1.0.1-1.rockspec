package="JSONRPC4Lua"
version="1.0.1-1"
source = {
  url = "git://github.com/pdxmeshnet/jsonrpc4lua.git",
  tag = "1.0.1"
}
description = {
   summary = "JSONRPC4Lua implement JSON-RPC-over-http client and server-side for Lua.",
   detailed = [[
      JSONRPC4Lua implement JSON-RPC-over-http client and server-side for Lua.
      JSON is JavaScript Object Notation, a simple encoding of
      Javascript-like objects that is ideal for lightweight transmission
      of relatively weakly-typed data.  RPC is an inter-process communication
      mechanism that allows a computer program to cause a subroutine to
      execute in a program running on a remote host.  JSONRPC4Lua provides a
      simple JSON-RPC-over-http client and server-side (in a CGILua
      environment) for Lua.
   ]],
   homepage = "http://github.com/pdxmeshnet/jsonrpc4lua/",
   license = "GPL"
}
dependencies = {
   "lua >= 5.1",
   "luasocket",
   "cgilua",
   "lua-cjson",
}

build = {
   type = "builtin",
   modules = {
     ["json.rpc"] = "json/rpc.lua",
     ["json.rpcserver"] = "json/rpcserver.lua"
   }
}
