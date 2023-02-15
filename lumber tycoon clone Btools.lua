local plr = game:GetService("Players").LocalPlayer
function Destroy(...)
v = {...}
for i,v in next,v do
local args = {
    "",
    CFrame.new(Vector3.new(0,0,0), Vector3.new(0,0,0)),
    plr,
    v,
    true
}

game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedBlueprint:FireServer(unpack(args))
end
end
local nc; 
nc=hookfunction(getrawmetatable(game).__namecall,function(self,...) 
    if getnamecallmethod() == 'Destroy' and checkcaller() then 
        return Destroy(self) 
    end 
    return nc(self,...) 
end)

--[[
-- Deletes remotes so that admins have no power
for _,v in next,game.ReplicatedStorage:GetDescendants() do
    if v.Parent.Name ~= 'DefaultChatSystemChatEvents' and v.Name ~= 'ClientPlacedBlueprint' then
        if v:IsA('RemoteEvent') or v:IsA('RemoteFunction') then
            Destroy(v)
        end
    end
end


-- Wipe
for _,v in next,workspace.PlayerModels:GetChildren() do
    if v:FindFirstChild('Owner') and v.Owner.Value == plr then
        Destroy(v)
    end
end]]

local Tool = Instance.new('Tool',plr.Backpack)
Tool.Name = 'Delete'
Tool.TextureId = 'rbxassetid://29402763'
local MouseMove
local GUI = Instance.new('ScreenGui',game.CoreGui)
local Highlight = Instance.new('Highlight',GUI)
local Target
local TargetPos

Highlight.Enabled = true
Highlight.OutlineColor = Color3.new(1,.1,.1)
Highlight.FillColor = Color3.new(1,.3,.3)
Highlight.FillTransparency = .7
Highlight.OutlineTransparency = 0
Highlight.DepthMode = Enum.HighlightDepthMode.Occluded

Tool.RequiresHandle = false

Tool.Equipped:Connect(function(Mouse)
    MouseMove = game:GetService('UserInputService').InputChanged:Connect(function()
        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.LeftShift) then
            Target = Mouse.Target and Mouse.Target.Parent
            TargetPos = Mouse.Target.Position
        else
            Target = Mouse.Target
            TargetPos = Target.Position
        end
        Highlight.Adornee = Target
    end)
end)
Tool.Unequipped:Connect(function()
    MouseMove:Disconnect()
    Highlight.Adornee = nil
end)
Tool.Activated:Connect(function()
    local Explosion = Instance.new('Explosion',workspace)
    
    Explosion.Position = TargetPos
    Explosion.Visible = true
    Explosion.BlastPressure = 0
    Explosion.BlastRadius = 0
    Explosion.DestroyJointRadiusPercent = 0 
    Target:Destroy()
end)
