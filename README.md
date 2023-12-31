# ec-luart-validationmanager

The project is a validation management module written in Lua. It defines a ValidationManager object that handles validation of inputs in LuaRT desktop applications.

![Screenshot of the Regisatrtion Form](/readme.png)

[![Lua 5.4.6](https://badgen.net/badge/Lua/5.4.6/yellow)](https://github.com/lua/lua)
[![LuaRT 1.6.0](https://badgen.net/badge/LuaRT/1.6.0/blue)](https://github.com/samyeyo/LuaRT)
[![LuaCheck 1.1.1](https://badgen.net/badge/LuaCheck/1.1.1/green)](https://github.com/lunarmodules/luacheck)

## Features

The project provides a modular and flexible way to manage validation in desktop applications. It allows for easy addition of widgets and their corresponding validation rule, as well as applying the error message. Several validation managers can be used in one application.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "vm.lua" file into this folder.

```text
[application]
|
|----ecluart
|   |
|   |----vm.lua
|   |----...
|
|----app.wlua
```

## Usage

The validation manager (vm) can be loaded using the function *require()*:

```lua
local vm = require("ecluart.vm") 
```

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
