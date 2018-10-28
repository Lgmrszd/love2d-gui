gui = require("gui")

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
  table.insert(gui.widgets, self)
end

function Widget:contains(x, y)
  return x > self.x and y > self.y and
  x < (self.x + self.w) and y < (self.y + self.h)
end

function Widget:has_clicked(x, y)
end

return Widget
