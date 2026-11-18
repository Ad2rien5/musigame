Enemie = {}
Enemie.__index = Enemie

function Enemie:new (screen_x_size, screen_y_size)
    local obj = {
        x = 0,
        y = 0,

        vx = 0,
        vy = 0,

        speed = 500,
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

function Enemie:update_pos (dt)
    if self.movement == "straight" then
        self.x, self.y = require("ai.straight").straight(
            self.x, self.y, self.vx, self.vy
        )
    end

end

function Enemie:update_status (speed, movement, size)
    self.speed = speed
    self.movement = movement
    self.size = size
end

function Enemie:draw()
    love.graphics.setColor(0, 0.8, 0.2)

    love.graphics.circle(
        "fill",
        self.x,
        self.y,
        12
    )
end

return {
    Enemie = Enemie
}