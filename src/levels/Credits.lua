local Gamestate = require("libs.gamestate")
local Text = require("src.objects.Text")
local Credits = {}

function Credits:init()
  self.slides = {}
  self.slide_index = 1

  local createdBy = {}
  createdBy[1] = Text:new({ x = 0, y = 230 }, "credits_title", "center", "created by")
  createdBy[2] = Text:new({ x = 0, y = 280 }, "credits_label", "center", "paulo pacitti")

  local musicBy = {}
  musicBy[1] = Text:new({ x = 0, y = 230 }, "credits_title", "center", "music by")
  musicBy[2] = Text:new({ x = 0, y = 280 }, "credits_label", "center", "paulo pacitti")

  local artBy = {}
  artBy[1] = Text:new({ x = 0, y = 230 }, "credits_title", "center", "art by")
  artBy[2] = Text:new({ x = 0, y = 280 }, "credits_label", "center", "gabriel teston")

  local madeWith = {}
  madeWith[1] = Text:new({ x = 0, y = 230 }, "credits_title", "center", "made with")
  madeWith[2] = Text:new({ x = 0, y = 280 }, "credits_label", "center", "Love2D")
  madeWith[3] = Text:new({ x = 0, y = 305 }, "credits_label", "center", "middleclass")
  madeWith[4] = Text:new({ x = 0, y = 325 }, "credits_label", "center", "hump.gamestate")
  madeWith[5] = Text:new({ x = 0, y = 345 }, "credits_label", "center", "wave")

  self.slides[1] = createdBy
  self.slides[2] = musicBy
  self.slides[3] = artBy
  self.slides[4] = madeWith
end

-- when re-entering the level, start from scratch
function Credits:enter()
  Credits:init()
end

function Credits:draw()
  for key, slide in ipairs(self.slides[self.slide_index]) do
    slide:draw()
  end
end

function Credits:update(dt)

end

function Credits:keypressed(key)
  if key == "escape" then
    Gamestate.pop()
  elseif key == "return" then
    if self.slide_index >= 4 then
      Gamestate.pop()
    else
      self.slide_index = self.slide_index + 1
    end
  end
end

return Credits
