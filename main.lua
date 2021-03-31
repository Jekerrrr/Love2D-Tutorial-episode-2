function love.load()
    gravity = 0
    shouldAddGravity = true
    player = {}
    player.pos = {0, 0}
    sprite = love.graphics.newImage('crackable4.png')
    sprite:setFilter('nearest', 'nearest')
end

function love.update(dt)
    if shouldAddGravity == true then
        gravity = gravity + 0.525
    end
    player.pos[2] = player.pos[2] + gravity
    if love.keyboard.isDown('a') then
        player.pos[1] = player.pos[1] + -5
    end
    if love.keyboard.isDown('d') then
        player.pos[1] = player.pos[1] + 5
    end
    if (collisionCheck(player.pos[1], player.pos[2], 64, 64, 0, 500, 800, 64)) then
        onCollisionEvent('ground')
    end
end

function love.draw()
    love.graphics.draw(sprite, player.pos[1], player.pos[2], 0, 4, 4)
end

function collisionCheck(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
    x2 < x1 + w1 and
    y1 < y2 + h2 and
    y2 < y1 + h1
end

function onCollisionEvent(collisionType)
    if collisionType == 'ground' then
        gravity = 0
        shouldAddGravity = false
    end
end
