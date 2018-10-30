local gui = {}
local gui_data = require("love2d-gui.gui_data")
local Layout = require("love2d-gui.Layout")
gui.Button = require("love2d-gui.Button")
gui.HLayout = require("love2d-gui.HLayout")

function gui.load()
  gui.layout = Layout()
  gui_data.main_layout = gui.layout
  gui.layout:resize(love.graphics.getWidth(), love.graphics.getHeight())
  gui.current_font = love.graphics.getFont()
  gui.loaded = true
end

function gui.draw()
  -- if gui.loaded then
  --   for _, widget in pairs(gui_data.widgets) do
  --     widget:draw()
  --   end
  -- end
  gui.layout:draw()
end

function gui.set_layout(layout)
  gui.layout = layout
  gui.layout:resize(love.graphics.getWidth(), love.graphics.getHeight())
end

function gui.mousemoved(x, y, dx, dy)
  for _, widget in pairs(gui_data.widgets) do
    if widget:contains_absolute(x, y) then
      widget.is_hovered = true
    else
      widget.is_hovered = false
    end
  end
end

function gui.mousepressed(x, y, button, isTouch)
  for _, widget in pairs(gui_data.widgets) do
    if widget:contains_absolute(x, y) then
      widget.is_pressed = true
    else
      widget.is_pressed = false
    end
  end
end

function gui.mousereleased(x, y, button, isTouch)
  for _, widget in pairs(gui_data.widgets) do
    if widget.is_pressed then
      if widget:contains_absolute(x, y) then
        widget:has_clicked(x, y)
      end
    end
    widget.is_pressed = false
  end
end

return gui
