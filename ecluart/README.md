# VM.LUA

The code is a Lua module for managing validations. It defines a ValidationManager object that handles the validation of input widgets.

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