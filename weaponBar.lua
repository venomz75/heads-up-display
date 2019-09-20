require "base/internal/ui/reflexcore"
weaponBar = {}; registerWidget("weaponBar")

function weaponBar:draw()
    if not shouldShowHUD() then return end
    player = getPlayer()
        if  player ~= nil then
            --init
            VMHUD_FONT = "RobotoMono-Bold"; iconY = 400; textY = 350; colourBlack = Color(0,0,0,255)
            svgFilepath = "internal/ui/icons/weapon"; meleePath = inventoryDefinitions[player.inventoryMelee].asset;
            positions = {{6,-280},{7,-200},{8,-120},{3,-40},{4,40},{5,120},{2,200},{1,280}}
            nvgFontSize(40); nvgFontFace(VMHUD_FONT); nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
            --main loop
            for i = 1, 8 do
                x = positions[i][2]
                wep = positions[i][1] 
                --highlight selected weapon
                if player.weaponIndexSelected == wep then
                    weaponSelected(x)
                end
                --if melee, use its own skin icon
                if wep == 1 then
                    filepath = meleePath
                else
                    filepath = svgFilepath..wep
                end
                --drop shadow       
                nvgFillColor(colourBlack)
                nvgSvg(filepath,x+2,iconY+2,30)
                --icon
                nvgFillColor(player.weapons[wep].color)
                if wep ~= 1 then nvgText(x,textY, player.weapons[wep].ammo) end
                nvgSvg(filepath,x-2,iconY-2,30)       
            end
    end
end

function weaponSelected(x)
    nvgBeginPath()
    nvgRect(x-40,iconY-70,80,110)
    nvgFillColor(Color(0,0,0,100))
    nvgFill()
end
