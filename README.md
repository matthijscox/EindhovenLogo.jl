# EindhovenLogo

[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

The code to generate logos for the JuliaLang Eindhoven meetup organization.

Inspired by [julia-logo-graphics](https://github.com/JuliaLang/julia-logo-graphics). Based on [Luxor.jl](https://github.com/JuliaGraphics/Luxor.jl). The Julia logo is shared under the Creative Commons "BY-NC-SA" 4.0 License, so we follow that license here.

The [Eindhoven vibes](https://www.eindhoven.nl/bestuur-en-beleid/organisatie/logo-en-huisstijl-stad-eindhoven) are property of the Eindhoven municipality, but we are allowed to use it in any form except the official red style. Please never generate the vibes in the red style!

## Example usage

```julia
using EindhovenLogo

save_logo("images/eindhoven.png"; scale=4.5)
save_logo("images/eindhoven.svg"; scale=4.5)
save_logo("images/eindhoven-white.png"; scale=4.5, textcolor="white")

save_vibes("images/vibes.png"; scale=4.5)
save_vibes("images/vibes.svg"; scale=4.5)
```

![images/vibes_small.png](https://raw.githubusercontent.com/matthijscox/EindhovenLogo.jl/main/images/vibes_small.png)

## Notes

Non-mac users may need to download the [Banga MN font](https://fontmeme.com/fonts/bangla-mn-regular-font/) which is the Julia logo font.

## Technical details

I obtained the grid for the official Eindhoven vibes logo, which I used to estimate the logo dimensions:

![images/vibe-specs.png](https://raw.githubusercontent.com/matthijscox/EindhovenLogo.jl/main/images/vibe-specs.png)