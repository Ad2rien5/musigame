local screen_x_size = 1280
local screen_y_size = 720

--- TEMPO ---
local spawntimer = 0
local despawntimer = 0
--- TEMPO ---

local playerfile = require("src.game.entities.player_file")
local player = playerfile.Player:new(screen_x_size, screen_y_size)

local enemie_manager = require("src.game.entities.enemie_manager")
local enemiesManager = enemie_manager.EnemieManager:new(
    screen_x_size, screen_y_size
)
enemiesManager:add()

function love.load()
    love.window.setMode(screen_x_size, screen_y_size)
end

function love.update(dt)
    player:update(dt)
    enemiesManager:update_pos(dt)

    --- TEMPO ---
    spawntimer = spawntimer + dt
    despawntimer = despawntimer + dt
    if spawntimer > 3 then
        enemiesManager:add()
        spawntimer = 0
    end
    if despawntimer > 5 then
        enemiesManager:del()
        despawntimer = 0
    end
    --- TEMPO ---
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