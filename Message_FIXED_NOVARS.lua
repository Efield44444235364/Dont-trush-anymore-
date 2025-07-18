print("loading....")

    ["lucide-home"] = "rbxassetid://10709751939",
    ["lucide-wind"] = "rbxassetid://10709752035",
    ["lucide-portal"] = "rbxassetid://10709752254",
    ["lucide-user"] = "rbxassetid://10709752405",
    ["settings"] = "rbxassetid://10709752630",
}
--Function


spawn(function()
    while task.wait() do
        if _G.AutoQuestRace then



            
            -- ตรวจสอบว่าอยู่ในแมพ Trial หรือไม่ ตามเผ่า
            if currentMap then

                if race == "Human" or race == "Ghoul" then
                    if workspace:FindFirstChild("Enemies") then
                        inTrialMap = true
                    end
                elseif race == "Skypiea" then
                    inTrialMap = currentMap:FindFirstChild("SkyTrial") ~= nil
                elseif race == "Mink" then
                    inTrialMap = currentMap:FindFirstChild("MinkTrial") ~= nil
                elseif race == "Cyborg" then
                    inTrialMap = currentMap:FindFirstChild("CyborgTrial") ~= nil
                elseif race == "Fishman" then
                    inTrialMap = currentMap:FindFirstChild("SeaBeasts") ~= nil
                end
            end
            
            if not inTrialMap then
                -- แจ้งเตือนผู้เล่นด้วย Fluent
                Fluent:Notify({
                    Title = "Hi, user",
                    Content = "UR not in trial yet!\n",
                    Duration = 8
                })
                _G.AutoQuestRace = false
                task.wait(5) -- รอ 5 วินาทีก่อนเช็คใหม่
            else
                if plr.PlayerGui:FindFirstChild("Main") and plr.PlayerGui.Main.Timer.Visible then


                    
                    if race == "Human" or race == "Ghoul" then
                        for _, v in pairs(workspace.Enemies:GetDescendants()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                pcall(function()
                                    repeat
                                        task.wait(0.1)
                                        v.Humanoid.Health = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        if sethiddenproperty then
                                            sethiddenproperty(plr, "SimulationRadius", math.huge)
                                        end
                                    until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end

                    elseif race == "Skypiea" then

                        if finish then
                            plr.Character.HumanoidRootPart.CFrame = finish.CFrame
                        end

                    elseif race == "Mink" then

                        if ceiling then
                            plr.Character.HumanoidRootPart.CFrame = ceiling.CFrame * CFrame.new(0, -5, 0)
                        end
                        task.wait(0.5)
                        if not plr.PlayerGui.Main.Timer.Visible then
                            _G.AutoQuestRace = false
                        end

                    elseif race == "Cyborg" then
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(28654, 14898.7832, -30)

                    elseif race == "Fishman" then
                        for _, v in pairs(workspace.SeaBeasts.SeaBeast1:GetDescendants()) do
                            if v.Name == "HumanoidRootPart" then
                                plr.Character.HumanoidRootPart.CFrame = v.CFrame


                                -- Equip Melee
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Melee" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end
                                task.wait(0.5)

                                -- Equip Blox Fruit
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end
                                task.wait(0.5)

                                -- Equip Sword
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Sword" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end
                                task.wait(0.5)

                                -- Equip Gun
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Gun" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end

                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)




    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 120,
    Size = UDim2.fromOffset(520, 320),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

    Main = Window:AddTab({ Title = "Main", Icon = "lucide-home" }),
    tp = Window:AddTab({ Title = "Race", Icon = "lucide-wind" }),
    tp2 = Window:AddTab({ Title = "Teleport", Icon = "lucide-portal	" }),
    v = Window:AddTab({ Title = "Visual", Icon = "lucide-user" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}


do

    Toggle:OnChanged(function(Value)
    
        print("load")
        _G.AutoQuestRace = Value
    end)

    Options.MyToggle:SetValue(false)

    
    Tabs.Main:AddButton({
        Title = "Temple of time optimize",
        Description = "Optimize temple of time fix lag in game!!",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "yes i need to opimize my game so lagggg",
                Buttons = {
                    {
                        Title = "Ya",
                        Callback = function()
                            task.spawn(function()
    repeat
        task.wait(1)


        if c < 110 then
            pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Temple Optimizer",
                    Text = "⏳ รอ Temple of Time โหลด... (" .. c .. "/110)",
                    Duration = 5
                })
            end)
        end
    until game:GetService("Workspace"):FindFirstChild("Temple of Time") and #game:GetService("Workspace")["Temple of Time"]:GetDescendants() >= 110

    for _, d in ipairs(game:GetService("Workspace")["Temple of Time"]:GetDescendants()) do
        if d.Name == "PerformanceBarrel" or d.Name == "PerformanceCrate" then
            if d and d:IsA("Instance") and d.Parent then d:Destroy() end
        end
    end

    for _, d in ipairs(game:GetService("Workspace")["Temple of Time"]:GetDescendants()) do
        if d.Name == "Orb" then
            if d and d:IsA("Instance") and d.Parent then d:Destroy() end
        end
    end

    local function try(p)
        local s, r = pcall(p)
        if s and r and r:IsA("Instance") and r.Parent then r:Destroy() end
    end

    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[18]:FindFirstChild("FHead") end)
    try(function() return game:GetService("Workspace")["Temple of Time"]:FindFirstChild("Orbs") end)
    try(function() return game:GetService("Workspace")["Temple of Time"]:GetChildren()[78] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[43] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[57] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[58] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[52]:GetChildren()[6] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[52]:GetChildren()[5] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[186] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]["GiantRoom"]:GetChildren()[42] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]:GetChildren()[7]:GetChildren()[5] end)
    try(function() return game:GetService("Workspace")["Temple of Time"]:GetChildren()[25]:GetChildren()[6] end)
    try(function() return game:GetService("Workspace")["Temple of Time"].GiantRoom:FindFirstChild("FallingLeaves") end)
    try(function() return game:GetService("Workspace")["Temple of Time"].GiantRoom:GetChildren()[193] end)
    try(function()

        return r:FindFirstChild("PerformanceBarrel") and r.PerformanceBarrel:FindFirstChild("Barrel")
    end)
    try(function() return game:GetService("Workspace")["Temple of Time"].SpawnRoom:GetChildren()[13]:GetChildren()[4] end)
    try(function() return game:GetService("Workspace")["Temple of Time"].SpawnRoom:GetChildren()[13]:FindFirstChild("PerformanceBarrel") end)
    try(function() return game:GetService("Workspace")["Temple of Time"].SpawnRoom:GetChildren()[13]:FindFirstChild("PerformanceCrate") end)
    try(function() return game:GetService("Workspace")["Temple of Time"].SpawnRoom:GetChildren()[13]:GetChildren()[2] end)

    for _, o in ipairs(game:GetService("Workspace")["Temple of Time"]:GetDescendants()) do
        if o:IsA("PointLight") or o:IsA("SpotLight") or o:IsA("SurfaceLight") then
            if o and o:IsA("Instance") and o.Parent then o:Destroy() end
        end
        if o:IsA("BasePart") and o.Material == Enum.Material.Neon then
            o.Material = Enum.Material.SmoothPlastic
        end
    end

    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Temple Optimizer",
            Text = "Done!",
            Duration = 5
        })
    end)
