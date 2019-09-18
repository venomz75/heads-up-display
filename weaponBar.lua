require "base/internal/ui/reflexcore"

weaponBar = {}
registerWidget("weaponBar")

function weaponBar:draw()
    player = getPlayer()
    VMHUD_FONT = "RobotoMono-Bold"
    x = 40
    iconY = 400
    textY = 350
    colourBlack = Color(0,0,0,255)
    meleeItem = inventoryDefinitions[player.inventoryMelee]
    if not shouldShowHUD() then return end
        if  player ~= nil then
            --Rocket
            rocketX = -280
            if player.weaponIndexSelected == 6 then
                weaponSelected(rocketX)
            end
            nvgFontSize(40)
            nvgFontFace(VMHUD_FONT)
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon6",rocketX+2,iconY+2,30)
            nvgFillColor(player.weapons[6].color)
            nvgText(rocketX,textY, player.weapons[6].ammo)
            nvgSvg("internal/ui/icons/weapon6",rocketX-2,iconY-2,30)
            

            --Ion
            ionX = -200
            if player.weaponIndexSelected == 7 then
                weaponSelected(ionX)
            end
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon7",-x*5+2,iconY+2,30)
            nvgFillColor(player.weapons[7].color)
            nvgText(-200,textY, player.weapons[7].ammo)
            nvgSvg("internal/ui/icons/weapon7",-x*5,iconY-2,30)
            

            --Bolt
            boltX = -120
            if player.weaponIndexSelected == 8 then
                weaponSelected(boltX)
            end
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon8",-x*3+2,iconY+2,30)
            nvgFillColor(player.weapons[8].color)
            nvgText(-120,textY, player.weapons[8].ammo)
            nvgSvg("internal/ui/icons/weapon8",-x*3-2,iconY-2,30)
            

            --Shotgun
            shotgunX = -40
            if player.weaponIndexSelected == 3 then
                weaponSelected(shotgunX)
            end
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon3",-x+2,iconY+2,30)
            nvgFillColor(player.weapons[3].color)
            nvgText(-40,textY, player.weapons[3].ammo)
            nvgSvg("internal/ui/icons/weapon3",-x-2,iconY-2,30)
            

            --Grenade
            grenadeX = 40
            if player.weaponIndexSelected == 4 then
                weaponSelected(grenadeX)
            end
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon4",x+2,iconY+2,30)
            nvgFillColor(player.weapons[4].color)
            nvgText(40,textY, player.weapons[4].ammo)
            nvgSvg("internal/ui/icons/weapon4",x-2,iconY-2,30)
            

            --Plasma
            plasmaX = 120
            if player.weaponIndexSelected == 5 then
                weaponSelected(plasmaX)
            end
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon5",x*3+2,iconY+2,30)
            nvgFillColor(player.weapons[5].color)
            nvgText(120,textY, player.weapons[5].ammo)
            nvgSvg("internal/ui/icons/weapon5",x*3-2,iconY-2,30)
            
            
            --Burst
            burstX = 200
            if player.weaponIndexSelected == 2 then
                weaponSelected(burstX)
            end
            nvgFillColor(colourBlack)
            nvgSvg("internal/ui/icons/weapon2",x*5+2,iconY+2,30)
            nvgFillColor(player.weapons[2].color)
            nvgText(200,textY, player.weapons[2].ammo)
            nvgSvg("internal/ui/icons/weapon2",x*5-2,iconY-2,30)
            
            
            --Melee
            meleeX = 280
            if player.weaponIndexSelected == 1 then
                weaponSelected(meleeX)
            end
            nvgFillColor(colourBlack)
            nvgSvg(meleeItem.asset,meleeX+2,iconY+2,30)
            nvgFillColor(player.weapons[1].color)
            nvgSvg(meleeItem.asset,meleeX-2,iconY-2,30)

    end
end

function weaponSelected(x)
    nvgBeginPath()
    nvgRect(x-40,iconY-70,80,110)
    nvgFillColor(Color(0,0,0,100))
    nvgFill()
end