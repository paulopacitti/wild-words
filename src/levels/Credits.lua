local Credits = {}
local Gamestate = require("libs.gamestate")

local Text = require("src.objects.Text")
local SoundSystem = require("src.systems.SoundSystem")

function Credits:init()
  slides = {}
  slide_index = 1
  
  createdBy = {}
  createdBy[1] = Text:new({x = 0, y = 230 }, "credits_title", "center", "created by")
  createdBy[2] = Text:new({x = 0, y = 280 }, "credits_label", "center", "paulo pacitti")
  
  musicBy = {}
  musicBy[1] = Text:new({x = 0, y = 230 }, "credits_title", "center", "music by")
  musicBy[2] = Text:new({x = 0, y = 280 }, "credits_label", "center", "paulo pacitti")
  
  artBy = {}
  artBy[1] = Text:new({x = 0, y = 230 }, "credits_title", "center", "art by")
  artBy[2] = Text:new({x = 0, y = 280 }, "credits_label", "center", "gabriel teston")

  madeWith = {}
  madeWith[1] = Text:new({x = 0, y = 230 }, "credits_title", "center", "made with")
  madeWith[2] = Text:new({x = 0, y = 280 }, "credits_label", "center", "Love2D")
  madeWith[3] = Text:new({x = 0, y = 305 }, "credits_label", "center", "middleclass")
  madeWith[4] = Text:new({x = 0, y = 325 }, "credits_label", "center", "hump.gamestate")
  madeWith[5] = Text:new({x = 0, y = 345 }, "credits_label", "center", "wave")
  
  slides[1] = createdBy
  slides[2] = musicBy
  slides[3] = artBy
  slides[4] = madeWith
end

-- when re-entering the level, start from scratch
function Credits:enter()
  Credits:init()
end

function Credits:draw()
  for key, text in ipairs(slides[slide_index]) do
    text:draw()
  end
end

function Credits:update(dt)

end

function Credits:keypressed(key)
 if key == "escape" then
    Gamestate.pop()
  elseif key == "return" then
    if slide_index >= 4 then
      Gamestate.pop()
    else
      slide_index = slide_index + 1
    end
  end
end

return Credits