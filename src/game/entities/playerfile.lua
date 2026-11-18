Player = {}
Player.__index = Player

function Player:new (screen_x_size, screen_y_size)
    local obj = {
        x = math.floor(screen_x_size / 2),
        y = math.floor(screen_x_size / 2),

        speed = 500
    }

    setmetatable(obj, self)

    return obj
end

function Player:update (dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    end

    if love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    end

    if love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
end

return {
    Player = Player
}