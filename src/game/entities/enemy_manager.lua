EnemyManager = {}
EnemyManager.__index = EnemyManager

local enemyfile = require("src.game.entities.enemy_file")

function EnemyManager:new (screen_x_size, screen_y_size)
    local obj = {
        screen_x = screen_x_size,
        screen_y = screen_y_size,

        enemys = {},

        speed = 200,
        movement = "straight",
        size = 12
    }

    setmetatable(obj, self)
    return obj
end

function EnemyManager:add ()
    local new_enemy = enemyfile.Enemy:new(self.screen_x, self.screen_y)

    table.insert(self.enemys, new_enemy)
    self:update_status()
    
end

function EnemyManager:del ()
    table.remove(self.enemys, 1)
end

function EnemyManager:update_status (speed, movement, size)
    if next(self.enemys) == nil then
        return
    end

    self.speed = speed or self.speed
    self.movement = movement or self.movement
    self.size = size or self.size

    for i = 1, #self.enemys do
        self.enemys[i]:update_status(
            self.speed, self.movement, self.size
        )
    end

end

function EnemyManager:update_pos (dt)
    if next(self.enemys) == nil then
        return
    end

    for i = 1, #self.enemys do
        self.enemys[i]:update_pos(dt)
    end

end

function EnemyManager:draw()
    for _, instance in ipairs(self.enemys) do
        instance:draw()
    end
end

return {
    EnemyManager = EnemyManager
}