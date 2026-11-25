local screen_x_size = 1280
local screen_y_size = 720

--- TEMPO ---
local spawntimer = 0
local despawntimer = 0
--- TEMPO ---

local player_file = require("src.game.entities.player_file")
local player = player_file.Player:new(screen_x_size, screen_y_size)

local enemy_manager_file = require("src.game.entities.enemy_manager")
local enemysManager = enemy_manager_file.EnemyManager:new(
    screen_x_size, screen_y_size
)
enemysManager:add()

function love.load()
    love.window.setMode(screen_x_size, screen_y_size)
end

function love.update(dt)
    player:update(dt)
    enemysManager:update_pos(dt)

    --- TEMPO ---
    spawntimer = spawntimer + dt
    despawntimer = despawntimer + dt
    if spawntimer > 3 then
        enemysManager:add()
        spawntimer = 0
    end
    if despawntimer > 5 then
        enemysManager:del()
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

    enemysManager:draw()
end