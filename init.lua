assets = require("assets")

local gui = {}
local widgets = {}

local Widget = {}
Widget.__index = Widget
setmetatable(Widget, {
  __call = function()
      obj = setmetatable({}, Widget)
      obj:_init()
      return obj
  end
})
function Widget:_init()
  self.x = 0
  self.y = 0
  self.w = 0
  self.h = 0
  self.is_hovered = false
  self.is_pressed = false
  table.insert(widgets, self)
end

function Widget:contains(x, y)
  return x > self.x and y > self.y and
  x < (self.x + self.w) and y < (self.y + self.h)
end

function Widget:has_clicked(x, y)
end

function gui.draw()
  for _, widget in pairs(widgets) do
    widget:draw()
  end
end

function gui.mousemoved(x, y, dx, dy)
  for _, widget in pairs(widgets) do
    if widget:contains(x, y) then
      widget.is_hovered = true
    else
      widget.is_hovered = false
    end
  end
end

function gui.mousepressed(x, y, dx, dy)
  for _, widget in pairs(widgets) do
    if widget:contains(x, y) then
      widget.is_pressed = true
    else
      widget.is_pressed = false
    end
  end
end

function gui.mousereleased(x, y, dx, dy)
  for _, widget in pairs(widgets) do
    if widget.is_pressed then
      if widget:contains(x, y) then
        widget:has_clicked(x, y)
      end
    end
    widget.is_pressed = false
  end
end

--gui.Button = Button
gui.Widget = Widget
gui.widgets = widgets
return gui
