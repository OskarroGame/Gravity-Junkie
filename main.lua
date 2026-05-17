function love.load()
    love.window.setTitle("Gravity Junkie")
    -- Tło
    love.graphics.setBackgroundColor(0, 0.8, 1)
    player = {
        x = love.graphics.getWidth() / 2 - 60,
        y = love.graphics.getHeight() / 2 - 60,
        spd = 250,
        fuel = 100
    }
    czcionka = love.graphics.newFont(32)
    stan = "game"
end

function love.update(dt)
    if stan == "game" then
        if love.keyboard.isDown("a") then player.x = player.x - player.spd * dt end

        if player.fuel <= 0 then
            stan = "game-over"
        end
    end
end

function love.keypressed(key)
    if stan == "game" then
        if key == "a" then
            player.fuel = player.fuel - 1
        end
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(czcionka)
    -- Gracz
    if stan == "game" then
        love.graphics.rectangle("fill", player.x, player.y, 50, 50)

        -- Podłoga
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 0, love.graphics.getHeight() - (love.graphics.getHeight() / 2 - 250),
            love.graphics.getWidth(), love.graphics.getHeight() / 2 - 250, 0.5, 0.5)

        -- Paliwo
        love.graphics.print("Fuel: " .. player.fuel, 10, 10)
    end
    if stan == "game-over" then
        love.graphics.print("Game over!", love.graphics.getWidth() / 2 - 60, love.graphics.getHeight() / 2 - 60)
    end
end
