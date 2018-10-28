gui = require("gui")
gui.Widget = require("gui.Widget")

local border = 5

local Button = {}
local color = {81/255, 81/255, 81/255, 1}
local hovered_color = {120/255, 120/255, 120/255, 1}
local pressed_color = {170/255, 170/255, 170/255, 1}
local text_color = {220/255, 220/255, 220/255, 1}
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
  self.w = assets.fonts.buttons_font:getWidth(self.text) + border*2
  self.h = assets.fonts.buttons_font:getHeight() + border*2
end

function Button:get_minimum_size()
  local min_w = assets.fonts.buttons_font:getWidth(self.text) + border*2
  local min_h = assets.fonts.buttons_font:getHeight() + border*2
  return min_w, min_h
end

function Button:resize(w, h)
  min_w, min_h = self:get_minimum_size()
  self.w = math.max(w, min_w)
  self.h = math.max(h, min_h)
  return self.w, self.h
end

function Button:move(x, y)
  self.x = x
  self.y = y
end

function Button:set_text(text)
  self.text = text
  self:resize(self.w, self.h)
end

function Button:has_clicked(x, y)
  self:set_text("I has been clicked!")
end

function Button:draw()
  local r, g, b, a = love.graphics.getColor()
  local previous_font = love.graphics.getFont()
  if self.is_pressed then
    love.graphics.setColor(pressed_color)
  elseif self.is_hovered then
    love.graphics.setColor(hovered_color)
  else
    love.graphics.setColor(color)
  end
  love.graphics.setFont(assets.fonts.buttons_font)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor(text_color)
  love.graphics.printf(self.text, self.x+border, self.y+border, self.w-border*2, "center")
  love.graphics.setColor(r, g, b, a)
  love.graphics.setFont(previous_font)
end

return Button
