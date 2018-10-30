local Layout = require("love2d-gui.Layout")

local HLayout = {}
HLayout.__index = HLayout
setmetatable(HLayout, {
  __index = Layout,
  __call = function()
      obj = setmetatable({}, HLayout)
      obj:_init()
      return obj
  end
})

function HLayout:_init()
  Layout._init(self)
end

function HLayout:add_widget(widget)
  Layout.add_widget(self, widget)
  self:resize_widgets()
end

function Layout:resize(x, y)
  Widget.resize(self, x, y)
  self:resize_widgets()
end

function HLayout:resize_widgets()
  local total_widgets = #self.widgets
  print("tw: "..total_widgets)
  print(self.w)
  if total_widgets > 0 then
    local rel_y = self.h/total_widgets
    local total_y = 0
    for _, widget in ipairs(self.widgets) do
      widget:move(0, total_y)
      widget:resize(self.w, rel_y)
      total_y = total_y + rel_y
    end
  end
end



return HLayout
