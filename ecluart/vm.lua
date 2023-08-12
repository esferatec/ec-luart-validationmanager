-- Defines a configuration management module.
local vm = {}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local childType = type(parameter)
  local invalidTypes = {
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread" }

  for _, invalidType in ipairs(invalidTypes) do
    if string.find(childType, invalidType) then return false end
  end

  return true
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
local function isString(parameter)
  return type(parameter) == "string"
end

-- Checks if the paramter is a function type.
-- isFunction(parameter: any) -> boolean
local function isFunction(parameter)
  return type(parameter) == "function"
end

-- Defines the validation manager object.
local ValidationManager = Object({})

-- Creates the validation manager constructor.
function ValidationManager:constructor()
  self.isvalid = true
  self.message = {}
  self.children = {}
end

-- Adds a widget, property, validation rule and error message.
-- add(widget: object, property: string, rule: function, message: string) -> none
function ValidationManager:add(widget, property, rule, message)
  if not isValidChild(widget) then return end
  if not isString(property) then return end
  if not isFunction(rule) then return end
  if not isString(message) then return end

  local newChild = {}
  newChild.widget = widget
  newChild.property = property
  newChild.rule = rule
  newChild.message = message

  table.insert(self.children, newChild)
end

-- Performs validation checks for each widget.
-- apply() -> none
function ValidationManager:apply()
  local errorMessage = {}

  for _, child in pairs(self.children) do
    local validationResult = child.rule(child.widget[child.property])
    if not validationResult then
      table.insert(errorMessage, child.message)
    end
  end

  if next(errorMessage) ~= nil then
    self.message = errorMessage
    self.isvalid = false
  end
end

-- Initializes a new validation manager instance.
-- ValidationManager() -> object
function vm.ValidationManager()
  return ValidationManager()
end

return vm
