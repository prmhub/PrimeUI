local Prime = loadstring(game:HttpGet("https://raw.githubusercontent.com/USERNAME/PrimeUI/main/prime_source.lua"))()

local win = Prime.CreateWindow({
    Title = "Prime UI",
    Color = Color3.fromRGB(0,200,255)
})

local tab = win:AddTab("Main")

Prime.Notify("Prime Loaded", "UI berhasil dimuat!", nil, 3)
