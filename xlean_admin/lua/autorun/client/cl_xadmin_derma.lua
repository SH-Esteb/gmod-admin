-- Functions
function RespyX(py)
    return ScrW() / (1920 / py)
end

function RespyY(xy)
    return ScrH() / (1080 / xy)
end

-- Functions
concommand.Add("xlean_admin", function()
    if xadmin_config.Staff[LocalPlayer():GetUserGroup()] then
        local status = LocalPlayer():GetNWInt("XLean::Admin")
        local Base = vgui.Create("DFrame")
        Base:SetSize(RespyX(1000), RespyY(700))
        Base:Center()
        Base:SetTitle("")
        Base:MakePopup()
        Base:ShowCloseButton(false)

        function Base:Paint(w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(32, 32, 32))
            draw.RoundedBox(0, 0, 0, w, RespyY(50), Color(36, 36, 36))
        end

        local Close = vgui.Create("DLabel", Base)
        Close:SetText("❌")
        Close:SetSize(Close:GetTextSize())
        Close:SetPos(RespyX(975), RespyY(15))
        Close:SetMouseInputEnabled(true)

        function Close:DoClick()
            Base:Close()
        end

        local ServerName = vgui.Create("DLabel", Base)
        ServerName:SetText(xadmin_config.ServerName)
        ServerName:SetSize(RespyX(300), RespyY(15))
        ServerName:SetPos(RespyX(30), RespyY(17))
        ServerName:SetFont("XLean_Admin_Bold:15")

        function XLeanButton(name, x, y, w, h, func)
            local XLeanButtonDerma = vgui.Create("DButton", Base)
            XLeanButtonDerma:SetText(name)
            XLeanButtonDerma:SetPos(RespyX(x), RespyY(y))
            XLeanButtonDerma:SetSize(RespyX(w), RespyY(h))
            XLeanButtonDerma:SetTextColor(Color(255, 255, 255))
            XLeanButtonDerma:SetFont("XLean_Admin_Bold:15")
            XLeanButtonDerma.DoClick = func

            XLeanButtonDerma.Slide = 0

                    XLeanButtonDerma.OnCursorEntered = function(self)
            self.hover = true
            surface.PlaySound("UI/buttonrollover.wav")
        end

        XLeanButtonDerma.OnCursorExited = function(self)
            self.hover = false
        end

            function XLeanButtonDerma:Paint()
                if self.hover then
                    self.Slide = Lerp(0.02, self.Slide, w)
                    draw.RoundedBox(5, 0, 0, w, h, Color(36, 36, 36, 255))
                    draw.RoundedBox(5, 0, 0, self.Slide, h, Color(40, 40, 40, 255))
                else
                    self.Slide = Lerp(0.02, self.Slide, 0)
                    draw.RoundedBox(5, 0, 0, w, h, Color(36, 36, 36, 255))
                    draw.RoundedBox(5, 0, 0, self.Slide, h, Color(40, 40, 40, 255))
                end
            end
        end

        if status == 0 then
            XLeanButton("Passer en mode administrateur", 25, 80, 950, 50, function()
                net.Start("XLean::Admin")
                net.SendToServer()
                LocalPlayer():ConCommand("ulx noclip")
                Base:Close()
            end)
        else
            XLeanButton("Passer en mode roleplay", 25, 80, 950, 50, function()
                net.Start("XLean::Admin")
                net.SendToServer()
                Base:Close()
            end)
        end

        XLeanButton("Ouvrir ULX", 25, 150, 950, 50, function()
            LocalPlayer():ConCommand("say !menu")
            Base:Close()
        end)

        XLeanButton("Ouvrir les WARN", 25, 220, 950, 50, function()
            LocalPlayer():ConCommand("say " .. xadmin_config.Warn)
            Base:Close()
        end)

        XLeanButton("CleanUP", 25, 290, 950, 50, function()
            LocalPlayer():ConCommand("gmod_admin_cleanup")
            Base:Close()
        end)

        XLeanButton("Clears Decals", 25, 360, 950, 50, function()
            for k,v in pairs( player.GetAll() ) do
                v:ConCommand("r_cleardecals")
            end
            Base:Close()
        end)

        XLeanButton("Fermer le serveur", 25, 430, 950, 50, function()
            LocalPlayer():ConCommand("ulx rcon _restart")
            Base:Close()
        end)

        XLeanButton("Relancer le serveur", 25, 500, 950, 50, function()
            LocalPlayer():ConCommand("ulx rcon _restart")
            Base:Close()
        end)

    end
end)

hook.Add("OnPlayerChat", "XLean::Command", function(ply, strText, bTeam, bDead)
    if (ply ~= LocalPlayer()) then return end
    strText = string.lower(strText)

    if (strText == xadmin_config.Command) then
        ply:ConCommand("xlean_admin")

        return true
    end
end)