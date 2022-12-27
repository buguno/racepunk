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

    -- Obstaculo (Poça d'água)
    puddle = false
    puddle_position = 0
    puddle_x = 0
    puddle_y = 0
    puddle_image = love.graphics.newImage("misc/images/puddle.png")
    puddle_sound = love.audio.newSource(
        "misc/sounds/effect/splash.mp3", "static"
    )
    rng = love.math.newRandomGenerator(love.timer.getTime())
end


function love.update(dt)
    if not end_game then
        if speed > 0 then
            if love.keyboard.isDown("left") and x > 250 then
                x = x - 200 * dt
            end

            if love.keyboard.isDown("right") and x < 490 then
                x = x + 200 * dt
            end
        end

        -- Ajusta o quanto ja percorreu em função da velocidade
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
    end

    -- Poça d'água
    if puddle then -- Se existe ou não poça na tela
        if puddle_position < traveled - 5 then -- Se o carro já passou ou não pela poça
            puddle = false
        else
            -- Atualiza a posição da poça no eixo y
            puddle_y = 450 - 30 * (puddle_position - traveled)
            if x + 55 > puddle_x and x < puddle_x + 60 and puddle_y + 65 > 450 and puddle_y < 455 then
                -- Verifica se há colisão e se houver, reduz a aceleração
                acceleration = acceleration - 4 * speed
                puddle_sound:setVolume(speed / 50)
                love.audio.play(puddle_sound)
            end
        end
    elseif rng:random() < 0.1 then
        -- Cria poça em 10% dos casos quando ela não existe
        puddle_position = traveled + 30
        puddle_x = 100 * rng:random(3) + 170
        -- Coloca a poça em uma das três faixas aleatoriamente
        puddle = true
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

    if time > 10 and not end_game then
        if traveled > 10000 then
            end_game = "PARABÉNS"
        else
            end_game = "VOCÊ PERDEU"
        end
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

    -- Desenha a poça d'água
    if puddle then
        love.graphics.draw(puddle_image, puddle_x, puddle_y)
    end

    -- Desenha o carro
    love.graphics.draw(car, x, y)

    love.graphics.print(string.format("Velocidade: %.2f mph", speed), 650, 540)
    love.graphics.print(string.format("Tempo: %.2f s", time), 650, 560)
    love.graphics.print(
        string.format("Percorrido: %.2f km", traveled/1000), 650, 580
    )
    love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    -- Desenha o fim do jogo
    if end_game then
        speed = 0
        love.graphics.print(end_game, 650, 520)
        love.audio.stop(music)
    end
end
