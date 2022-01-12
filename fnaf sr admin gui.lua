local GUI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local LeftDoor = Instance.new("TextButton")
local LeftLight = Instance.new("TextButton")
local RightLight = Instance.new("TextButton")
local RightDoor = Instance.new("TextButton")
local SpamDoors = Instance.new("TextButton")
local SpamLights = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local AutoGuard = Instance.new("TextButton")
local ag = false
GUI.Name = game:GetService("HttpService"):GenerateGUID(false)
GUI.Parent = game.CoreGui
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = GUI
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.Size = UDim2.new(0, 270, 0, 150)
Main.Position = UDim2.new(.5, 0, 0, 0)
Main.AnchorPoint = Vector2.new(.5, 0)

LeftDoor.Name = "LeftDoor"
LeftDoor.Parent = Main
LeftDoor.BackgroundColor3 = Color3.new(1, 0, 0)
LeftDoor.Position = UDim2.new(0, 10, 0, 10)
LeftDoor.Size = UDim2.new(0, 70, 0, 50)
LeftDoor.Font = Enum.Font.SourceSans
LeftDoor.Text = "LeftDoor"
LeftDoor.TextColor3 = Color3.new(0, 0, 0)
LeftDoor.TextSize = 14

LeftLight.Name = "LeftLight"
LeftLight.Parent = Main
LeftLight.BackgroundColor3 = Color3.new(1, 0, 0)
LeftLight.Position = UDim2.new(0, 10, 0, 65)
LeftLight.Size = UDim2.new(0, 70, 0, 30)
LeftLight.Font = Enum.Font.SourceSans
LeftLight.Text = "LeftLight"
LeftLight.TextColor3 = Color3.new(0, 0, 0)
LeftLight.TextSize = 14

RightLight.Name = "RightLight"
RightLight.Parent = Main
RightLight.BackgroundColor3 = Color3.new(1, 0, 0)
RightLight.Position = UDim2.new(0, 90, 0, 65)
RightLight.Size = UDim2.new(0, 70, 0, 30)
RightLight.Font = Enum.Font.SourceSans
RightLight.Text = "RightLight"
RightLight.TextColor3 = Color3.new(0, 0, 0)
RightLight.TextSize = 14

RightDoor.Name = "RightDoor"
RightDoor.Parent = Main
RightDoor.BackgroundColor3 = Color3.new(1, 0, 0)
RightDoor.Position = UDim2.new(0, 90, 0, 10)
RightDoor.Size = UDim2.new(0, 70, 0, 50)
RightDoor.Font = Enum.Font.SourceSans
RightDoor.Text = "RightDoor"
RightDoor.TextColor3 = Color3.new(0, 0, 0)
RightDoor.TextSize = 14

SpamDoors.Name = "SpamDoors"
SpamDoors.Parent = Main
SpamDoors.BackgroundColor3 = Color3.new(1, 0, 0)
SpamDoors.Position = UDim2.new(0, 190, 0, 10)
SpamDoors.Size = UDim2.new(0, 70, 0, 50)
SpamDoors.Font = Enum.Font.SourceSans
SpamDoors.Text = "SpamDoors"
SpamDoors.TextColor3 = Color3.new(0, 0, 0)
SpamDoors.TextSize = 14

SpamLights.Name = "SpamLights"
SpamLights.Parent = Main
SpamLights.BackgroundColor3 = Color3.new(1, 0, 0)
SpamLights.Position = UDim2.new(0, 190, 0, 65)
SpamLights.Size = UDim2.new(0, 70, 0, 30)
SpamLights.Font = Enum.Font.SourceSans
SpamLights.Text = "SpamLights"
SpamLights.TextColor3 = Color3.new(0, 0, 0)
SpamLights.TextSize = 14

Frame.Parent = Main
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 175, 0, 5)
Frame.Size = UDim2.new(0, 1, 0, 95)

AutoGuard.Name = "AutoGuard"
AutoGuard.Parent = Main
AutoGuard.AnchorPoint = Vector2.new(0, 1)
AutoGuard.BackgroundColor3 = Color3.new(1, 0, 0)
AutoGuard.Position = UDim2.new(0, 10, 1, -10)
AutoGuard.Size = UDim2.new(0, 250, 0, 35)
AutoGuard.Font = Enum.Font.SourceSans
AutoGuard.Text = "AutoGuard"
AutoGuard.TextColor3 = Color3.new(0, 0, 0)
AutoGuard.TextSize = 14

