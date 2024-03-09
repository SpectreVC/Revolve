

repeat task.wait() until game:IsLoaded()

local Revolve = Instance.new("ScreenGui")
Revolve.Name = "Revolve"
Revolve.Enabled = false
Revolve.Parent = game:GetService('CoreGui')
local Color1 = Color3.fromRGB(138, 43, 226)
local Color2 = Color3.fromRGB(205, 98, 152) 
local Yellow = Color3.fromRGB(255, 215, 0)
local TWS = game:GetService("TweenService")
local Players = game:GetService("Players")

local Revolve2 = Instance.new("ScreenGui")
Revolve2.Name = "RevolveSecondary"
Revolve2.Parent = game:GetService("CoreGui")




local function SetCorner(Parent, Size)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, Size)
    Corner.Parent = Parent
end


  local darkBlueViolet = Color3.fromRGB(75, 0, 130)  
local lightPurple = Color3.fromRGB(148, 0, 211) 

game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("hotbar")["1"]:WaitForChild("HotbarHealthbarContainer").HealthbarProgressWrapper["1"].BackgroundColor3 = Color3.fromRGB(75, 0, 130)  


local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
for _, v in ipairs(PlayerGui:GetDescendants()) do
    if v.Name == "hotbar" then
        for _, v1 in ipairs(v:GetDescendants()) do
            if v1.Name == "1" then
                for _, v2 in ipairs(v1:GetDescendants()) do
                    if v2.Name:lower() == "itemshotbar" then
                        for _, v3 in ipairs(v2:GetDescendants()) do
                            if v3:IsA("ImageButton") then
                                SetCorner(v3, 9)
                            end
                            if v3:IsA("Frame") then
                                v3.BackgroundTransparency = 0.4
                                SetCorner(v3, 9)
                                v3.BorderSizePixel = 0
                                
                                local gradient = Instance.new("UIGradient")
                                gradient.Rotation = 0
                                gradient.Color = ColorSequence.new {
                                    ColorSequenceKeypoint.new(0, darkBlueViolet),
                                    ColorSequenceKeypoint.new(1, lightPurple)
                                }
                                gradient.Parent = v3
                            end
                        end
                    end
                end
            end
        end
    end
end



local function CreateCustomNotification(Params)
local NotificationBackground = Instance.new("Frame")
NotificationBackground.Size = UDim2.new(0, 400, 0, 110)
NotificationBackground.Position = UDim2.new(0, 690, 0, 500)
NotificationBackground.BackgroundColor3 = Color3.new(0.06, 0.06, 0.06)
NotificationBackground.BackgroundTransparency = 0.2
NotificationBackground.BorderSizePixel = 0
NotificationBackground.Parent = Revolve2


local Info1 = TweenInfo.new(1)
local Target1 = UDim2.new(0,690,0,220)
local Tween = TWS:Create(NotificationBackground, Info1, {Position = Target1})
Tween:Play()


local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = NotificationBackground

local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 20, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))
    }
    gradient.Parent = NotificationBackground


local Tittle = Instance.new("TextLabel")
Tittle.Size = UDim2.new(0, 10, 0, 10)
Tittle.BackgroundTransparency = 1
Tittle.Position = UDim2.new(0,30,0,10)
Tittle.Text = "Revolve"
Tittle.Font = Enum.Font.SourceSansBold 
Tittle.TextColor3 = Color3.new(1,1,1)
Tittle.TextSize = 18
Tittle.Parent = NotificationBackground

local Line = Instance.new("Frame")
Line.Size = UDim2.new(0, 400, 0, 3)
Line.Position = UDim2.new(0,0,0,106)
Line.BackgroundColor3 = Color3.new(1,1,1)
Line.BorderSizePixel = 0
Line.Parent = NotificationBackground

local content = Instance.new("TextLabel")
content.Size = UDim2.new(0,10,0,10)
content.Position= UDim2.new(0,140,0,50)
content.BackgroundTransparency = 1
content.Text = Params.Content
content.TextColor3 = Color3.new(1,1,1)
content.Font = Enum.Font.SourceSansBold 
content.TextSize = 20
content.Parent = NotificationBackground

local Timer = Params.Time

