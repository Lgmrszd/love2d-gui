local gui = {}
local widgets = {}

gui.current_font = love.graphics.getFont()

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

gui.widgets = widgets
return gui
