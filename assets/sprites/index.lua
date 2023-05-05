local sprites = {
    enemies = {
        dog = {
            stand = love.graphics.newImage("assets/sprites/dog/dog_4.png"),
            win = love.graphics.newImage("assets/sprites/dog/dog_5.png"),
            lost = love.graphics.newImage("assets/sprites/dog/dog_6.png"),
        },
        horse = {
            stand = love.graphics.newImage("assets/sprites/horse/horse_4.png"),
            win = love.graphics.newImage("assets/sprites/horse/horse_6.png"),
            lost = love.graphics.newImage("assets/sprites/horse/horse_5.png"),
        },
        pig = {
            stand = love.graphics.newImage("assets/sprites/pig/pig_6.png"),
            win = love.graphics.newImage("assets/sprites/pig/pig_1.png"),
            lost = love.graphics.newImage("assets/sprites/pig/pig_2.png"),
        }
    }
}

return sprites