local Info3 = TweenInfo.new(Timer)
local Target3 = UDim2.new(0, 0, 0, 3)
local Tween3 = TWS:Create(Line, Info3, {Size = Target3})
Tween3:Play()
wait(Timer)
local Info2 = TweenInfo.new(1)
local Target2 = UDim2.new(0,1300,0,220)
local Tween2 = TWS:Create(NotificationBackground, Info2, {Position = Target2})
Tween2:Play()
task.wait(3)
NotificationBackground:Destroy()
return NotificationBackground
end

local function SendNotification(Time, Content)
CreateCustomNotification({
  Time = Time,
  Content = Content
})
end


local range = 18
local Table = {}
local function CreateTargetHud(player, index)
    local existingHUD = Table[player]
    if existingHUD then
        existingHUD:Destroy()
    end
    
    local HudBackround = Instance.new("Frame")
    HudBackround.Size = UDim2.new(0, 250, 0, 80)
    HudBackround.Position = UDim2.new(0, 450, 0, 300 + (index * 85)) 
    HudBackround.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    HudBackround.BackgroundTransparency = 0.2
    HudBackround.Visible = true
    HudBackround.BorderSizePixel = 0
    HudBackround.Parent = Revolve2

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(123, 104, 238)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 191, 255))
    }
    gradient.Parent = HudBackround

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = HudBackround

    local Face = Instance.new("ImageLabel")
    Face.Size = UDim2.new(0, 60, 0, 60)
    Face.Position = UDim2.new(0,40,0,35) 
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
    Face.Parent = HudBackround

    local HealthBarGhost = Instance.new("Frame")
    HealthBarGhost.Size = UDim2.new(0, 160, 0, 6)
    HealthBarGhost.Position = UDim2.new(0,80,0,55)
    HealthBarGhost.BackgroundTransparency = 1
    HealthBarGhost.Parent = HudBackround

    local Corner2 = Instance.new("UICorner")
    Corner2.CornerRadius = UDim.new(0, 7)
    Corner2.Parent = HealthBarGhost

    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 2
    Stroke.Color = Color3.new(1,1,1)
    Stroke.Parent = HealthBarGhost

    local HealthBar = Instance.new("Frame")
    HealthBar.Size = UDim2.new(0, 160, 0, 6) 
    HealthBar.Position = UDim2.new(0, 80, 0, 55)
    HealthBar.BackgroundColor3 = Color3.fromRGB(173, 255, 47)
    HealthBar.BorderSizePixel = 0
    HealthBar.BackgroundTransparency = 0
    HealthBar.Parent = HudBackround

    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(0, 10, 0, 10)
    Name.Position = UDim2.new(0, 110, 0, 40)
    Name.BackgroundTransparency = 1
    Name.Text = player.Name
    Name.TextColor3 = Color3.new(1,1,1)
    Name.TextSize = 15
    Name.Font = Enum.Font.SourceSansBold 
    Name.Parent = HudBackround

    Table[player] = HudBackround
    player.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        local healthPercentage = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
        HealthBar.Size = UDim2.new(healthPercentage, 0, 0, 6)
    end)
end

local function DestroyTargetHud(player)
    local existingHUD = Table[player]
    if existingHUD then
        existingHUD:Destroy()
        Table[player] = nil
    end
end

local function Replace()
    local index = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local success, errorMessage = pcall(function()
                local distance = (player.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance <= range then
                    CreateTargetHud(player, index)
                    index = index + 1
                else
                    DestroyTargetHud(player)
                end
            end)
            if not success then
                SendNotification(6, "Cannot Replace TargetHud\n".. errorMessage)
            end
        end
    end
end






local function CreateContainer(Params)
local Container = Instance.new("Frame")
Container.Size = Params.Size or UDim2.new(0, 150, 0, 290)
Container.Position = Params.Position or UDim2.new(0,200,0,30)
Container.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Container.BackgroundTransparency = 0.4
Container.BorderSizePixel = 0
Container.Parent = Revolve

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.1, 0)
Corner.Parent = Container

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Params.Color
Stroke.Parent = Container


local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(0, 10, 0, 10)
Text.Position = UDim2.new(0,65,0,7)
Text.Text = Params.Text or "Combat"
Text.TextSize = 17
Text.BackgroundTransparency = 1
Text.TextColor3 = Color3.new(1,1,1)
Text.Font = Enum.Font.SourceSansBold 
Text.Parent = Container


