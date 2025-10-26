--- Defold API stubs for editor (silence undefined globals in Lua language servers)
--- Put this file in your workspace to help VSCode/Lua LSP understand Defold globals.
---@meta

-- vmath helpers
vmath = vmath or {}
function vmath.vector3(x,y,z) return { x = x or 0, y = y or 0, z = z or 0 } end
function vmath.vector4(r,g,b,a) return { x = r or 0, y = g or 0, z = b or 0, w = a or 1 } end

-- go API
go = go or {}
function go.get(url, property) end
function go.set(url, property, value) end
function go.get_position(url) return { x = 0, y = 0, z = 0 } end
function go.animate(url, property, playback, to, easing, duration, delay, callback) end
function go.cancel_animations(url, property) end

-- sprite API
sprite = sprite or {}
---@param url string
---@param name string
---@param value any
function sprite.set_constant(url, name, value) end

-- gui API
gui = gui or {}
function gui.get_node(name) end
function gui.set_color(node, color) end
function gui.set_scale(node, scale) end
function gui.pick_node(node, x, y) end
function gui.animate(node, property, to, easing, duration, delay, callback) end

-- msg API
msg = msg or {}
---@param url string
---@param id string|hash
---@param payload table
function msg.post(url, id, payload) end

-- sound (module)
sound = sound or {}
function sound.play(url, opts) end
function sound.stop(url) end

-- render API (minimal)
render = render or {}
function render.get_width() return 0 end
function render.get_height() return 0 end
function render.get_window_width() return 0 end
function render.get_window_height() return 0 end

-- timer helper
timer = timer or {}
function timer.delay(time, recurring, func) end

-- sys helper (minimal)
sys = sys or {}
function sys.get_save_file(a,b) return 'save' end
function sys.load(path) return {} end
function sys.save(path, data) return true end
function sys.get_config(k, default) return default end

-- basic math random seeding
math.random = math.random or function() return 1 end
math.randomseed = math.randomseed or function() end

return nil
