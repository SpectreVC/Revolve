local Revolve = makefolder("Revolve")
local Saves = makefolder("Revolve/Saves")
local FirstTimeFol = "Revolve/Saves/FirstTime.json"


if not isfile(FirstTimeFol) then
    writefile(FirstTimeFol, game:GetService("HttpService"):JSONEncode(true))
end


local FirstTime = game:GetService("HttpService"):JSONDecode(readfile(FirstTimeFol))

if FirstTime then
local Sc = Instance.new("ScreenGui")
Sc.Parent = game:GetService("CoreGui")

for _, v in ipairs(game:GetDescendants()) do
if v.Name == "Revolve" and v:IsA("ScreenGui") then
v:Destroy()
end
end

local Color = Color3.fromRGB(205, 98, 152) 

local Sc = Instance.new("ScreenGui")
Sc.Name = "Revolve"
Sc.Parent = game:GetService("CoreGui")

local RevolveBackround = Instance.new("Frame")
RevolveBackround.Size = UDim2.new(0,260,0,200)
RevolveBackround.Position = UDim2.new(0,380,0,150)
RevolveBackround.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
RevolveBackround.BorderSizePixel = 0
RevolveBackround.Parent = Sc

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 9)  
Corner.Parent = RevolveBackround


local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 250, 0, 250)
Logo.Position = UDim2.new(0,0,0,-50)
Logo.Image = "rbxassetid://16556330154"
Logo.BackgroundTransparency = 1
Logo.Parent = RevolveBackround


local BarGhost = Instance.new("Frame")
BarGhost.Size = UDim2.new(0, 200, 0, 13)
BarGhost.Position = UDim2.new(0,30,0,160)
BarGhost.BackgroundTransparency = 1
BarGhost.BorderSizePixel = 0
BarGhost.Parent = RevolveBackround 

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.new(1, 1, 1)
Stroke.Parent = BarGhost

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(1, 0)  
Corner2.Parent = BarGhost

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 0, 13)
Bar.Position = UDim2.new(0,30,0,160)
Bar.BackgroundColor3 = Color
Bar.BackgroundTransparency = 0
Bar.BorderSizePixel = 0
Bar.Parent = RevolveBackround 

local Corner3 = Instance.new("UICorner")
Corner3.CornerRadius = UDim.new(1, 0)  
Corner3.Parent = Bar

local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(0, 30, 0,20)
Text.Position = UDim2.new(0,110,0,136)
Text.Text = "Checking For File..."
Text.TextSize = 16
Text.TextColor3 = Color3.new(1,1,1)
Text.BackgroundTransparency = 1
Text.Font = Enum.Font.SourceSansBold
Text.Parent = RevolveBackround

local TweenService = game:GetService("TweenService")
local target = UDim2.new(0, 200, 0, 13)
local Info = TweenInfo.new(5)
local tween = TweenService:Create(Bar, Info, {Size = target})
tween:Play()
task.wait(5)
Bar:Destroy()
Text:Destroy()
Logo:Destroy()
BarGhost:Destroy()

local target2 = UDim2.new(0,380,0,1000)
local Info2 = TweenInfo.new(2)
local tween2 = TweenService:Create(RevolveBackround, Info2, {Position = target2})
tween2:Play()
task.wait(2)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpectreVC/Revolve/Core/MainSrc.lua"))()--\\New Loadstring (V1)

    writefile(FirstTimeFol, game:GetService("HttpService"):JSONEncode(false))
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/SpectreVC/Revolve/Core/MainSrc.lua"))()
end