function CreateToggle(Params)
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 150, 0, 20)
    Toggle.BorderSizePixel = 0
    Toggle.BackgroundColor3 = Params.Color
Toggle.BackgroundTransparency = 1
    Toggle.Text = ""
    Toggle.Parent = Container

    local ToggleText = Instance.new("TextLabel")
    ToggleText.Size = UDim2.new(0, 10, 0, 10)
    ToggleText.Position = UDim2.new(0,25,0,5)
    ToggleText.BackgroundTransparency = 1
    ToggleText.Font = Enum.Font.SourceSansBold 
    ToggleText.Text = Params.Text or "Killaura"
    ToggleText.TextColor3 = Color3.new(1,1,1)
    ToggleText.TextSize = 14
    ToggleText.Parent = Toggle

    local col = Params.Column or 1
    local yOffset = 30 * (col - 1)
    local toggleOffset = 0
    for _, child in ipairs(Container:GetChildren()) do
        if child:IsA("TextButton") then
            toggleOffset = toggleOffset + 1
        end
    end

    Toggle.Position = UDim2.new(0, 0, 0, 30 * (col - 1) + toggleOffset * 20 + 30)

    local callback = Params.Callback or function(value) end

    local options = { 
        Value = false, 
        Callback = callback, 
        SaveToFile = Params.SaveToFile, 
        LoadFromFile = Params.LoadFromFile, 
        Name = Params.Flag
    }

    local function updateToggleState()
        if options.Value then
           
            Toggle.BackgroundTransparency = 0
            game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.3), {Transparency = 0}):Play()
            
        else
           
            Toggle.BackgroundTransparency = 1
            game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.3), {Transparency = 1}):Play()
         
        end
    end

    local function toggleCallback()
        options.Value = not options.Value
        updateToggleState()
        if options.Callback then
            options.Callback(options.Value)
        end
        
        if options.SaveToFile then
            local file = options.SaveToFile
            local data = {}
            if isfile(file) then
                pcall(function()
                    data = game:GetService("HttpService"):JSONDecode(readfile(file))
                end)
            end
            data[options.Name] = options.Value
            writefile(file, game:GetService("HttpService"):JSONEncode(data))
            print("Saved settings:", options.Name, options.Value)
        end
    end

    Toggle.MouseButton1Click:Connect(toggleCallback)

    if options.LoadFromFile then
        local file = options.LoadFromFile
        if isfile(file) then
            local data = {}
            pcall(function()
                data = game:GetService("HttpService"):JSONDecode(readfile(file))
            end)
            if data[options.Name] ~= nil then
                options.Value = data[options.Name]
                updateToggleState()
                if options.Callback then
                    options.Callback(options.Value)
                end
                print("Loaded settings:", options.Name, options.Value)
            end
        end
    end

    return Toggle
end



end


local function CreateScreenToggle()
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0,60,0,50)
Button.Position = UDim2.new(0,1000,0,0)
Button.Text = ""
Button.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
Button.BorderSizePixel = 0
Button.Parent = Revolve2

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.2, 0)
Corner.Parent = Button

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 90, 0, 90)
Logo.Position = UDim2.new(0,-15,0,-20)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://16556330154"
Logo.Parent = Button

local IsVisible = false
Button.MouseButton1Click:Connect(function()
IsVisible = not IsVisible
Revolve.Enabled = IsVisible 
end)
end



local ScreenToggle = CreateScreenToggle()





local Lplr = game.Players.LocalPlayer
local Char = Lplr.Character 
local Hum = Char:WaitForChild("Humanoid")
local RS = game:GetService("RunService")

local Camera = workspace.CurrentCamera
local KnitClient = debug.getupvalue(require(Lplr.PlayerScripts.TS.knit).setup, 6)
local CombatConstants = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant
local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsMelees
local ClientHandlerStore = require(Lplr.PlayerScripts.TS.ui.store).ClientStore
local SwordController = KnitClient.Controllers.SwordController


