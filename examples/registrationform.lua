local ui = require("ui")
local vm = require("ecluart.vm")

local function isrequired(value)
  return (value ~= nil and value ~= "")
end

local function isinteger(value)
  return math.type(math.tointeger(value)) == "integer"
end

local function isitem2(value)
  return value == "Item 2"
end

local winMain = ui.Window("RegistrationForm", "fixed", 400, 400)
local vamMain = vm.ValidationManager()

local etyName = ui.Entry(winMain, "", 100, 20, 180)
local etyPassword = ui.Entry(winMain, "", 100, 52, 180)
local etyAge = ui.Entry(winMain, "", 100, 84, 40)
local etyEmail = ui.Entry(winMain, "", 100, 116, 180)
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80)

local lblName = ui.Label(winMain, "Name:", 10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153)

lblName.textalign = "left"
lblPassword.textalign = "left"
lblAge.textalign = "left"
lblEmail.textalign = "left"
lblCountry.textalign = "left"

local btnApply = ui.Button(winMain, "Apply Validation", 10, 210, 380)

vamMain:add(etyName, "text", isrequired, "name is required")
vamMain:add(etyAge, "text", isinteger, "age ist not an integer")
vamMain:add(cbbCountry, "text", isitem2, "country ist not Item2")

function btnApply:onClick()
  vamMain:apply()

  if vamMain.isvalid then return end

  local summary = ""
  for _, text in ipairs(vamMain.message) do
    summary = summary .. text .. "\n"
  end

  ui.info(summary)
end

winMain:show()

repeat
  ui.update()
until not winMain.visible
