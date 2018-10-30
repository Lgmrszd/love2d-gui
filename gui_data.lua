local gui_data = {}

gui_data.current_font = love.graphics.getFont()
gui_data.background_color = {0.7, 0.7, 0.7, 1}

gui_data.widgets = {}
gui_data.main_layout = false

gui_data.debug = {}
gui_data.debug.draw_borders = true

return gui_data
