function love.load()
    x = 370
    y = 450
    background_image = love.graphics.newImage("misc/images/background_test.png")
    car = love.graphics.newImage("misc/images/car.png")
end


function love.update(dt)
    if love.keyboard.isDown("left") and x > 250 then
        x = x - 200 * dt
    end

    if love.keyboard.isDown("right") and x < 490 then
        x = x + 200 * dt
    end
end


function love.draw()
    love.graphics.draw(background_image)
    love.graphics.draw(car, x, y)
end
