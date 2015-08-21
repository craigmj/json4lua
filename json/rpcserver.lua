-----------------------------------------------------------------------------
-- JSONRPC4Lua: JSON RPC server for exposing Lua objects as JSON RPC callable
-- objects via http.
-- json.rpcserver Module. 
-- Author: Craig Mason-Jones
-- Homepage: http://github.com/craigmj/json4lua/
-- Version: 1.0.0
-- This module is released under the MIT License (MIT).
-- Please see LICENCE.txt for details.
--
-- USAGE:
-- This module exposes one function:
--   server(luaClass, packReturn)
--     Manages incoming JSON RPC request forwarding the method call to the given
--     object. If packReturn is true, multiple return values are packed into an 
--     array on return.
--
-- IMPORTANT NOTES:
--   1. This version ought really not be 0.9.10, since this particular part of the 
--      JSONRPC4Lua package is very first-draft. However, the JSON4Lua package with which
--      it comes is quite solid, so there you have it :-)
--   2. This has only been tested with Xavante webserver, with which it works 
--      if you patch CGILua to accept 'text/plain' content type. See doc\cgilua_patch.html
--      for details.
----------------------------------------------------------------------------


local cgilua = require "cgilua"
local cjson_safe = require "cjson.safe"

--- @module json.rpcserver
local rpcserver = {}


---
-- Implements a JSON RPC Server wrapping for luaClass, exposing each of luaClass's
-- methods as JSON RPC callable methods.
-- @param luaClass The JSON RPC class to expose.
-- @param packReturn If true, the server will automatically wrap any
-- multiple-value returns into an array. Single returns remain single returns. If
-- false, when a function returns multiple values, only the first of these values will
-- be returned.
--
function rpcserver.serve(luaClass, packReturn)
  
  cgilua.contentheader('application','json-rpc')
  
  local postData = "{}"
  
  local jsonResponse = {}
  jsonResponse.result = nil
  jsonResponse.error = nil
  
  if cgilua.servervariable('REQUEST_METHOD') ~= "POST" then
    jsonResponse.error = "Please use HTTP POST"
  else
    postData = cgilua.POST[1]  --[[{ "id":1, "method":"echo","params":["Hi there"]}]]  --
    
    local jsonRequest, err = cjson_safe.decode(postData)
    if err then
      jsonResponse.error = "Failed to parse JSON POST data: " .. err
    else
      jsonResponse.id = jsonRequest.id
      local method = luaClass[ jsonRequest.method ]
    
      if not method then
        jsonResponse.error = 'Method ' .. jsonRequest.method .. ' does not exist at this server.'
      elseif type(jsonRequest.params) ~= "table" then
        jsonResponse.error = 'Invalid method parameters list "' .. cjson_safe.encode(jsonRequest.params) .. '".'
      else
        local callResult = { pcall( method, unpack( jsonRequest.params ) ) }
        if callResult[1] then -- Function call successfull
          table.remove(callResult,1)
          if packReturn and table.getn(callResult)>1 then
            jsonResponse.result = callResult
          else
            jsonResponse.result = unpack(callResult)  -- NB: Does not support multiple argument returns
          end
        else
          jsonResponse.error = callResult[2]
        end
      end
    end
  end
  
  -- Output the result
  local data, err = cjson_safe.encode( jsonResponse )
  if data == nil then
    jsonResponse.result = nil
    jsonResponse.error = "Failed to encode JSON response: " .. err
    data = cjson_safe.encode( jsonResponse )
  end
  cgilua.put( data )
end

return rpcserver
