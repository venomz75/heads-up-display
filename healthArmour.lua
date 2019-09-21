require "base/internal/ui/reflexcore"
healthArmour = {}; registerWidget("healthArmour")

function healthArmour:draw()
    if not shouldShowHUD() then return end
        player = getPlayer()
        if  player ~= nil then
            VMHUD_FONT = "RobotoMono-Bold"; opacity = 170; x = -300; emptyBar = Color(0,0,0,100)
            mega = player.hasMega; health = player.health
            armourType = player.armorProtection; armourAmount = player.armor
            nvgFontSize(40); nvgFontFace(VMHUD_FONT); nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
            --get armour colour
            if (armourType == 0) then 
                armourColour = Color(0,255,0,opacity)
            elseif (armourType == 1) then 
                armourColour = Color(255,255,0,opacity)
            elseif (armourType == 2) then 
                armourColour = Color(255,0,0,opacity)
            end

            --get health colour
            if (health > 100) then
                healthColour = Color(0,255,255,opacity) --cyan
            elseif (health > 75) then
                healthColour = Color(0,255,0,opacity) --green
            elseif (health > 50) then
                healthColour = Color(255,255,0,opacity) --yellow
            elseif (health > 25) then
                healthColour = Color(255,128,0,opacity) --orange
            else
                healthColour = Color(255,0,0,opacity) --red
            end

            barVariables = {{175,200,health,healthColour},{235,260,armourAmount,armourColour}}
            --{y, textY, value, colour}
            for i = 1,2 do
                nvgBeginPath()
                nvgRect(x,barVariables[i][1],600,50)
                nvgFillColor(emptyBar)
                nvgFill()

                nvgBeginPath()
                nvgRect(x,barVariables[i][1],300*(barVariables[i][3]/100),50)
                nvgFillColor(barVariables[i][4])
                nvgFill()

                nvgFillColor(Color(0,0,0,255))
                nvgText(2,barVariables[i][2]+2,barVariables[i][3])
                nvgFillColor(Color(255,255,255,255))
                nvgText(0,barVariables[i][2],barVariables[i][3])
            end    
    end
end