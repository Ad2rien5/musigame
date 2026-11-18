local playerfile = require("src.game.entities.player_file")
local player = playerfile.Player:new(640, 460)

local enemie_manager = require("src.game.entities.enemie_manager")
local enemiesManager = enemie_manager.EnemieManager:new(1280, 720)
enemiesManager:add()

function love.load()
    love.window.setMode(1280, 720)
end

function love.update(dt)
    player:update(dt)
    enemiesManager:update_pos(dt)

    if dt % 2 == 0 then
        enemiesManager:add()
    end
    if dt % 5 == 0 then
        enemiesManager:del()
    end
end


function love.draw()
    love.graphics.setColor(1, 0.2, 0.2)

    love.graphics.circle(
        "fill",
        player.x,
        player.y,
        12
    )

    enemiesManager:draw()
end