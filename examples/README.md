# Example

```Lua
local ui = require("ui") -- Import the "ui" module
local vm = require("ecluart.vm") -- Import the "ecluart.vm" module

local function isrequired(value)
  return (value ~= nil and value ~= "") -- Check if the value is not nil and not an empty string
end

local function isinteger(value)
  return math.type(math.tointeger(value)) == "integer" -- Check if the value is an integer
end

local function isitem2(value)
  return value == "Item 2" -- Check if the value is equal to "Item 2"
end

local winMain = ui.Window("RegistrationForm", "fixed", 400, 400) -- Create a new window with the title "RegistrationForm" and fixed dimensions of 400x400
local vamMain = vm.ValidationManager() -- Create a new instance of the ValidationManager class

local etyName = ui.Entry(winMain, "", 100, 20, 180) -- Create a new entry field with an empty initial value, positioned at (100, 20) with a width of 180
local etyPassword = ui.Entry(winMain, "", 100, 52, 180) -- Create a new entry field with an empty initial value, positioned at (100, 52) with a width of 180
local etyAge = ui.Entry(winMain, "", 100, 84, 40) -- Create a new entry field with an empty initial value, positioned at (100, 84) with a width of 40
local etyEmail = ui.Entry(winMain, "", 100, 116, 180) -- Create a new entry field with an empty initial value, positioned at (100, 116) with a width of 180
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80) -- Create a new combobox with the options "Item 1", "Item 2", and "Item 3", positioned at (100, 148) with a width of 80

local lblName = ui.Label(winMain, "Name:", 10, 25) -- Create a new label with the text "Name:", positioned at (10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57) -- Create a new label with the text "Password:", positioned at (10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89) -- Create a new label with the text "Age:", positioned at (10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121) -- Create a new label with the text "Email:", positioned at (10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153) -- Create a new label with the text "Country:", positioned at (10, 153)

local btnApply = ui.Button(winMain, "Apply Localization", 10, 210, 380) -- Create a new button with the label "Apply Localization", positioned at (10, 210) with a width of 380

vamMain:add(etyName, "text", isrequired, "name is required") -- Add the entry field "etyName" to the ValidationManager with the validation function "isrequired" and the error message "name is required"
vamMain:add(etyAge, "text", isinteger, "age ist not an integer") -- Add the entry field "etyAge" to the ValidationManager with the validation function "isinteger" and the error message "age is not an integer"
vamMain:add(cbbCountry, "text", isitem2, "country ist not Item2") -- Add the combobox "cbbCountry" to the ValidationManager with the validation function "isitem2" and the error message "country is not Item2"

function btnApply:onClick() -- Define the onClick event handler for the button "btnApply"
  vamMain:apply() -- Apply the validation rules

  if vamMain.isvalid then return end -- If the validation is successful, return

  local summary = "" -- Create an empty string to store the error summary
  for _, text in ipairs(vamMain.message) do -- Iterate over each error message in the ValidationManager
    summary = summary .. text .. "\n" -- Append the error message to the summary string
  end

  ui.info(summary) -- Display the error summary using the "info" function
end

winMain:show() -- Show the main window

repeat
  ui.update() -- Update the UI
until not winMain.visible -- Repeat until the main window is no longer visible
```
