function love.load()
    x = 370
    y = 450
    speed = 0
    acceleration = 0
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

    if love.keyboard.isDown( "up" ) then
        -- Quanto maior a velocidade, menor a variação de aceleração
        -- Isso simula a resistência do ar
        acceleration = 10 * (50 - speed) / 50
    elseif love.keyboard.isDown( "down" ) then
        acceleration = -30 -- freia muito: pé no freio
    else
        acceleration = -5 -- freia pouco: simula inércia
    end
end


function love.draw()
    love.graphics.draw(background_image)
    love.graphics.draw(car, x, y)
end