local function GetInventory(Player)
	if not Player then 
		return {Items = {}, Armor = {}}
	end

	local Success, Return = pcall(function() 
		return require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil.getInventory(Player)
	end)

	if not Success then 
		return {Items = {}, Armor = {}}
	end
	if Player.Character and Player.Character:FindFirstChild("InventoryFolder") then 
		local InvFolder = Player.Character:FindFirstChild("InventoryFolder").Value
		if not InvFolder then return Return end
		for i, v in next, Return do 
			for i2, v2 in next, v do 
				if typeof(v2) == 'table' and v2.itemType then
					v2.instance = InvFolder:FindFirstChild(v2.itemType)
				end
			end
			if typeof(v) == 'table' and v.itemType then
				v.instance = InvFolder:FindFirstChild(v.itemType)
			end
		end
	end
	return Return
end

function HashFunc(Vec)
	return {value = Vec}
end

function GetSword()
	local Highest, Returning = -9e9, nil
	for i, v in next, GetInventory(Lplr).items do 
		local Power = table.find(BedwarsSwords, v.itemType)
		if not Power then continue end 
		if Power > Highest then 
			Returning = v
			Highest = Power
		end
	end
	return Returning
end

local Remotes = {
  DeathRemote = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ResetCharacter
  
}

local function KillPlayer()
Remotes.DeathRemote:FireServer()
end  

function FindBed()
    local nearestBed = nil
    local minDistance = math.huge

    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name:lower() == "bed" and v:FindFirstChild("Covers") and v:FindFirstChild("Covers").BrickColor ~= Lplr.Team.TeamColor then
            local distance = (v.Position - Lplr.Character.HumanoidRootPart.Position).magnitude
            if distance < minDistance then
                nearestBed = v
                minDistance = distance
            end
        end
    end
    return nearestBed
end

function TpToBed()
    local nearestBed = FindBed()
    if nearestBed and not hasTeleported then
        hasTeleported = true

        local humanoidRootPart = Lplr.Character.HumanoidRootPart
        if humanoidRootPart then
            local targetCFrame = nearestBed.CFrame + Vector3.new(0, 6, 0)
            local tweenInfo = TweenInfo.new(0.8)
            local tween = TWS:Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
            tween:Play()
        end
    end
end






local function FindPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Lplr and player.TeamColor ~= LplrTeam.TeamColor then
            local distance = (player.Character.HumanoidRootPart.Position - Lplr.Character.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end

    return closestPlayer
end

function TpToPlayer()
    local closestPlayer = FindPlayer()
    if closestPlayer then
        local humanoidRootPart = Lplr.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local targetCFrame = closestPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            local tweenInfo = TweenInfo.new(0.8)
            local tween = TWS:Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
            tween:Play()
        end
    end
end

function IsAlive(Player)
	Player = Player or Lplr
	if not Player.Character then return false end
	if not Player.Character:FindFirstChild("Head") then return false end
	if not Player.Character:FindFirstChild("Humanoid") then return false end
	if Player.Character:FindFirstChild("Humanoid").Health < 0.11 then return false end
	return true
end

function GetMatchState()
	return ClientHandlerStore:getState().Game.matchState
end

local OrigC0 = game:GetService("ReplicatedStorage").Assets.Viewmodel.RightHand.RightWrist.C0
local Animations = {
	["New"] = {
		{CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10), math.rad(8), math.rad(5)), Time = 0.1},
		{CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(120), math.rad(3), math.rad(13)), Time = 0.1},
		{CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10), math.rad(-5), math.rad(8)), Time = 0.1},
		{CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(13)), Time = 0.1}
	}
}

local CurrentAnimation = {["Value"] = "New"}


local Combat = CreateContainer({
  Color = Color1,
  Size = UDim2.new(0, 150, 0, 140),
  Position = UDim2.new(0,100,0,30),
  Text = "Combat"
})