end)
                        end
                    },
                    {
                        Title = "Nope",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



--Telepoart


Tabs.tp:AddButton({
        Title = "Tp to temple of time",
        Description = "Teleport to temple of time noBug!!",
        Callback = function()
            Window:Dialog({
                Title = "RU sure?",
                Content = "click",
                Buttons = {
                    {
                        Title = "Ya",
                        Callback = function()
                            pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
end)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Teleport")
end)

task.wait(0.1)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Activate")
end)

pcall(function()

    if stash then

        if t then
            t.Parent = game:GetService("Workspace")
        end
    end
end)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
end)

task.wait(2)
                        end
                    },
                    {
                        Title = "Nope",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.tp:AddButton({
    Title = "Tp To race door",
    Description = "Teleport to your Race Door",
    Callback = function()
        Window:Dialog({
            Title = "RU sure?",
            Content = "Click 'Ya' to teleport.",
            Buttons = {
                {
                    Title = "Ya",
                    Callback = function()

                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - center).Magnitude <= 300 then
                            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094)
                            end
                        else
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Roblox/refs/heads/main/Temple%20of%20time%20Bypass.lua"))()
                            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094)
                            end
                        end
                    end
                },
                {
                    Title = "Nope",
                    Callback = function()
                        print("❎ Cancelled.")
                    end
                }
            }
        })
    end
})

