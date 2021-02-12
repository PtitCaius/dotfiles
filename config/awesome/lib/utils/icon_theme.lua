local lgi = require('lgi')
local icon_theme_gtk = lgi.Gtk.IconTheme.get_default()
local IconLookupFlags = lgi.Gtk.IconLookupFlags

local icon_size = 64
local icon_flags = {IconLookupFlags.GENERIC_FALLBACK}


self = {}

function self:lookup_icon(name)
  return icon_theme_gtk:lookup_icon(name, icon_size, icon_flags):load_surface()
end


self.volume_icons = {
  high = self:lookup_icon("audio-volume-high-symbolic"),
  medium = self:lookup_icon("audio-volume-medium-symbolic"),
  low = self:lookup_icon("audio-volume-low-symbolic"),
  muted = self:lookup_icon("audio-volume-muted-symbolic"),

}

self.brightness_icons = {

  high   = self:lookup_icon("display-brightness-high-symbolic"),
  medium = self:lookup_icon("display-brightness-medium-symbolic"),
  low    = self:lookup_icon("display-brightness-low-symbolic"),
}

return self
