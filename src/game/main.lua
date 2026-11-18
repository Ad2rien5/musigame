local playerfile = require("entities.playerfile")

local player = playerfile.Player:new(400, 300)

function love.load()
    love.window.setMode(800, 600)

end

function love.update(dt)
    player:update(dt)
end


function love.draw()
    love.graphics.setColor(1, 0.2, 0.2)

    love.graphics.circle(
        "fill",
        player.x,
        player.y,
        12
    )
end