local c = false
local Anims = 'Animatronics'
local Cycle = 'MoveCycles'
local Animatronics = {}
local Doors = {}
Animatronics.Paths = {Bonnie = 1,Chica = 2,Freddy = 2,Foxy = 1}
function Animatronics:GetState(name)
    for i,v in next,workspace.FNaF[Cycle][name]:GetChildren() do
        if workspace.FNaF[Anims][name].HumanoidRootPart.CFrame == v.CFrame then
            return v
        end
    end
end
function Animatronics:GetLastState(name)
    local cycles = {}
    for i,v in next,workspace.FNaF[Cycle][name]:GetChildren() do
        if tonumber(v.Name) then
            table.insert(cycles,v.Name)
        end
    end
    local c 
    for i,v in next,cycles do
        if not c or tonumber(c)<tonumber(v) then
            c = v
        end
    end
    return c
end
function Doors:CheckLastState(side)
    if side == 1 then
        if (not Animatronics:GetState('Foxy') or Animatronics:GetState('Foxy') and Animatronics:GetState('Foxy').Name == 'EndFoxyRun') or (Animatronics:GetState('Bonnie') and Animatronics:GetState('Bonnie').Name == Animatronics:GetLastState('Bonnie')) then
            return true
        end
        elseif side == 2 then
        if (Animatronics:GetState('Chica') and Animatronics:GetState('Chica').Name == Animatronics:GetLastState('Chica')) or (Animatronics:GetState('Freddy') and (Animatronics:GetState('Freddy').Name == Animatronics:GetLastState('Freddy') or Animatronics:GetState('Freddy').Name == '5') ) then
            return true
        end
    end
    return false
end
function Doors:GetState(side)
    return game:GetService("Workspace").FNaF.Status['Door'..tostring(side)..'Closed'].Value
end
function Doors:Shut(side)
    if not Doors:GetState(side) then
        local button = game:GetService("Workspace").FNaF['DoorButtons'..tostring(side)]
        fireclickdetector(button.DoorButton.ClickDetector,2)
        
    end
end
function Doors:Open(side)
    if Doors:GetState(side) then
        local button = game:GetService("Workspace").FNaF['DoorButtons'..tostring(side)]
        fireclickdetector(button.DoorButton.ClickDetector,2)
    end
end





local toggles = {}


for i,v in next,Main:GetChildren() do
    if v ~= Frame then
        toggles[v.Name] = false
        v.MouseButton1Click:Connect(function()
            toggles[v.Name] = not toggles[v.Name]
            if toggles[v.Name] then
                v.BackgroundColor3 = Color3.new(0,1,0)
            else
                v.BackgroundColor3 = Color3.new(1,0,0)
            end
            if v == RightDoor then
                if not toggles[v.Name] then
                    Doors:Shut(2)
                else
                    Doors:Open(2)
                end
            end
            if v == LeftDoor then
                if not toggles[v.Name] then
                    Doors:Shut(1)
                else
                    Doors:Open(1)
                end
            end
        end)
    end
end
pcall(function()
toggles.RightDoor = Doors:GetState(2)
toggles.LeftDoor = Doors:GetState(1)
end)
game:GetService("Workspace").FNaF.Status['Door1Closed'].Changed:Connect(function()
    toggles.LeftDoor = Doors:GetState(1)
    if toggles.LeftDoor then
        LeftDoor.BackgroundColor3 = Color3.new(0,1,0)
    else
        LeftDoor.BackgroundColor3 = Color3.new(1,0,0)
    end
end)
game:GetService("Workspace").FNaF.Status['Door2Closed'].Changed:Connect(function()
    toggles.RightDoor = Doors:GetState(2)
    if toggles.RightDoor then
        RightDoor.BackgroundColor3 = Color3.new(0,1,0)
    else
        RightDoor.BackgroundColor3 = Color3.new(1,0,0)
    end
end)

game:GetService('RunService').RenderStepped:Connect(function()
    if workspace:FindFirstChild('FNaF') then
    if toggles['SpamDoors'] and c then
        Doors:Shut(1)
        Doors:Shut(2)
        c = false
    elseif toggles['SpamDoors'] and not c  then
        Doors:Open(1)
        Doors:Open(2)
        c = true
    end
    print(unpack(toggles))
    if toggles.AutoGuard then
        for i = 1,2 do
            local DoorClose = Doors:CheckLastState(i)
            print(DoorClose)
            if DoorClose then
                Doors:Shut(i)
            else
                Doors:Open(i)
            end
        end
    end
    end
end)
