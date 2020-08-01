util.AddNetworkString("XLean::Admin")

net.Receive("XLean::Admin", function(len, ply)
    if xadmin_config.Staff[ply:GetUserGroup()] then
        local status = ply:GetNWInt("XLean::Admin")

        if status == 0 then
            ply:SetNWInt("XLean::Admin", 1)
            ply:GodEnable()
        else
            ply:SetNWInt("XLean::Admin", 0)
            ply:GodDisable()
            ply:KillSilent()
        end
    end
end)