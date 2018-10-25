gui = require("gui")
local Button = {}
Button.__index = Button

setmetatable(Button, {
  __index = gui.Widget,
  __call = function()
      obj = setmetatable({}, Button)
      obj:_init()
      return obj
  end
})

function Button:_init()
  gui.Widget._init(self)
  self.text = "Button"
  self.w = 100
  self.h = 40
  self.color = {200/255, 200/255, 30/255, 1}
end

function Button:draw()
  local r, g, b, a = love.graphics.getColor()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor(r, g, b, a)
end

return Button