Tabs.tp:AddButton({
        Title = "Top of great tree",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
                            pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
end)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Teleport")
end)

task.wait(0.1)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Activate")
end)

pcall(function()

    if stash then

        if t then
            t.Parent = game:GetService("Workspace")
        end
    end
end)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance", Vector3.new(28286.3555, 14895.3018, 102.6247))
end)

game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").PlatformStand = true

task.wait(0.2)

if (game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - Vector3.new(28286.3555, 14896.5488, 102.624695)).Magnitude >= 20 then
    return
end

game:GetService("TweenService"):Create(
    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
    TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {
        CFrame = CFrame.new(
            28609.959, 14896.5488, 106.442062,
            0.884707332, -1.14530732e-08, 0.466146886,
            4.99972579e-08, 1, -7.03209011e-08,
            -0.466146886, 8.55194813e-08, 0.884707332
        )
    }
):Play()

task.wait(1.2 + 0.2)

pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "TeleportBack")
end)

game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").PlatformStand = false

game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame *
    (CFrame.new(
        3028.84082, 2280.90283, -7324.7832,
        0.0116851926, 2.98534752e-09, -0.999931753,
        8.20532461e-11, 1, 2.98651015e-09,
        0.999931753, -1.16945592e-10, 0.0116851926
    ) 
game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.tp2:AddButton({
        Title = "Mansion",
        Description = "tp to Mansion!!",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12549.8017578125, 337.2079162597656, -7462.84033203125))
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    
    Tabs.tp2:AddButton({
        Title = "Castle on the sea",
        Description = "tp to Castle on the sea!!",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5100.50586, 314.555267, -3052.72144, 0.916875184, -3.16727689e-09, 0.399174064, 6.39725473e-09, 1, -6.7594752e-09, -0.399174064, 8.75121309e-09, 0.916875184))
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5067.83398, 314.555267, -2991.13501, -0.299354255, 4.89374266e-08, 0.954142034, -1.49885544e-08, 1, -5.59919933e-08, -0.954142034, -3.10626511e-08, -0.299354255)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5067.83398, 314.555267, -2991.13501, -0.299354255, 4.89374266e-08, 0.954142034, -1.49885544e-08, 1, -5.59919933e-08, -0.954142034, -3.10626511e-08, -0.299354255)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.v:AddButton({
        Title = "Roblox Emote Menu enable",
        Description = "Enable Roblox Emote menu\neveryone can see it \n no security kick!!",
        Callback = function()
            Window:Dialog({
                Title = "RU sure?",
                Content = "click",
                Buttons = {
                    {
                        Title = "Ya",
                        Callback = function()
                            game:GetService("CoreGui") -- This line is now effectively a standalone call if not assigned or used
pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true)
end)

pcall(function()
    game:GetService("StarterGui"):SetCore("EmotesMenuOpen", true)
end)

                        end
                    },
                    {
                        Title = "Nope",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


Tabs.v:AddButton({
        Title = "Clock access",
        Description = "Enter to clock room with no teleport back and verry risk",
        Callback = function()
            Window:Dialog({
                Title = "RU sure?",
                Content = "click",
                Buttons = {
                    {
                        Title = "Ya",
                        Callback = function()
                            game.Workspace.Map["Temple of Time"].DoNotEnter:Destroy()
game.Workspace.Map["Temple of Time"].ClockRoomExit:Destroy()
                        end
                    },
                    {
                        Title = "Nope",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

        Title = "KeyBind",
        Mode = "Toggle",
        Default = "LeftControl",
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            if state then
                print("Keybind is being held down")
            end
            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle")

        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("Kawnew")
SaveManager:SetFolder("Kawnew/" .. placeid)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
    Title = "Kawnew",
    Content = "The script has been loaded with reduce lag \nand Optimize some object!!",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()

