require "base/internal/ui/reflexcore"

healthArmour = {};
registerWidget("healthArmour");


function healthArmour:draw()
    if not shouldShowHUD() then return end;
        if  getLocalPlayer() ~= nil then
            mega = getLocalPlayer().hasMega;
            armourType = getLocalPlayer().armorProtection;
            armourAmount = getLocalPlayer().armor;
            health = getLocalPlayer().health;
            VMHUD_FONT = "RobotoMono-Bold"
            opacity = 170
            --choose armour colour
            if (armourType == 0) then 
                armourColour = Color(0,255,0,opacity);
            elseif (armourType == 1) then 
                armourColour = Color(255,255,0,opacity);
            elseif (armourType == 2) then 
                armourColour = Color(255,0,0,opacity);
            end

            --choose health colour
            if (health > 100) then
                healthColour = Color(0,255,255,opacity); --cyan
            elseif (health <= 100 and health > 75) then
                healthColour = Color(0,255,0,opacity); --green
            elseif (health <= 75 and health > 50) then
                healthColour = Color(255,255,0,opacity); --yellow
            elseif (health <= 50 and health > 25) then
                healthColour = Color(255,128,0,opacity); --orange
            elseif (health <= 25 and health > 0) then
                healthColour = Color(255,0,0,opacity); --red
            end

            --HEALTH
            --bar background
            nvgBeginPath()
            nvgRect(-300,175,600,50)
            nvgFillColor(Color(0,0,0,50))
            nvgFill()

            --healthbar
            nvgBeginPath()
            nvgRect(-300,175,300*(health/100),50)
            nvgFillColor(healthColour)
            nvgFill()

            --text shadow
            nvgFontSize(40);
            nvgFontFace(VMHUD_FONT);
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
            nvgFillColor(Color(0,0,0,255));
            nvgText(2,202, health);    
            
            --text
            nvgFontSize(40);
            nvgFontFace(VMHUD_FONT);
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
            nvgFillColor(Color(255,255,255,255));
            nvgText(0,200, health);    


            --ARMOUR
            --bar background
            nvgBeginPath()
            nvgRect(-300,235,600,50)
            nvgFillColor(Color(0,0,0,50))
            nvgFill()

            --armourbar
            nvgBeginPath()
            nvgRect(-300,235,300*(armourAmount/100),50)
            nvgFillColor(armourColour)
            nvgFill()            
            
            --text shadow
            nvgFontSize(40);
            nvgFontFace(VMHUD_FONT);
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
            nvgFillColor(Color(0,0,0,255));
            nvgText(2,262, armourAmount);

            --text
            nvgFontSize(40);
            nvgFontFace(VMHUD_FONT);
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
            nvgFillColor(Color(255,255,255,255));
            nvgText(0,260, armourAmount);
            
    end
end
