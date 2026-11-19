function straight (x, y, vx, vy, screen_x_size, screen_y_size)
    return (x + vx) % screen_x_size, (y + vy) % screen_y_size
end

return {
    straight = straight
}