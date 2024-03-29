require "base/internal/ui/reflexcore"
jumpCircle = {}; registerWidget("jumpCircle")

function jumpCircle:draw()
    if not shouldShowHUD() then return end
    player = getPlayer()
        if  player ~= nil then
            airTime = player.jumpTimer
            timeLimit = 400
            timeTaken = airTime / timeLimit--0>1
            inverseTimeTaken = 1 - timeTaken--1>0
            nvgBeginPath()
            if airTime <= timeLimit then            
                nvgCircle(0,0,100*inverseTimeTaken)
                nvgFillColor(Color(255*timeTaken,255*inverseTimeTaken,0,200*timeTaken))
            elseif airTime > timeLimit then
                nvgCircle(0,0,100)
                nvgFillColor(Color(0,255,0,0))
            end     
            nvgFill()
    end
end