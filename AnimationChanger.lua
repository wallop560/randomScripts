--getgenv().emotes = {cum=3823158750,penis=3360692915}
--getgenv().animationPack = 82
--getgenv().animations = {}

local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')
local MarketplaceService = game:GetService("MarketplaceService")



local LocalPlayer = Players.LocalPlayer

local Bundles = HttpService:JSONDecode(game:HttpGet('https://pastebin.com/raw/XppaAPF7'))

function ApplyAnimations(Animations,Character)
    local Animate = Character:FindFirstChild('Animate') or Character:WaitForChild('Animate')
    
    for Animation,Ids in next,Animations do
        local AnimObject = Animate:WaitForChild(Animation,4)
        for i,id in next,Ids do
            local AnimationObject

            if Animation == 'idle' then
                AnimationObject = AnimObject['Animation'..tostring(i)]
            elseif Animation == 'swim' and i == 2 then 
                AnimationObject = Animate:WaitForChild('swimidle',1):WaitForChild('SwimIdle',1) 
            elseif Animation == 'swim' then
                local firststchar = string.upper(string.sub(Animation,1,1))
                local restchar = string.sub(Animation,2,#Animation)
                local fullstr = firststchar..restchar

                AnimationObject = AnimObject[fullstr]
            else
                local firststchar = string.upper(string.sub(Animation,1,1))
                local restchar = string.sub(Animation,2,#Animation)
                local fullstr = firststchar..restchar

                AnimationObject = AnimObject[fullstr..'Anim']
            end
            AnimationObject.AnimationId = tostring(id)
        end
    end
end

function UpdateCharacter(Character)
    local Emotes = getgenv().emotes 
    local equipedEmotes = {}
    local AnimationPack = getgenv().animationPack
    local Animations = getgenv().animations
    local Humanoid = Character:FindFirstChildOfClass('Humanoid') or Character:WaitForChild('Humanoid')
    for _,v in next,Emotes do 
        if typeof(v) ~= 'table' then
            Emotes[_] = {v}
        end
        table.insert(equipedEmotes,tostring(_))
    end
    if getgenv().emotesEnabled then
        Humanoid.HumanoidDescription:SetEmotes(Emotes)
        Humanoid.HumanoidDescription:SetEquippedEmotes(equipedEmotes)
    end
    if getgenv().animationsEnabled then
        if AnimationPack and Bundles[AnimationPack] then
            ApplyAnimations(Bundles[AnimationPack],Character)
        else
            ApplyAnimations(Animations,Character)
        end
    end
end

--UpdateCharacter(LocalPlayer.Character)
pcall(UpdateCharacter,LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(UpdateCharacter)