local KillauraEnabled = false
local Killaura = CreateToggle({
    Color = Color1,
    Column = 0.2,
    Parent = Combat,
    Text = "Killaura",
    Flag = "Killaura",
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    KillauraEnabled = value
    spawn(function()
    repeat
        task.wait()
        for _, enemyPlayer in pairs(game:GetService("Players"):GetPlayers()) do
            if enemyPlayer ~= Lplr and enemyPlayer.Team ~= Lplr.Team and IsAlive(enemyPlayer) and GetMatchState() ~= 0 and IsAlive(Lplr) and not enemyPlayer.Character:FindFirstChildOfClass("ForceField") then
                local distance = (enemyPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Lplr.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude

                if distance < 18 then
                    local Sword = GetSword()
                    CombatConstants.RAYCAST_SWORD_CHARACTER_DISTANCE = 22

                    if Sword then
                        spawn(function()
                            if KillauraEnabled then
                                KillauraEnabled = false
                                for _, animationStep in pairs(Animations[CurrentAnimation["Value"]]) do
                                    game:GetService("TweenService"):Create(Camera.Viewmodel.RightHand.RightWrist, TweenInfo.new(animationStep.Time), {C0 = OrigC0 * animationStep.CFrame}):Play()
                                    task.wait(animationStep.Time - 0.01)
                                end
                                KillauraEnabled = true
                            end
                        end)

                        SwordController.lastAttack = game:GetService("Workspace"):GetServerTimeNow()

                        local Args = {
                            [1] = {
                                ["chargedAttack"] = {["chargeRatio"] = 0},
                                ["entityInstance"] = enemyPlayer.Character,
                                ["validate"] = {
                                    ["targetPosition"] = HashFunc(enemyPlayer.Character:FindFirstChild("HumanoidRootPart").Position),
                                    ["selfPosition"] = HashFunc(Lplr.Character:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0, -0.03, 0) + ((distance > 14) and (CFrame.lookAt(Lplr.Character:FindFirstChild("HumanoidRootPart").Position, enemyPlayer.Character:FindFirstChild("HumanoidRootPart").Position).LookVector * 4) or Vector3.new(0, 0, 0))),
                                },
                                ["weapon"] = Sword.tool,
                            }
                        }

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.SwordHit:FireServer(unpack(Args))
                    end
                end
            end
        end
    until not game
end)
 end
})



local maxval = 25
local minval = 14
local ReachEnabled = false
local Reach = CreateToggle({
    Color = Color1,
    Column = 0.21,
    Parent = Combat,
    Text = "Reach",
    Flag = "Reach", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    ReachEnabled = value
    if ReachEnabled then
   
    CombatConstants.RAYCAST_SWORD_CHARACTER_DISTANCE = maxval
    else
    CombatConstants.RAYCAST_SWORD_CHARACTER_DISTANCE = minval
    end
   
    
    end
})

local SpeedEnabled = false
local Speed = CreateToggle({
    Color = Color1,
    Column = 0.22,
    Parent = Combat,
    Text = "Speed",
    Flag = "Speed", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Setting s.json", 
    Callback = function(value)
    SpeedEnabled = value
    while SpeedEnabled and Hum do
    Hum.WalkSpeed = 23
    end
    end
})
local SprintController = KnitClient.Controllers.SprintController
local SprintEnabled = false
local Sprint = CreateToggle({
    Color = Color1,
    Column = 0.23,
    Parent = Combat,
    Text = "Sprint",
    Flag = "Sprint", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    SprintEnabled = value
    if SprintEnabled then
    RS.Heartbeat:Connect(function()
	SprintController:startSprinting()
end)
    end
    end
})

local StrafeEnabled = false
local Range = 10
local Speed = 8
local Move = 5
local Follos = 3.5
local Stop = 1
local LowHealth = 20
local Reach = CreateToggle({
    Color = Color1,
    Column = 0.231,
    Parent = Combat,
    Text = "Strafe",
    Flag = "Strafe", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    StrafeEnabled = value

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.E then
        StrafeEnabled = not StrafeEnabled
    end
end)

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
    if StrafeEnabled then
        for _, targetPlayer in pairs(game.Players:GetPlayers()) do
            if targetPlayer ~= Lplr and Lplr.Team ~= targetPlayer.Team then
                local distance = (Lplr.Character and Lplr.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart"))
                if distance then
                    distance = (Lplr.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= Range and targetPlayer.Character:FindFirstChild("Humanoid") then
                        local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
                        if targetHumanoid.Health > LowHealth then
                            local angle = tick() * Speed
                            local offsetX = math.sin(angle) * Move 
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            local newPosition = Vector3.new(targetPosition.X + offsetX, targetPosition.Y, targetPosition.Z)
                            Lplr.Character:SetPrimaryPartCFrame(CFrame.new(newPosition))
                        end
                    end
                end
            end
        end
    end
end)

local timer = 0
while task.wait(0.1) do
    if StrafeEnabled then
        timer = timer + 0.1
        if timer >= Follos then
            StrafeEnabled = false
            task.wait(Stop)
            StrafeEnabled = true
            timer = 0
        end
    end
end

    end
})



