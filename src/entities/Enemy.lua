local Enemy = {}

function Enemy:new(spritesheet)
    local o = {
        spritesheet = spritesheet,
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Enemy:draw(playerState)
    if playerState == "stand" then
        love.graphics.draw(self.spritesheet["stand"], 200, 150)
    elseif playerState == "win" then
        love.graphics.draw(self.spritesheet["win"], 200, 150)
    elseif playerState == "lost" then
        love.graphics.draw(self.spritesheet["lost"], 200, 150)
    end
end

return Enemy
