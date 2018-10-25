--Button = require

local gui = {}
-- local widgets = {}
widgets = {}

local Widget = {}
Widget.__index = Widget

setmetatable(Widget, {
  __call = function()
      obj = setmetatable({}, Widget)
      obj:_init()
      return obj
  end
})

love.graphics.setNewFont(40)
font = love.graphics.getFont()
-- font:setDPIScale(2)

function Widget:_init()
  self.x = 0
  self.y = 0
  self.w = 0
  self.h = 0
  table.insert(widgets, self)
end

function gui.draw()
  for _, widget in pairs(widgets) do
    widget:draw()
  end
  love.graphics.print("gtest, \nh: "..font:getHeight(), 100, 100)

end

--gui.Button = Button
gui.Widget = Widget
gui.widgets = widgets
return gui
