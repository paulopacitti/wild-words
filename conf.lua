function love.conf(t)
  t.version = "11.3"
  t.console = false
  t.window.title = "wild words"
  t.window.icon = nil
  t.window.width = 800
  t.window.height = 600
  t.window.borderless = false
  t.window.resizable = false
  t.window.fullscreen = false
  t.window.vsync = true
  t.window.display = 1
  t.window.highdpi = false
  t.window.srgb = false
  t.window.x = nil
  t.window.y = nil

  t.modules.audio = true              -- Enable the audio module (boolean)
  t.modules.data = true               -- Enable the data module (boolean)
  t.modules.event = true              -- Enable the event module (boolean)
  t.modules.font = true               -- Enable the font module (boolean)
  t.modules.graphics = true           -- Enable the graphics module (boolean)
  t.modules.image = true              -- Enable the image module (boolean)
  t.modules.keyboard = true           -- Enable the keyboard module (boolean)
  t.modules.math = true               -- Enable the math module (boolean)
  t.modules.mouse = true              -- Enable the mouse module (boolean)
  t.modules.physics = true            -- Enable the physics module (boolean)
  t.modules.sound = true              -- Enable the sound module (boolean)
  t.modules.system = true             -- Enable the system module (boolean)
  t.modules.thread = true             -- Enable the thread module (boolean)
  t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
  t.modules.window = true             -- Enable the window module (boolean)
end