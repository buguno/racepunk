function love.load()
    -- Dados do carro
    x = 370
    y = 450
    speed = 60
    acceleration = 0
    traveled = 0
    time = 0
    car = love.graphics.newImage("misc/images/car.png")

    -- Dados do ambiente
    end_game = false
    background_image = love.graphics.newImage("misc/images/background_test.png")
    strip_image = love.graphics.newImage("misc/images/strips.png")
    music = love.audio.newSource("misc/sounds/music/phase_01.mp3", "stream")
    love.audio.play(music)
end


function love.update(dt)
    if speed > 0 then
        if love.keyboard.isDown("left") and x > 250 then
            x = x - 200 * dt
        end

        if love.keyboard.isDown("right") and x < 490 then
            x = x + 200 * dt
        end
    end

    traveled = traveled + speed * dt

    if love.keyboard.isDown("up") then
        -- Quanto maior a velocidade, menor a variação de aceleração
        -- Isso simula a resistência do ar
        acceleration = 10 * (50 - speed) / 50
    elseif love.keyboard.isDown("down") then
        acceleration = -30 -- freia muito: pé no freio
    else
        acceleration = -5 -- freia pouco: simula inércia
    end

    -- Ajustes da aceleração e velocidade
    acceleration = acceleration * dt
    -- Aumenta a aceleração quando o loop
    -- demora mais e diminui quando o loop é mais lento
    speed = speed + acceleration
    if speed < 0 then
        speed = 0
    end

    -- Incrementa o tempo
    if not end_game then
        time = time + dt
    else
        acceleration = -10
    end
end


function love.draw()
    love.graphics.draw(background_image)

    -- Desenha faixas (sensação de velocidade)
    local position = (traveled % 4) * 30 - 60
    for strip_vertical_position=0, 5 do
        love.graphics.draw(
            strip_image, 345, position + strip_vertical_position * 120
        )
    end

    love.graphics.draw(car, x, y)

    love.graphics.print(string.format("Velocidade: %.2f mph", speed), 650, 540)
    love.graphics.print(string.format("Tempo: %.2f s", time), 650, 560)
    love.graphics.print(
        string.format("Percorrido: %.2f km", traveled/1000), 650, 580
    )
    love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