local Utlity = CreateContainer({
  Color = Color2,
  Size = UDim2.new(0, 150, 0, 120),
  Position = UDim2.new(0,300,0,30),
  Text = "Utility"
})

local Enabled6 = false
local NoFall = CreateToggle({
    Color = Color2,
    Column = 0.2,
    Parent = Combat,
    Text = "NoFall",
    Flag = "Nofall", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    Enabled6 = value
    if Enabled6 then
    RS.Heartbeat:Connect(function() game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.GroundHit:FireServer()
      task.wait(2)
      end)
    end
    end
})

local HKB = 100
local VKB = 100
local AntiKnockBackEnabled = false
local AntiKn = CreateToggle({
Text = "AntiKn",
    Column = 0.21,
    Parent = Combat,
    Color = Color2,
    Callback = function(value)
    AntiKnockBackEnabled = value
 
local function GetKnTable()
    return debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
end

local function KnPower(direction, strength)
    local knockbackTable = GetKnTable()

    if knockbackTable then
        knockbackTable["kb" .. direction .. "Strength"] = strength
    end
end
    if AntiKnockBackEnabled then
        KnPower("Direction", HKB)
        KnPower("Upward", VKB)
    else
        KnPower("Direction", 100)
        KnPower("Upward", 100)
    end
    end,
    SaveToFile = "Revolve/Saves/Settings.json",
    LoadFromFile = "Revolve/Saves/Settings.json"
})



local InfJumpEnabled = false
local InfJump = CreateToggle({
    Color = Color1,
    Column = 0.22,
    Color = Color2,
    Parent = Combat,
    Text = "InfJump",
    Flag = "InfJump", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    InfJumpEnabled = value
 
    game:GetService("UserInputService").JumpRequest:connect(function()
	if InfJumpEnabled then 	game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)

    
    end
})
local sky = Instance.new("Sky")
sky.Name = "RevolveSky"
local SkyBoxEnabled = false
local SkyBox = CreateToggle({
    Color = Color2,
    Column = 0.23,
    Parent = Combat,
    Text = "Skybox",
    Flag = "Skybox", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    SkyBoxEnabled = value
    if SkyBoxEnabled then
    local Images = {
    "rbxassetid://14993957229", 
    "rbxassetid://14993958854",
    "rbxassetid://14993961695"
} 

    sky.SkyboxBk = Images[1]
    sky.SkyboxDn = Images[2]
    sky.SkyboxFt = Images[2]
    sky.SkyboxLf = Images[3]
    sky.SkyboxRt = Images[1]
    sky.SkyboxUp = Images[1]
    sky.Parent = game.Lighting
else
for _, v in ipairs(game:GetDescendants()) do
if v.Name == "RevolveSky" then
v:Destroy()
end
end
    end
    end
})

  
local World = CreateContainer({
  Color = Yellow,
  Size = UDim2.new(0, 150, 0, 120),
  Position = UDim2.new(0,500,0,30),
  Text = "World"
})

local Enabled10 = false
local Antivoid = CreateToggle({
  Text = "AntiVoid",
  Column = 0.2,
  Color = Yellow,
  Parent = Combat,
  Callback = function(value)
  
    if value then
      local antiVoidPart = Instance.new("Part")
      antiVoidPart.Name = "AntiVoidPart"
      antiVoidPart.Size = Vector3.new(10000, 1, 1000)
      antiVoidPart.Color = Color3.fromRGB(138, 43, 226)
      antiVoidPart.Position = Lplr.Character.HumanoidRootPart.Position - Vector3.new(0, 15, 0)
      antiVoidPart.Anchored = true
      antiVoidPart.Material = Enum.Material.SmoothPlastic
      antiVoidPart.Transparency = 0.5
      antiVoidPart.Parent = workspace
    else
      for _, Value in ipairs(game.workspace:GetDescendants()) do
      if Value.Name == "AntiVoidPart" then
      Value:Destroy()
      end
      end
    end    
  end,
  SaveToFile = "Revolve/Saves/Settings.json",
  LoadFromFile = "Revolve/Saves/Settings.json"
})


