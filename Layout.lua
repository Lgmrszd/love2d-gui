local gui_data = require("love2d-gui.gui_data")
local Widget = require("love2d-gui.Widget")

local Layout = {}
Layout.__index = Layout
setmetatable(Layout, {
  __index = Widget,
  __call = function()
      obj = setmetatable({}, Layout)
      obj:_init()
      return obj
  end
})

function Layout:_init()
  Widget._init(self)
  self.widgets = {}
end

function Layout:draw()
  Widget.draw(self)
  love.graphics.push()
  love.graphics.translate(self.x, self.y)
  for _, widget in ipairs(self.widgets) do
    widget:draw()
  end
  love.graphics.pop()
  if gui_data.debug.draw_borders then
    local color = {love.graphics.getColor()}
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.setColor(color)
  end
end

-- function Layout:add_widget(widget)
--   if #self.widgets == 0 then
--     table.insert(self.widgets, widget)
--     widget.parent = self
--     self:resize_widgets()
--   end
-- end

function Layout:add_widget(widget)
  table.insert(self.widgets, widget)
  if widget.parent then
    widget.parent:disown(widget)
  end
  widget.parent = self
end

function Layout:disown(widget)
  if widget.parent == self then
    for i = 1, #self.widgets do
      if self.widgets[i] == widget then
        table.remove(self.widgets, i)
      end
    end
  end
end

function Layout:resize(x, y)
  Widget.resize(self, x, y)
  -- self:resize_widgets()
end

function Layout:resize_widgets()
  -- if #self.widgets == 1 then
  --   local widget = self.widgets[1]
  --   if widget.resize_widgets then
  --     widget:move(self.x, self.y)
  --     widget:resize(self.w, self.h)
  --   end
  -- end
end

return Layout
