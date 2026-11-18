EnemieManager = {}
EnemieManager.__index = EnemieManager

local enemiefile = require("src.game.entities.enemie_file")

function EnemieManager:new (screen_x_size, screen_y_size)
    local obj = {
        screen_x = screen_x_size,
        screen_y = screen_y_size,

        enemies = {},

        speed = 200,
        movement = "straight",
        size = 12
    }

    setmetatable(obj, self)
    return obj
end

function EnemieManager:add ()
    local new_enemie = enemiefile.Enemie:new(self.screen_x, self.screen_y)

    table.insert(self.enemies, new_enemie)
    self:update_status()
    
end

function EnemieManager:del ()
    table.remove(self.enemies, 1)
end

function EnemieManager:update_status (speed, movement, size)
    if next(self.enemies) == nil then
        return
    end

    self.speed = speed or self.speed
    self.movement = movement or self.movement
    self.size = size or self.size

    for i = 1, #self.enemies do
        self.enemies[i]:update_status(
            self.speed, self.movement, self.size
        )
    end

end

function EnemieManager:update_pos (dt)
    if next(self.enemies) == nil then
        return
    end

    for i = 1, #self.enemies do
        self.enemies[i]:update_pos(dt)
    end

end

function EnemieManager:draw()
    for _, instance in ipairs(self.enemies) do
        instance:draw()
    end
end

return {
    EnemieManager = EnemieManager
}