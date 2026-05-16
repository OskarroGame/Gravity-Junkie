function love.load()
    love.window.setTitle("Gravity Junkie")
    -- Tło
    love.graphics.setBackgroundColor(0, 0.8, 1)
    player = {
        x = love.graphics.getWidth() / 2 - 60,
        y = love.graphics.getHeight() / 2 - 60,
        spd = 250
    }
end

function love.update(dt)
    if love.keyboard.isDown("a") then player.x = player.x - player.spd * dt end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    -- Gracz
    love.graphics.rectangle("fill", player.x, player.y, 50, 50)

    -- Podłoga
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, love.graphics.getHeight() - (love.graphics.getHeight() / 2 - 250),
        love.graphics.getWidth(), love.graphics.getHeight() / 2 - 250, 0.5, 0.5)
end
