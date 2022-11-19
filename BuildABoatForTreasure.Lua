
local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local AutoFarm = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local WalkSpeed = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local JumpPower = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
main.Position = UDim2.new(0.303634226, 0, 0.220883533, 0)
main.Size = UDim2.new(0, 357, 0, 241)
main.Active = true
main.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = main

Title.Name = "Title"
Title.Parent = main
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Size = UDim2.new(0, 357, 0, 48)
Title.Font = Enum.Font.DenkOne
Title.Text = "Script Made By DINO#1390 | Build A Boat For Treasure"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 20.000
Title.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 12)
UICorner_2.Parent = Title

AutoFarm.Name = "AutoFarm"
AutoFarm.Parent = main
AutoFarm.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AutoFarm.Position = UDim2.new(0.218487397, 0, 0.294605821, 0)
AutoFarm.Size = UDim2.new(0, 200, 0, 50)
AutoFarm.Font = Enum.Font.DenkOne
AutoFarm.Text = "AutoFarm"
AutoFarm.TextColor3 = Color3.fromRGB(255, 0, 4)
AutoFarm.TextSize = 20.000

UICorner_3.CornerRadius = UDim.new(0, 12)
UICorner_3.Parent = AutoFarm

WalkSpeed.Name = "WalkSpeed"
WalkSpeed.Parent = main
WalkSpeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed.Position = UDim2.new(0, 0, 0.701244831, 0)
WalkSpeed.Size = UDim2.new(0, 183, 0, 50)
WalkSpeed.Font = Enum.Font.DenkOne
WalkSpeed.Text = "WalkSpeed"
WalkSpeed.TextColor3 = Color3.fromRGB(255, 0, 4)
WalkSpeed.TextSize = 20.000

UICorner_4.CornerRadius = UDim.new(0, 12)
UICorner_4.Parent = WalkSpeed

JumpPower.Name = "JumpPower"
JumpPower.Parent = main
JumpPower.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpPower.Position = UDim2.new(0.512605071, 0, 0.701244831, 0)
JumpPower.Size = UDim2.new(0, 174, 0, 50)
JumpPower.Font = Enum.Font.DenkOne
JumpPower.Text = "JumpPower"
JumpPower.TextColor3 = Color3.fromRGB(255, 0, 4)
JumpPower.TextSize = 20.000

UICorner_5.CornerRadius = UDim.new(0, 12)
UICorner_5.Parent = JumpPower

-- Scripts:

local function HBLZB_fake_script() -- AutoFarm.LocalScript 
	local script = Instance.new('LocalScript', AutoFarm)

	script.Parent.MouseButton1Click:connect(function()
		-- // Custom Settings
		getgenv().TreasureAutoFarm = {
			Enabled = true, -- // Toggle the auto farm on and off
			Teleport = 2, -- // How fast between each teleport between the stages and stuff
			TimeBetweenRuns = 5 -- // How long to wait until it goes to the next run
		}
	
		-- // Services
		local Players = game:GetService("Players")
		local Workspace = game:GetService("Workspace")
		local Lighting = game:GetService("Lighting")
	
		-- // Vars
		local LocalPlayer = Players.LocalPlayer
	
		-- // Goes through all of the stages
		local autoFarm = function(currentRun)
			-- // Variables
			local Character = LocalPlayer.Character
			local NormalStages = Workspace.BoatStages.NormalStages
	
			-- // Go to each stage thing
			for i = 1, 10 do
				local Stage = NormalStages["CaveStage" .. i]
				local DarknessPart = Stage:FindFirstChild("DarknessPart")
	
				if (DarknessPart) then
					-- // Teleport to next stage
					print("Teleporting to next stage: Stage " .. i)
					Character.HumanoidRootPart.CFrame = DarknessPart.CFrame
	
					-- // Create a temp part under you
					local Part = Instance.new("Part", LocalPlayer.Character)
					Part.Anchored = true
					Part.Position = LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 6, 0)
	
					-- // Wait and remove temp part
					wait(getgenv().TreasureAutoFarm.Teleport)
					Part:Destroy()
				end
			end
	
			-- // Go to end
			print("Teleporting to the end")
			repeat wait()
				Character.HumanoidRootPart.CFrame = NormalStages.TheEnd.GoldenChest.Trigger.CFrame
			until Lighting.ClockTime ~= 14
	
			-- // Wait until you have respawned
			local Respawned = false
			local Connection
			Connection = LocalPlayer.CharacterAdded:Connect(function()
				Respawned = true
				Connection:Disconnect()
			end)
	
			repeat wait() until Respawned
			wait(getgenv().TreasureAutoFarm.TimeBetweenRuns)
			print("Auto Farm: Run " .. currentRun .. " finished")
		end
	
		-- // Whilst the autofarm is enable, constantly do it
		local autoFarmRun = 1
		while wait() do
			if (getgenv().TreasureAutoFarm.Enabled) then
				print("Initialising Auto Farm: Run " .. autoFarmRun)
				autoFarm(autoFarmRun)
				autoFarmRun = autoFarmRun + 1
			end
		end
	end)
	
end
coroutine.wrap(HBLZB_fake_script)()
local function CJGGI_fake_script() -- WalkSpeed.LocalScript 
	local script = Instance.new('LocalScript', WalkSpeed)

	script.Parent.MouseButton1Click:connect(function()
		game.Players.LocalPlayer.Character.Humanoid.Walkspeed = 100
	end)
	
end
coroutine.wrap(CJGGI_fake_script)()
local function MBEW_fake_script() -- JumpPower.LocalScript 
	local script = Instance.new('LocalScript', JumpPower)

	script.Parent.MouseButton1Click:connect(function()
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
	end)
	
end
coroutine.wrap(MBEW_fake_script)()
