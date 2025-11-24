# Prime UI Library

Prime UI adalah UI Library custom untuk Roblox yang dibangun di atas Rayfield. 
Versi ini adalah *Simple Hybrid Edition* dengan fitur:

- Window (Rayfield)
- Tab (Rayfield)
- Custom Notify
- Ripple Click Effect
- Confirm Close Dialog
- API yang sederhana dan mudah digunakan

---

## 🚀 Cara Penggunaan

Gunakan script loader berikut di executor Roblox:

```lua
local Prime = loadstring(game:HttpGet("https://raw.githubusercontent.com/USERNAME/PrimeUI/main/prime_source.lua"))()

local win = Prime.CreateWindow({
    Title = "Prime UI",
    Color = Color3.fromRGB(0,200,255)
})

local tab = win:AddTab("Main")
Prime.Notify("Prime Loaded", "UI berhasil dimuat!")

