Enemy = {}
Enemy.__index = Enemy

function Enemy:new (screen_x_size, screen_y_size)
    local obj = {
        screen_x = screen_x_size,
        screen_y = screen_y_size,

        x = 0,
        y = 0,

        vx = math.random(0, 8),
        vy = math.random(0, 8),

        speed = 300,
        movement = "straight",
        size = 12
    }

    if math.random(1, 2) == 1 then
        obj.x = math.random(0, screen_x_size)
        obj.y = 0
    else
        obj.x = 0
        obj.y = math.random(0, screen_y_size)
    end

    setmetatable(obj, self)
    return obj
end

function Enemy:update_pos (dt)
    if self.movement == "straight" then
        self.x, self.y = require("ai.straight").straight(
            self.x, self.y, self.vx, self.vy, self.screen_x, self.screen_y
        )
    end

end

function Enemy:update_status (speed, movement, size)
    self.speed = speed
    self.movement = movement
    self.size = size
end

function Enemy:draw()
    love.graphics.setColor(0, 0.8, 0.2)

    love.graphics.circle(
        "fill",
        self.x,
        self.y,
        12
    )
end

return {
    Enemy = Enemy
}