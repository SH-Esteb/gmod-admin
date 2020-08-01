hook.Add("HUDPaint", "Xlean_Admin_OverHead", function()
    if xadmin_config.Staff[LocalPlayer():GetUserGroup()] then
        local status = LocalPlayer():GetNWInt("XLean::Admin")

        if status == 1 then
            for k, v in pairs(player.GetAll()) do
                local heath = v:Health()
                local armor = v:Armor()
                local pos = v:GetShootPos()
                pos.z = pos.z + 5
                pos = pos:ToScreen()
                if not pos.visible then continue end
                local x, y = pos.x, pos.y

                if v:Alive() and v ~= LocalPlayer() then
                    if (v:IsAdmin()) then
                        draw.DrawText("★", "XLean_Admin_Bold:15", x - 2, y - 20, Color(200, 255, 255, 200), 1, 0, TEXT_ALIGN_CENTER) -- https://seafightpkp.jimdofree.com/caract%C3%A8res-sp%C3%A9ciaux/
                    else
                        draw.DrawText("●", "XLean_Admin_Bold:15", x - 2, y - 20, Color(200, 255, 255, 200), 1, 0, TEXT_ALIGN_CENTER) -- https://seafightpkp.jimdofree.com/caract%C3%A8res-sp%C3%A9ciaux/
                    end
                end

                if v:GetPos():Distance(LocalPlayer():GetPos()) < 2500 and v:Alive() and v ~= LocalPlayer() then
                    draw.RoundedBox(3, x - 50, y - 80, 100, 50, Color(32, 32, 32, 255))
                    draw.RoundedBox(3, x - 50, y - 63, 100, 5, Color(36, 36, 36, 255))
                    draw.RoundedBox(0, x - 50, y - 53, heath, 5, Color(200, 0, 0, 255))
                    draw.RoundedBox(0, x - 50, y - 45, armor, 5, Color(0, 0, 200, 255))
                    draw.DrawText(v:GetName(), "XLean_Admin_Bold:15", x, y - 80, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
                end
            end
        end
    end
end)