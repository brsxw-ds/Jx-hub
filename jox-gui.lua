local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UIS = game:GetService("UserInputService")
local flying = false
local noclip = false

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "JoxUI"

local mainButton = Instance.new("TextButton", screenGui)
mainButton.Size = UDim2.new(0, 120, 0, 40)
mainButton.Position = UDim2.new(0, 20, 0.5, -20)
mainButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
mainButton.Font = Enum.Font.GothamBold
mainButton.Text = "🔥 JOX 🔥"
mainButton.TextSize = 20
mainButton.Draggable = true
mainButton.Active = true

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0, 150, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false

local noclipButton = Instance.new("TextButton", frame)
noclipButton.Size = UDim2.new(1, -20, 0, 40)
noclipButton.Position = UDim2.new(0, 10, 0, 10)
noclipButton.Text = "🚪 Noclip"
noclipButton.Font = Enum.Font.Gotham
noclipButton.TextSize = 18
noclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local flyButton = Instance.new("TextButton", frame)
flyButton.Size = UDim2.new(1, -20, 0, 40)
flyButton.Position = UDim2.new(0, 10, 0, 60)
flyButton.Text = "🚀 Fly"
flyButton.Font = Enum.Font.Gotham
flyButton.TextSize = 18
flyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

mainButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

noclipButton.MouseButton1Click:Connect(function()
	noclip = not noclip
	if noclip then
		game:GetService("RunService").Stepped:Connect(function()
			if noclip then
				player.Character.Humanoid:ChangeState(11)
			end
		end)
	end
end)

local bodyVelocity
flyButton.MouseButton1Click:Connect(function()
	flying = not flying
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoidRoot = char:WaitForChild("HumanoidRootPart")

	if flying then
		bodyVelocity = Instance.new("BodyVelocity", humanoidRoot)
		bodyVelocity.Velocity = Vector3.new(0, 100, 0)
		bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)

		wait(0.2)
		game:GetService("RunService").Heartbeat:Connect(function()
			if flying and bodyVelocity then
				local moveDir = Vector3.new(0, 0, 0)
				if UIS:IsKeyDown(Enum.KeyCode.W) then
					moveDir = moveDir + workspace.CurrentCamera.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.S) then
					moveDir = moveDir - workspace.CurrentCamera.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.A) then
					moveDir = moveDir - workspace.CurrentCamera.CFrame.RightVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.D) then
					moveDir = moveDir + workspace.CurrentCamera.CFrame.RightVector
				end
				bodyVelocity.Velocity = moveDir * 50 + Vector3.new(0, 10, 0)
			end
		end)
	else
		if bodyVelocity then
			bodyVelocity:Destroy()
		end
	end
end)
