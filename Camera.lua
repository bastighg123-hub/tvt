local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.fromOffset(120, 50)
button.Position = UDim2.new(0.5, -60, 0.8, 0)
button.Text = "Camera"
button.Parent = gui

button.Active = true
button.Draggable = true

local firstPerson = true

local function updateCamera()
	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local camera = workspace.CurrentCamera

	if firstPerson then
		player.CameraMode = Enum.CameraMode.LockFirstPerson
		camera.CameraType = Enum.CameraType.Custom
		camera.CameraSubject = humanoid
	else
		player.CameraMode = Enum.CameraMode.Classic
		camera.CameraType = Enum.CameraType.Custom
		camera.CameraSubject = humanoid
	end
end

button.Activated:Connect(function()
	firstPerson = not firstPerson
	updateCamera()
end)

player.CharacterAdded:Connect(function()
	task.wait(0.5)
	updateCamera()
end)

updateCamera()