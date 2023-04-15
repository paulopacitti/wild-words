local Gamestate = require("libs.gamestate")
local Text = require("src.components.Text")
local Help = {}

function Help:init()
  self.slides = {}
  self.slide_index = 1

  local commands = {}
  commands[1] = Text:new({ x = 0, y = 230 }, "credits_title", "center", "Help")
  commands[2] = Text:new({ x = 0, y = 280 }, "credits_label", "center", "play = errr, kinda obvious")
  commands[3] = Text:new({ x = 0, y = 305 }, "credits_label", "center", "help = you're reading it right now")
  commands[4] = Text:new({ x = 0, y = 330 }, "credits_label", "center", "credits = who made this awesome game")

  self.slides[1] = commands
end

-- when re-entering the level, start from scratch
function Help:enter()
  Help:init()
end

function Help:draw()
  for key, text in ipairs(self.slides[self.slide_index]) do
    text:draw()
  end
end

function Help:update(dt)
end

function Help:keypressed(key)
  if key == "escape" then
    Gamestate.pop()
  elseif key == "return" then
    if self.slide_index >= 1 then
      Gamestate.pop()
    else
      self.slide_index = self.slide_index + 1
    end
  end
end

return Help
