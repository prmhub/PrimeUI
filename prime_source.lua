from pathlib import Path

prime_full_script = r"""--====================================================--
--                    PRIME UI LIBRARY
--             Simple Hybrid Version (Stable)
--====================================================--

local RAYFIELD_URL = "https://raw.githubusercontent.com/shlexware/Reflex/main/source.lua"

task.wait(0.3) -- Delay penting untuk executor tertentu

local RayfieldSuccess, Rayfield = pcall(function()
    return loadstring(game:HttpGet(RAYFIELD_URL))()
end)

if not RayfieldSuccess then
    warn("Prime UI: Rayfield gagal dimuat")
    return
end

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

---------------------------------------------------------
-- RIPPLE CLICK EFFECT
---------------------------------------------------------
local function Ripple(obj, x, y)
    local ripple = Instance.new("ImageLabel")
    ripple.Image = "rbxassetid://266543268"
    ripple.BackgroundTransparency = 1
    ripple.AnchorPoint = Vector2.new(0.5,0.5)
    ripple.ImageTransparency = 0.7
    ripple.Size = UDim2.fromOffset(14,14)
    ripple.Position = UDim2.fromOffset(
        x - obj.AbsolutePosition.X,
        y - obj.AbsolutePosition.Y
    )
    ripple.ZIndex = 999
    ripple.Parent = obj

    local maxSize = math.max(obj.AbsoluteSize.X, obj.AbsoluteSize.Y) * 1.6

    TweenService:Create(ripple, TweenInfo.new(0.4), {
        Size = UDim2.fromOffset(maxSize, maxSize),
        ImageTransparency = 1
    }):Play()

    task.delay(0.4, function()
        ripple:Destroy()
    end)
end

---------------------------------------------------------
-- CUSTOM NOTIFY (Simplified)
---------------------------------------------------------
local function PrimeNotify(title, content, color, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3
    })
end

---------------------------------------------------------
-- CONFIRM CLOSE DIALOG
---------------------------------------------------------
local function ConfirmClose(title, message, onConfirm)
    Rayfield:Prompt({
        Title = title or "Confirm",
        SubTitle = message or "Are you sure?",
        Actions = {
            Yes = { Name = "Yes", Callback = onConfirm },
            No = { Name = "Cancel" }
        }
    })
end


---------------------------------------------------------
-- PRIME WINDOW SYSTEM
---------------------------------------------------------
local Prime = {}
Prime.__index = Prime

function Prime:CreateWindow(cfg)
    cfg = cfg or {}

    local win = Rayfield:CreateWindow({
        Name = cfg.Title or "Prime UI",
        LoadingTitle = cfg.Title or "Prime UI",
        LoadingSubtitle = cfg.Footer or "",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "Prime",
            FileName = (cfg.Title or "Prime") .. "_Config"
        }
    })

    return setmetatable({
        _win = win,
        Color = cfg.Color or Color3.fromRGB(0,200,255)
    }, Prime)
end

function Prime:AddTab(name)
    return self._win:CreateTab(name)
end


---------------------------------------------------------
-- EXPORT PRIME API
---------------------------------------------------------
local PRIME_API = {
    CreateWindow = function(cfg)
        return Prime:CreateWindow(cfg)
    end,

    Notify = PrimeNotify,
    Ripple = Ripple,
    ConfirmClose = ConfirmClose
}

return PRIME_API
"""

path = Path("/mnt/data/prime_source.lua")
path.write_text(prime_full_script, encoding="utf-8")

"/mnt/data/prime_source.lua"
