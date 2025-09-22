# ec-luart-validationmanager

The project is a validation management module written in Lua. It defines a ValidationManager object that handles validation of widgets in LuaRT desktop applications.

[![LuaRT 2.1.0](https://badgen.net/badge/LuaRT/2.1.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The project provides a modular and flexible way to manage validation in desktop applications. It allows  easy addition of widgets and their corresponding validation rule, as well as applying the error message. Several validation managers can be used in one application.

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

## Constructor

```Lua
ValidationManager() -> object
```

The code above initializes a new instance of the validation manager object. It returns the newly created object.

## Method - add

```Lua
ValidationManager:add(widget: object, property: string, rule: function, message: string) -> none
```

This method adds a widget, property, validation rule, and error message to the validation manager. It takes four parameters: widget (an object representing the widget), property (a string representing the property of the widget to be validated), rule (a function that performs the validation check), and message (a string representing the error message to be displayed if the validation fails). The method first checks if the widget parameter is a valid child widget using the isValidChild function. If it is not a valid child widget, the method returns. It then checks if the property parameter is a string, the rule parameter is a function, and the message parameter is a string. If any of these checks fail, the method returns. If all the checks pass, a new child object is created with the widget, property, rule, and message properties, and it is added to the children table of the validation manager.

## Method - apply

```Lua
ValidationManager:apply() -> none
```

This method performs validation checks for each widget added to the validation manager. It iterates through the children table and applies the validation rule to each child widget's property. If the validation fails, the error message associated with the child is added to the errorMessage table. If the errorMessage table is not empty, indicating that there are validation errors, the message property of the validation manager is set to the errorMessage table, and the isvalid property is set to false.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
