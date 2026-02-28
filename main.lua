local _Players = game:GetService('Players')

game:GetService('UserInputService')
game:GetService('ReplicatedStorage')

local _LocalPlayer = _Players.LocalPlayer

local function u4()
    local _Tool = Instance.new('Tool')

    _Tool.Name = 'Jerk Off'
    _Tool.RequiresHandle = false
    _Tool.Parent = _LocalPlayer.Backpack

    return _Tool
end

local u5 = false
local u6 = {}

local function u15(p7, p8, p9, p10)
    local _Character = _LocalPlayer.Character

    if _Character then
        _Character = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
    end
    if _Character then
        local _Animation = Instance.new('Animation')

        _Animation.AnimationId = 'rbxassetid://' .. p7

        local u13 = _Character:LoadAnimation(_Animation)

        u6[p10] = game:GetService('RunService').RenderStepped:Connect(function()
            if u5 then
                if p9 <= u13.TimePosition or u13.IsPlaying == false then
                    u13:Play()

                    u13.TimePosition = p8
                end
            else
                u13:Stop()
            end
        end)

        local v14 = u13

        u13.Play(v14)

        u13.TimePosition = p8
    else
        warn('Humanoid not found!')
    end
end
local function u16()
    u15('72042024', 0.5, 0.9, 1)
    u15('168268306', 1, 1.001, 2)

    u5 = true
end
local function u21()
    u5 = false

    local v17, v18, v19 = pairs(u6)

    while true do
        local v20

        v19, v20 = v17(v18, v19)

        if v19 == nil then
            break
        end

        v20:Disconnect()
    end

    u6 = {}
end
local function u22()
    u16()
end
local function u23()
    u21()
end

_LocalPlayer.CharacterAdded:Connect(function(_)
    if _LocalPlayer.Backpack:FindFirstChild('Jerk Off') then
        _LocalPlayer.Backpack['Jerk Off']:Destroy()
    end

    local v24 = u4()

    v24.Equipped:Connect(u22)
    v24.Unequipped:Connect(u23)
end)

local v25 = u4()

v25.Equipped:Connect(u22)
v25.Unequipped:Connect(u23)
