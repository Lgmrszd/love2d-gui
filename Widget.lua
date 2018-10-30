local gui_data = require("love2d-gui.gui_data")

local Widget = {}

Widget.size_policies = {"fixed", "expand"}
Widget.default_size_policy = Widget.size_policies[2]

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
  self.h_size_policy = Widget.default_size_policy
  self.w_size_policy = Widget.default_size_policy
  self.font = gui_data.current_font
  table.insert(gui_data.widgets, self)
end

function Widget:set_font(font)
  self.font = font
  self:resize(self.w, self.h)
end

function Widget:move(x, y)
  self.x = x
  self.y = y
end

function Widget:resize(x, y)
  self.w = x
  self.h = y
end

-- function Widget:set_parent(parent)
--   self.parent = parent
-- end

function Widget:draw()
  local r, g, b, a = love.graphics.getColor()
  love.graphics.setColor(gui_data.background_color)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor(r, g, b, a)
end

function Widget:contains(x, y)
  return x > self.x and y > self.y and
  x < (self.x + self.w) and y < (self.y + self.h)
end

function Widget:position_absolute()
  local x = self.x
  local y = self.y
  parent = self.parent
  while parent do
    x = x + parent.x
    y = y + parent.y
    parent = parent.parent
  end
  return x, y
end

function Widget:contains_absolute(x, y)
  local my_x, my_y = self:position_absolute()
  return x > my_x and y > my_y and
  x < (my_x + self.w) and y < (my_y + self.h)
end

function Widget:has_clicked(x, y)
end

return Widget
