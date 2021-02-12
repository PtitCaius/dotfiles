local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local math = require('math')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local icons = require('themes.icons')

-- configuration (à mettre dans le module config)
local osd_height = dpi(100)
local osd_width = dpi(300)
local osd_margin = dpi(10)
local volume_delta = 5

local osd_header = wibox.widget {
	text = 'Volume',
	font = 'Inter Bold 12',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox
}

local osd_value = wibox.widget {
	text = '0%',
	font = 'Inter Bold 12',
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}

local slider_osd = wibox.widget {
	nil,
	{
		id = 'vol_osd_slider',
		bar_shape = gears.shape.rounded_rect,
		bar_height = dpi(6),
		bar_color = beautiful.border_normal,
		bar_active_color = beautiful.border_focus,
		handle_color = beautiful.fg_normal,
		handle_shape = gears.shape.circle,
		handle_width = dpi(15),
		handle_border_color = '#00000012',
		handle_border_width = 0,
		maximum = 100,
		widget = wibox.widget.slider
	},
	nil,
	expand = 'none',
	layout = wibox.layout.align.vertical
}

local icon = wibox.widget {
	{
		image = icons.volume,
		resize = true,
		widget = wibox.widget.imagebox
	},
	top = dpi(12),
	bottom = dpi(12),
	widget = wibox.container.margin
}

local volume_slider_osd = wibox.widget {
	icon,
	slider_osd,
	spacing = dpi(24),
	layout = wibox.layout.fixed.horizontal
}

local vol_osd_slider = slider_osd.vol_osd_slider
vol_osd_slider.onClick = false



local update_osd = function(volume_level, mute)
  -- Update textbox widget text
  osd_value.text = volume_level .. '%'
  -- prevent setting the slider if the sliders called set_volume
  if not vol_osd_slider.onClick then
    vol_osd_slider:set_value(volume_level)
  end

  -- reset timer if needed
    awesome.emit_signal( 'module::volume_osd:rerun', true)
end

local spawn_amixer_command = function(command)
  awful.spawn.easy_async_with_shell(
    command,
    function(stdout)
      if awful.screen.focused().show_vol_osd then
        local volume = string.match(stdout, '(%d?%d?%d)%%')
        local mute = string.match(stdout, '(On|Off)')
        update_osd(tonumber(volume, mute))
      end
    end
  )
end

local set_volume = function(volume_delta, relative)
  sign = ''
  if relative then
    sign = '+'
    if volume_delta < 0 then
      sign = '-'
    end
  end
  spawn_amixer_command('amixer -D pulse sset Master '.. math.abs(volume_delta) .. '%' .. sign)
end

local toggle_mute = function()
  spawn_amixer_command('amixer -D pulse sset Master +1 toggle')
end



local placement_placer = function()
	local focused = awful.screen.focused()
		
	local info_center = focused.info_center
	local control_center = focused.control_center
	local volume_osd = focused.volume_osd_overlay

	if info_center and control_center then
		if info_center.visible then
			awful.placement.bottom_left(
				volume_osd,
				{
					margins = { 
						left = osd_margin,
						right = 0,
						top = 0,
						bottom = osd_margin
					},
					honor_workarea = true
				}
			)
			return
		end
	end

	if info_center then
		if info_center.visible then
			awful.placement.bottom_left(
				volume_osd,
				{
					margins = { 
						left = osd_margin,
						right = 0,
						top = 0,
						bottom = osd_margin
					},
					honor_workarea = true
				}
			)
			return
		end
	end

	awful.placement.bottom_right(
		volume_osd,
		{
			margins = { 
				left = 0,
				right = osd_margin,
				top = 0,
				bottom = osd_margin,
			},
			honor_workarea = true
		}
	)
end

local hide_osd = gears.timer {
	timeout = 2,
	autostart = false,
	callback  = function()
		local focused = awful.screen.focused()
		focused.volume_osd_overlay.visible = false
		focused.show_vol_osd = false
	end
}

screen.connect_signal(
	"request::desktop_decoration",
	function(s)

		local s = s or {}
		s.show_vol_osd = false
		
		-- Create the box
		s.volume_osd_overlay = awful.popup {
			widget = {
			  -- Removing this block will cause an error...
			},
			ontop = true,
			visible = false,
			type = 'notification',
			screen = s,
			height = osd_height,
			width = osd_width,
			maximum_height = osd_height,
			maximum_width = osd_width,
			offset = dpi(5),
			shape = function(cr,w, h)
                          gears.shape.rounded_rect(cr,w,h,dpi(5))
                        end,
			bg = beautiful.transparent,
			preferred_anchors = 'middle',
			preferred_positions = {'left', 'right', 'top', 'bottom'}
		}

		s.volume_osd_overlay : setup {
                  {
                    {
                      layout = wibox.layout.align.horizontal,
                      expand = 'none',
                      forced_height = dpi(48),
                      osd_header,
                      nil,
                      osd_value
                    },
                    volume_slider_osd,
                    layout = wibox.layout.fixed.vertical
                  },
                  left = dpi(24),
                  right = dpi(24),
                  widget = wibox.container.margin
		}

		-- Reset timer on mouse hover
		s.volume_osd_overlay:connect_signal(
			'mouse::enter', 
			function()
				awesome.emit_signal('module::volume_osd:rerun')
			end
		)
	end
)


vol_osd_slider:connect_signal(
'property::value',
function()
  if vol_osd_slider.onClick then
    local volume_level = vol_osd_slider:get_value()
    set_volume(volume_level, false)
  end
end
)

vol_osd_slider:connect_signal(
		'button::press',
		function()
		  vol_osd_slider.onClick = true
		end
)

awesome.connect_signal(
	'module::volume_osd:rerun',
	function()
		if hide_osd.started then
			hide_osd:again()
		else
			hide_osd:start()
		end
	end
)


awesome.connect_signal(
	'module::volume_osd:show', 
	function(bool)
		placement_placer()
		awful.screen.focused().volume_osd_overlay.visible = bool
                awful.screen.focused().show_vol_osd = bool

		if bool then
			awesome.emit_signal('module::volume_osd:rerun')
			awesome.emit_signal(
				'module::brightness_osd:show', 
				false
			)
		else
			if hide_osd.started then
				hide_osd:stop()
			end
		end
	end
)

--  vol_osd_slider.onClick = false because these signals come from outside 
awesome.connect_signal(
	'volume::raise',
	function()
          vol_osd_slider.onClick = false
          set_volume(volume_delta, true)
          if not awful.screen.focused().show_vol_osd then
            awesome.emit_signal('module::volume_osd:show', true)
          end
	end
)

awesome.connect_signal(
  'volume::lower',
  function()
    vol_osd_slider.onClick = false
    set_volume(-volume_delta, true)
    if not awful.screen.focused().show_vol_osd then
      awesome.emit_signal('module::volume_osd:show', true)
    end
  end
)

awesome.connect_signal(
  'volume::set',
  function(volume)
    vol_osd_slider.onClick = false
    set_volume(volume, false)
  end
)

awesome.connect_signal(
  'volume::toggle_mute',
  function()
    toggle_mute()
    if not awful.screen.focused().show_vol_osd then
      awesome.emit_signal('module::volume_osd:show', true)
    end
  end
)
