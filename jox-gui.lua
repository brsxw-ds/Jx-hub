local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local flying = false
local noclip = false
local flyVelocity

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "JoxUI"

local mainButton = Instance.new("TextButton", screenGui)
mainButton.Size = UDim2.new(0, 140, 0, 50)
mainButton.Position = UDim2.new(0, 30, 0.5, -25)
mainButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainButton.BorderSizePixel = 0
mainButton.TextColor3 = Color3.fromRGB(255, 80, 80)
mainButton.Font = Enum.Font.FredokaOne
mainButton.Text = "⚡ Jox Menu ⚡"
mainButton.TextSize = 24
mainButton.Draggable = true
mainButton.Active = true

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 140)
frame.Position = UDim2.new(0, 180, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Visible = false

local UICornerMain = Instance.new("UICorner", mainButton)
UICornerMain.CornerRadius = UDim.new(0, 12)

local UICornerFrame = Instance.new("UICorner", frame)
UICornerFrame.CornerRadius = UDim.new(0, 14)

local noclipButton = Instance.new("TextButton", frame)
noclipButton.Size = UDim2.new(1, -20, 0, 50)
noclipButton.Position = UDim2.new(0, 10, 0, 10)
noclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noclipButton.Text = "🚪 Noclip OFF"
noclipButton.Font = Enum.Font.GothamSemibold
noclipButton.TextSize = 20
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", noclipButton).CornerRadius = UDim.new(0, 10)

local flyButton = Instance.new("TextButton", frame)
flyButton.Size = UDim2.new(1, -20, 0, 50)
flyButton.Position = UDim2.new(0, 10, 0, 80)
flyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flyButton.Text = "🚀 Fly OFF"
flyButton.Font = Enum.Font.GothamSemibold
flyButton.TextSize = 20
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", flyButton).CornerRadius = UDim.new(0, 10)

mainButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

-- Noclip funcional
noclipButton.MouseButton1Click:Connect(function()
	noclip = not noclip
	noclipButton.Text = noclip and "🚪 Noclip ON" or "🚪 Noclip OFF"

	if noclip then
		RunService.Stepped:Connect(function()
			if noclip and player.Character and player.Character:FindFirstChild("Humanoid") then
				pcall(function()
					player.Character.Humanoid:ChangeState(11)
				end)
			end
		end)
	end
end)

-- Fly com controle total
flyButton.MouseButton1Click:Connect(function()
	flying = not flying
	flyButton.Text = flying and "🚀 Fly ON" or "🚀 Fly OFF"
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	if flying then
		flyVelocity = Instance.new("BodyVelocity", hrp)
		flyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		flyVelocity.Velocity = Vector3.new(0, 0, 0)

		RunService.Heartbeat:Connect(function()
			if flying and flyVelocity and hrp then
				local cam = workspace.CurrentCamera
				local moveDir = Vector3.new(0, 0, 0)

				if UIS:IsKeyDown(Enum.KeyCode.W) then
					moveDir = moveDir + cam.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.S) then
					moveDir = moveDir - cam.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.A) then
					moveDir = moveDir - cam.CFrame.RightVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.D) then
					moveDir = moveDir + cam.CFrame.RightVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.Space) then
					moveDir = moveDir + cam.CFrame.UpVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
					moveDir = moveDir - cam.CFrame.UpVector
				end

				flyVelocity.Velocity = moveDir.Unit * 70
			end
		end)
	else
		if flyVelocity then
			flyVelocity:Destroy()
		end
	end
end)local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local flying = false
local noclip = false
local flyVelocity

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "JoxUI"

local mainButton = Instance.new("TextButton", screenGui)
mainButton.Size = UDim2.new(0, 140, 0, 50)
mainButton.Position = UDim2.new(0, 30, 0.5, -25)
mainButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainButton.BorderSizePixel = 0
mainButton.TextColor3 = Color3.fromRGB(255, 80, 80)
mainButton.Font = Enum.Font.FredokaOne
mainButton.Text = "⚡ Jox Menu ⚡"
mainButton.TextSize = 24
mainButton.Draggable = true
mainButton.Active = true

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 140)
frame.Position = UDim2.new(0, 180, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Visible = false

local UICornerMain = Instance.new("UICorner", mainButton)
UICornerMain.CornerRadius = UDim.new(0, 12)

local UICornerFrame = Instance.new("UICorner", frame)
UICornerFrame.CornerRadius = UDim.new(0, 14)

local noclipButton = Instance.new("TextButton", frame)
noclipButton.Size = UDim2.new(1, -20, 0, 50)
noclipButton.Position = UDim2.new(0, 10, 0, 10)
noclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noclipButton.Text = "🚪 Noclip OFF"
noclipButton.Font = Enum.Font.GothamSemibold
noclipButton.TextSize = 20
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", noclipButton).CornerRadius = UDim.new(0, 10)

local flyButton = Instance.new("TextButton", frame)
flyButton.Size = UDim2.new(1, -20, 0, 50)
flyButton.Position = UDim2.new(0, 10, 0, 80)
flyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flyButton.Text = "🚀 Fly OFF"
flyButton.Font = Enum.Font.GothamSemibold
flyButton.TextSize = 20
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", flyButton).CornerRadius = UDim.new(0, 10)

mainButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

-- Noclip funcional
noclipButton.MouseButton1Click:Connect(function()
	noclip = not noclip
	noclipButton.Text = noclip and "🚪 Noclip ON" or "🚪 Noclip OFF"

	if noclip then
		RunService.Stepped:Connect(function()
			if noclip and player.Character and player.Character:FindFirstChild("Humanoid") then
				pcall(function()
					player.Character.Humanoid:ChangeState(11)
				end)
			end
		end)
	end
end)

-- Fly com controle total
flyButton.MouseButton1Click:Connect(function()
	flying = not flying
	flyButton.Text = flying and "🚀 Fly ON" or "🚀 Fly OFF"
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	if flying then
		flyVelocity = Instance.new("BodyVelocity", hrp)
		flyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		flyVelocity.Velocity = Vector3.new(0, 0, 0)

		RunService.Heartbeat:Connect(function()
			if flying and flyVelocity and hrp then
				local cam = workspace.CurrentCamera
				local moveDir = Vector3.new(0, 0, 0)

				if UIS:IsKeyDown(Enum.KeyCode.W) then
					moveDir = moveDir + cam.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.S) then
					moveDir = moveDir - cam.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.A) then
					moveDir = moveDir - cam.CFrame.RightVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.D) then
					moveDir = moveDir + cam.CFrame.RightVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.Space) then
					moveDir = moveDir + cam.CFrame.UpVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
					moveDir = moveDir - cam.CFrame.UpVector
				end

				flyVelocity.Velocity = moveDir.Unit * 70
			end
		end)
	else
		if flyVelocity then
			flyVelocity:Destroy()
		end
	end
end)
