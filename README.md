# jsonrpc4lua
JSON RPC over HTTP Lua module.  Fork of [json4lua](https://github.com/craigmj/json4lua), refactored to use [CJSON](http://www.kyne.com.au/~mark/software/lua-cjson.php).

## Dependencies
* lua >= 5.1
* luasocket
* cgilua (patch required)
* lua-cjson

Optional requirement to run the server-side example:
* xavante

## Installation
```
luarocks --local install jsonrpc4lua
```

## Required CGILua Fix
See https://github.com/pdxmeshnet/cgilua/commit/1b35d812c7d637b91f2ac0a8d91f9698ba84d8d9

## Usage
See examples directory.
