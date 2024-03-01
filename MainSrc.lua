for _, Hash in ipairs(game:GetDescendants()) do
if Hash.Name == "Revolve" and Hash:IsA("ScreenGui") then
Hash:Destroy()
end
end

local Revolve = Instance.new("ScreenGui")
Revolve.Name = "Revolve"
Revolve.Enabled = false
Revolve.Parent = game:GetService('CoreGui')
local Color1 = Color3.fromRGB(138, 43, 226)
local Color2 = Color3.fromRGB(205, 98, 152) 
local Yellow = Color3.fromRGB(255, 215, 0)


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

local Revolve2 = Instance.new("ScreenGui")
Revolve2.Name = "RevolveSecondary"
Revolve2.Parent = game:GetService("CoreGui")

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
for _, Val in ipairs(game:GetDescendants()) do
if Val.Name == "Revolve" and Val:IsA("ScreenGui") then
Val.Enabled = IsVisible
end
end
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
local TWS = game:GetService("TweenService")


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

local Enabled1 = false
local Killaura = CreateToggle({
    Color = Color1,
    Column = 0.2,
    Parent = Combat,
    Text = "Killaura",
    Flag = "Killaura",
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    Enabled1 = value
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
                            if Enabled1 then
                                Enabled1 = false
                                for _, animationStep in pairs(Animations[CurrentAnimation["Value"]]) do
                                    game:GetService("TweenService"):Create(Camera.Viewmodel.RightHand.RightWrist, TweenInfo.new(animationStep.Time), {C0 = OrigC0 * animationStep.CFrame}):Play()
                                    task.wait(animationStep.Time - 0.01)
                                end
                                Enabled1 = true
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
local Enabled2 = false
local Reach = CreateToggle({
    Color = Color1,
    Column = 0.21,
    Parent = Combat,
    Text = "Reach",
    Flag = "Reach", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    Enabled2 = value
    if Enabled2 then
   
    CombatConstants.RAYCAST_SWORD_CHARACTER_DISTANCE = maxval
    else
    CombatConstants.RAYCAST_SWORD_CHARACTER_DISTANCE = minval
    end
   
    
    end
})

local Enabled3 = false
local Speed = CreateToggle({
    Color = Color1,
    Column = 0.22,
    Parent = Combat,
    Text = "Speed",
    Flag = "Speed", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Setting s.json", 
    Callback = function(value)
    Enabled3 = value
    if Hum and Enabled3 then 
    repeat 
    Hum.WalkSpeed = 50
    until not game
    end
    end
})
local SprintController = KnitClient.Controllers.SprintController
local Enabled4 = false
local Sprint = CreateToggle({
    Color = Color1,
    Column = 0.23,
    Parent = Combat,
    Text = "Sprint",
    Flag = "Sprint", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    Enabled4 = value
    if Enabled4 then
    RS.Heartbeat:Connect(function()
	SprintController:startSprinting()
end)
    end
    end
})

local Enabled5 = false
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
    Enabled5 = value

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.E then
        Enabled5 = not Enabled5
    end
end)

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
    if Enabled5 then
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
    if Enabled5 then
        timer = timer + 0.1
        if timer >= Follos then
            Enabled5 = false
            task.wait(Stop)
            Enabled5 = true
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
  Text = "Utlity"
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
local Enabled7 = false
local AntiKn = CreateToggle({
Text = "AntiKn",
    Column = 0.21,
    Parent = Combat,
    Color = Color2,
    Callback = function(value)
    Enabled7 = value
 
local function GetKnTable()
    return debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
end

local function KnPower(direction, strength)
    local knockbackTable = GetKnTable()

    if knockbackTable then
        knockbackTable["kb" .. direction .. "Strength"] = strength
    end
end
    if Enabled7 then
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



local Enabled8 = false
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
    Enabled8 = value
 
    game:GetService("UserInputService").JumpRequest:connect(function()
	if Enabled8 then 	game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)

    
    end
})
local sky = Instance.new("Sky")
sky.Name = "RevolveSky"
local Enabled9 = false
local SkyBox = CreateToggle({
    Color = Color2,
    Column = 0.23,
    Parent = Combat,
    Text = "Skybox",
    Flag = "Skybox", 
    SaveToFile = "Revolve/Saves/Settings.json", 
    LoadFromFile = "Revolve/Saves/Settings.json", 
    Callback = function(value)
    Enabled9 = value
    if Enabled9 then
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
  Size = UDim2.new(0, 150, 0, 100),
  Position = UDim2.new(0,500,0,30),
  Text = "World"
})


local Enabled10 = false
local Antivoid = CreateToggle({
  Text = "AntiVoid",
  Column = 0.2,
  Color = Yellow,
  Parent = WorldTab,
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