local DeathDelay = 3.85
local BedTp = CreateToggle({
    Text = "BedTp",
    Column = 0.21,
    Color = Yellow,
    Parent = Combat,
    Callback = function()
    KillPlayer()    
task.wait(DeathDelay)
TpToBed()
    end
})

local PlayerTp = CreateToggle({
    Text = "PlayerTp",
    Column = 0.22,
    Color = Yellow,
    Parent = combat,
    Callback = function()
KillPlayer()
task.wait(DeathDelay)
TpToPlayer()
    end
})



getgenv().LuckyBlock = false
getgenv().Ore = false
getgenv().Bed = true
local NukerEnabled = false
local Nuker = CreateToggle({
    Color = Yellow,
    Column = 0.23,
    Parent = combat,
    Text = "Nuker",
    Flag = "Nuker", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
NukerEnabled = value
function HitBlock(Pos1, Pos2, Pos3)
local args = {
    [1] = {
        ["blockRef"] = {
            ["blockPosition"] = Pos1
        },
        ["hitPosition"] = Pos2,
        ["hitNormal"] = Pos3 or Vector3.new(0,0,0)
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@easy-games"):FindFirstChild("block-engine").node_modules:FindFirstChild("@rbxts").net.out._NetManaged.DamageBlock:InvokeServer(unpack(args))
end
function GetBlock()
    local nearestBlock = nil
    local minDistance = math.huge

    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name:lower() == "iron_ore" then
            local distance = (v.Position - Lplr.Character.HumanoidRootPart.Position).magnitude
            if distance < minDistance then
                nearestBlock = v
                minDistance = distance
            end
        end
    end
    if minDistance <= 30 and nearestBlock then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://11523495669"
        sound.Parent = game.Workspace
        sound.Volume = 0.7
        sound:Play()
    end

    return nearestBlock
end
function GetBed()
   local nearestBed = nil
    local minDistance = math.huge

    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name:lower() == "bed" and v:FindFirstChild("Covers") and v:FindFirstChild("Covers").BrickColor ~= Lplr.Team.TeamColor then
            local distance = (v.Position - Lplr.Character.HumanoidRootPart.Position).magnitude
            if distance < minDistance then
                nearestBed = v
                minDistance = distance
              end
        end
    end
    if minDistance <= 30 and nearestBed then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://11523495669"
        sound.Parent = game.Workspace
        sound.Volume = 0.7
        sound:Play()
    end
    return nearestBed

end
function GetLuckyBlock()
local NearestLuckyBlock = nil
    local minDistance = math.huge
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name:lower() == "lucky_block" then
            local distance = (v.Position - Lplr.Character.HumanoidRootPart.Position).magnitude
            if distance < minDistance then
                NearestLuckyBlock = v
                minDistance = distance
            end
        end
    end
    if minDistance <= 30 and NearestLuckyBlock then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://11523495669"
        sound.Parent = game.Workspace
        sound.Volume = 0.7
        sound:Play()
    end
    return NearestLuckyBlock
end
function ReturnPositions(Pos)
local X = math.round(Pos.x/3)
local Y = math.round(Pos.y/3)
local Z = math.round(Pos.z/3)
return Vector3.new(X, Y, Z)
end
spawn(function()
while Ore and NukerEnabled do
local block = GetBlock()
local Hash = Lplr.Character.HumanoidRootPart.Position 
HitBlock(ReturnPositions(block.Position), ReturnPositions(Hash), ReturnPositions(block.Position))
task.wait()
end
end)
spawn(function()
while Bed and NukerEnabled do
local Hash2 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
local Bed = GetBed()
HitBlock(ReturnPositions(Bed.Position), ReturnPositions(Hash2))
task.wait()
end
end)
spawn(function()
while LuckyBlock and NukerEnabled do
local Hash3 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
local LuckyBlock = GetLuckyBlock()
HitBlock(ReturnPositions(LuckyBlock.Position), ReturnPositions(Hash3), ReturnPositions(LuckyBlock.Position))
task.wait()
end
end)

    end
})




while true do
task.wait(5)
Replace()
end
