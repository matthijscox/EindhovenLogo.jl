module EindhovenLogo

using Luxor

export save_vibes, save_logo

function vibe_points(;scale::Real = 1)::Vector{Point}
    scale *= 20
    pointlist = Point[]
    y_unit = 6.2/9.2
    x_unit1 = 8.0/9.2
    x_unit2 = 4.0/9.2
    x_unit3 = x_unit1+x_unit2
    push!(pointlist, Point(0.0, 0.0))
    push!(pointlist, Point(0.0, 0.0-1.0*scale))
    for i in 1:2
        push!(pointlist, Point(x_unit1*scale+x_unit3*scale*(i-1), -(1+y_unit)*scale))
        push!(pointlist, Point(x_unit3*scale*i, -1.0*scale))
    end
    i = 3
    push!(pointlist, Point(x_unit1*scale+x_unit3*scale*(i-1), -(1+y_unit)*scale))
    push!(pointlist, Point(x_unit1*scale+x_unit3*scale*(i-1), -(y_unit)*scale))
    for i in 2:-1:1
        push!(pointlist, Point(x_unit3*scale*i, 0.0))
        push!(pointlist, Point(x_unit1*scale+x_unit3*scale*(i-1), -(y_unit)*scale))
    end
    return pointlist
end

function vibe(;scale::Real=1, action=:fill)
    pointlist = vibe_points(;scale=scale)
    return poly(pointlist, action, close=true)
end

function draw_vibes(;scale=1)
    sethue(Luxor.julia_red...)
    vibe(scale=scale)
    translate(0, 20*2*scale)
    sethue(Luxor.julia_green...)
    vibe(scale=scale)
    translate(0, 20*2*scale)
    sethue(Luxor.julia_purple...)
    vibe(scale=scale)
end

# example logo, final design to be decided
function draw_eindhoven_logo(;
    xoffset = -120,
    scale = 1.0,
)
    setfont("Bangla MN Bold", 100)
    settext("eindhoven", Point(xoffset-215*scale, 110*scale))
    sethue(Luxor.julia_blue...)
    circle((xoffset-138)*scale, -30*scale, 13*scale, :fill)

    translate((xoffset+90)*scale, -40*scale)
    #juliacircles(18.5)

    translate(250*scale, 25*scale)
    draw_vibes(scale=scale)
end

function draw_eindhoven(;scale::Real=4.5, textcolor="black")
    fontface("Bangla MN Bold")
    fontsize(24.5*scale)
    sethue(textcolor)
    textoutlines("eindhoven", O, :path, valign=:middle, halign=:center)
    fillpreserve()
    #settext("eindhoven", Point(xoffset-215*scale, 110*scale))
    sethue(Luxor.julia_blue...)
    circle(-45*scale, -7.5*scale, 2.5*scale, :fill)
end

# copy-pasted from Luxor.jl and added scale, sorry
function scaled_julialogo(;
    action    = :fill,
    color     = true,
    bodycolor = "black",
    centered  = false,
    scale     = 1.0)

    if centered == true
        translate(-scale*Point(330, 213)/2)
    end

    # save current color
    original_color = Luxor.get_current_color()

    # "j" without dot
    _j  =  [
    PathMove(scale*Point(72.87109375, 177.3125)),
    PathCurve(scale*Point(72.87109375, 184.84765625), scale*Point(72.0234375, 190.93359375), scale*Point(70.328125, 195.56640625)),
    PathCurve(scale*Point(68.6328125, 200.203125), scale*Point(66.22265625, 203.80078125), scale*Point(63.09375, 206.36328125)),
    PathCurve(scale*Point(59.96875, 208.92578125), scale*Point(56.21875, 210.640625), scale*Point(51.84765625, 211.5078125)),
    PathCurve(scale*Point(47.4765625, 212.37109375), scale*Point(42.61328125, 212.8046875), scale*Point(37.265625, 212.8046875)),
    PathCurve(scale*Point(30.02734375, 212.8046875), scale*Point(24.48828125, 211.67578125), scale*Point(20.6484375, 209.4140625)),
    PathCurve(scale*Point(16.8046875, 207.15234375), scale*Point(14.8828125, 204.44140625), scale*Point(14.8828125, 201.2734375)),
    PathCurve(scale*Point(14.8828125, 198.63671875), scale*Point(15.953125, 196.4140625), scale*Point(18.1015625, 194.60546875)),
    PathCurve(scale*Point(20.25, 192.796875), scale*Point(23.1328125, 191.89453125), scale*Point(26.75, 191.89453125)),
    PathCurve(scale*Point(29.46484375, 191.89453125), scale*Point(31.6328125, 192.62890625), scale*Point(33.25, 194.09765625)),
    PathCurve(scale*Point(34.87109375, 195.56640625), scale*Point(36.2109375, 197.01953125), scale*Point(37.265625, 198.44921875)),
    PathCurve(scale*Point(38.46875, 200.03125), scale*Point(39.48828125, 201.0859375), scale*Point(40.31640625, 201.61328125)),
    PathCurve(scale*Point(41.14453125, 202.140625), scale*Point(41.8984375, 202.40625), scale*Point(42.578125, 202.40625)),
    PathCurve(scale*Point(44.0078125, 202.40625), scale*Point(45.1015625, 201.55859375), scale*Point(45.85546875, 199.86328125)),
    PathCurve(scale*Point(46.609375, 198.16796875), scale*Point(46.984375, 194.87109375), scale*Point(46.984375, 189.97265625)),
    PathLine(scale*Point(46.984375, 97.05078125)),
    PathLine(scale*Point(72.87109375, 89.9296875)),
    PathClose(),]

    # "u"
    _u = [
    PathMove(scale*Point(109.73828125, 92.4140625)),
    PathLine(scale*Point(109.73828125, 152.21484375)),
    PathCurve(scale*Point(109.73828125, 153.875), scale*Point(110.05859375, 155.4375), scale*Point(110.69921875, 156.90625)),
    PathCurve(scale*Point(111.33984375, 158.375), scale*Point(112.2265625, 159.640625), scale*Point(113.35546875, 160.6953125)),
    PathCurve(scale*Point(114.48828125, 161.75), scale*Point(115.8046875, 162.59765625), scale*Point(117.3125, 163.23828125)),
    PathCurve(scale*Point(118.8203125, 163.87890625), scale*Point(120.44140625, 164.19921875), scale*Point(122.17578125, 164.19921875)),
    PathCurve(scale*Point(124.1328125, 164.19921875), scale*Point(126.359375, 163.1015625), scale*Point(129.0703125, 161.203125)),
    PathCurve(scale*Point(133.36328125, 158.1953125), scale*Point(135.96484375, 156.12890625), scale*Point(135.96484375, 153.68359375)),
    PathCurve(scale*Point(135.96484375, 153.09765625), scale*Point(135.96484375, 92.4140625), scale*Point(135.96484375, 92.4140625)),
    PathLine(scale*Point(161.73828125, 92.4140625)),
    PathLine(scale*Point(161.73828125, 177.3125)),
    PathLine(scale*Point(135.96484375, 177.3125)),
    PathLine(scale*Point(135.96484375, 169.3984375)),
    PathCurve(scale*Point(132.57421875, 172.26171875), scale*Point(128.95703125, 174.55859375), scale*Point(125.11328125, 176.29296875)),
    PathCurve(scale*Point(121.26953125, 178.02734375), scale*Point(117.5390625, 178.89453125), scale*Point(113.921875, 178.89453125)),
    PathCurve(scale*Point(109.703125, 178.89453125), scale*Point(105.78125, 178.1953125), scale*Point(102.1640625, 176.80078125)),
    PathCurve(scale*Point(98.546875, 175.40625), scale*Point(95.3828125, 173.50390625), scale*Point(92.671875, 171.09375)),
    PathCurve(scale*Point(89.95703125, 168.68359375), scale*Point(87.828125, 165.85546875), scale*Point(86.28125, 162.61328125)),
    PathCurve(scale*Point(84.73828125, 159.375), scale*Point(83.96484375, 155.90625), scale*Point(83.96484375, 152.21484375)),
    PathLine(scale*Point(83.96484375, 92.4140625)),
    PathClose()]

    # "l"
    _l = [
    PathMove(scale*Point(197.8828125, 177.3125)),
    PathLine(scale*Point(172.22265625, 177.3125)),
    PathLine(scale*Point(172.22265625, 58.27734375)),
    PathLine(scale*Point(197.8828125, 51.15625)),
    PathClose()]

    #  "u"
    _i = [
    PathMove(scale*Point(208.6015625, 97.05078125)),
    PathLine(scale*Point(234.375, 89.9296875)),
    PathLine(scale*Point(234.375, 177.3125)),
    PathLine(scale*Point(208.6015625, 177.3125)),
    PathClose()]

    _a = [
    PathMove(scale*Point(288.2265625, 133.44921875)),
    PathCurve(scale*Point(285.73828125, 134.5078125), scale*Point(283.23046875, 135.73046875), scale*Point(280.70703125, 137.125)),
    PathCurve(scale*Point(278.18359375, 138.51953125), scale*Point(275.8828125, 140.046875), scale*Point(273.8125, 141.703125)),
    PathCurve(scale*Point(271.73828125, 143.359375), scale*Point(270.0625, 145.1328125), scale*Point(268.78125, 147.015625)),
    PathCurve(scale*Point(267.5, 148.8984375), scale*Point(266.859375, 150.859375), scale*Point(266.859375, 152.89453125)),
    PathCurve(scale*Point(266.859375, 154.4765625), scale*Point(267.06640625, 156.00390625), scale*Point(267.48046875, 157.47265625)),
    PathCurve(scale*Point(267.89453125, 158.94140625), scale*Point(268.48046875, 160.203125), scale*Point(269.234375, 161.2578125)),
    PathCurve(scale*Point(269.98828125, 162.3125), scale*Point(270.81640625, 163.16015625), scale*Point(271.72265625, 163.80078125)),
    PathCurve(scale*Point(272.625, 164.44140625), scale*Point(273.60546875, 164.76171875), scale*Point(274.66015625, 164.76171875)),
    PathCurve(scale*Point(276.76953125, 164.76171875), scale*Point(278.8984375, 164.12109375), scale*Point(281.046875, 162.83984375)),
    PathCurve(scale*Point(283.1953125, 161.55859375), scale*Point(285.5859375, 159.94140625), scale*Point(288.2265625, 157.98046875)),
    PathClose(),
    PathMove(scale*Point(314.109375, 177.3125)),
    PathLine(scale*Point(288.2265625, 177.3125)),
    PathLine(scale*Point(288.2265625, 170.52734375)),
    PathCurve(scale*Point(286.79296875, 171.734375), scale*Point(285.3984375, 172.84765625), scale*Point(284.04296875, 173.86328125)),
    PathCurve(scale*Point(282.6875, 174.87890625), scale*Point(281.16015625, 175.765625), scale*Point(279.46484375, 176.51953125)),
    PathCurve(scale*Point(277.76953125, 177.2734375), scale*Point(275.8671875, 177.85546875), scale*Point(273.75390625, 178.2734375)),
    PathCurve(scale*Point(271.64453125, 178.6875), scale*Point(269.15625, 178.89453125), scale*Point(266.296875, 178.89453125)),
    PathCurve(scale*Point(262.375, 178.89453125), scale*Point(258.8515625, 178.328125), scale*Point(255.7265625, 177.19921875)),
    PathCurve(scale*Point(252.59765625, 176.06640625), scale*Point(249.94140625, 174.5234375), scale*Point(247.7578125, 172.5625)),
    PathCurve(scale*Point(245.5703125, 170.60546875), scale*Point(243.89453125, 168.28515625), scale*Point(242.7265625, 165.609375)),
    PathCurve(scale*Point(241.55859375, 162.9375), scale*Point(240.97265625, 160.015625), scale*Point(240.97265625, 156.8515625)),
    PathCurve(scale*Point(240.97265625, 153.609375), scale*Point(241.59375, 150.671875), scale*Point(242.83984375, 148.03125)),
    PathCurve(scale*Point(244.08203125, 145.39453125), scale*Point(245.77734375, 143.0234375), scale*Point(247.92578125, 140.91015625)),
    PathCurve(scale*Point(250.07421875, 138.80078125), scale*Point(252.578125, 136.91796875), scale*Point(255.44140625, 135.2578125)),
    PathCurve(scale*Point(258.3046875, 133.6015625), scale*Point(261.37890625, 132.07421875), scale*Point(264.65625, 130.6796875)),
    PathCurve(scale*Point(267.93359375, 129.28515625), scale*Point(271.34375, 128.0078125), scale*Point(274.88671875, 126.83984375)),
    PathCurve(scale*Point(278.42578125, 125.671875), scale*Point(281.93359375, 124.55859375), scale*Point(285.3984375, 123.50390625)),
    PathLine(scale*Point(288.2265625, 122.82421875)),
    PathLine(scale*Point(288.2265625, 114.4609375)),
    PathCurve(scale*Point(288.2265625, 109.03515625), scale*Point(287.1875, 105.19140625), scale*Point(285.1171875, 102.9296875)),
    PathCurve(scale*Point(283.04296875, 100.66796875), scale*Point(280.2734375, 99.5390625), scale*Point(276.80859375, 99.5390625)),
    PathCurve(scale*Point(272.73828125, 99.5390625), scale*Point(269.91015625, 100.51953125), scale*Point(268.328125, 102.4765625)),
    PathCurve(scale*Point(266.74609375, 104.4375), scale*Point(265.953125, 106.80859375), scale*Point(265.953125, 109.59765625)),
    PathCurve(scale*Point(265.953125, 111.1796875), scale*Point(265.78515625, 112.7265625), scale*Point(265.4453125, 114.234375)),
    PathCurve(scale*Point(265.109375, 115.7421875), scale*Point(264.5234375, 117.05859375), scale*Point(263.6953125, 118.19140625)),
    PathCurve(scale*Point(262.8671875, 119.3203125), scale*Point(261.6796875, 120.2265625), scale*Point(260.1328125, 120.90234375)),
    PathCurve(scale*Point(258.58984375, 121.58203125), scale*Point(256.6484375, 121.921875), scale*Point(254.3125, 121.921875)),
    PathCurve(scale*Point(250.6953125, 121.921875), scale*Point(247.7578125, 120.8828125), scale*Point(245.49609375, 118.8125)),
    PathCurve(scale*Point(243.234375, 116.73828125), scale*Point(242.10546875, 114.12109375), scale*Point(242.10546875, 110.953125)),
    PathCurve(scale*Point(242.10546875, 108.015625), scale*Point(243.1015625, 105.28515625), scale*Point(245.09765625, 102.76171875)),
    PathCurve(scale*Point(247.09765625, 100.234375), scale*Point(249.7890625, 98.06640625), scale*Point(253.18359375, 96.26171875)),
    PathCurve(scale*Point(256.57421875, 94.44921875), scale*Point(260.4921875, 93.01953125), scale*Point(264.9375, 91.96484375)),
    PathCurve(scale*Point(269.3828125, 90.91015625), scale*Point(274.09375, 90.3828125), scale*Point(279.06640625, 90.3828125)),
    PathCurve(scale*Point(285.171875, 90.3828125), scale*Point(290.4296875, 90.9296875), scale*Point(294.83984375, 92.01953125)),
    PathCurve(scale*Point(299.24609375, 93.11328125), scale*Point(302.8828125, 94.67578125), scale*Point(305.74609375, 96.7109375)),
    PathCurve(scale*Point(308.609375, 98.74609375), scale*Point(310.71875, 101.1953125), scale*Point(312.07421875, 104.05859375)),
    PathCurve(scale*Point(313.43359375, 106.921875), scale*Point(314.109375, 110.12890625), scale*Point(314.109375, 113.66796875)),
    PathClose()]

    _red_dot = [
    PathMove(scale*Point(240.2734375, 68.08984375)),
    PathCurve(scale*Point(240.2734375, 77.7578125), scale*Point(232.4375, 85.58984375), scale*Point(222.7734375, 85.58984375)),
    PathCurve(scale*Point(213.10546875, 85.58984375), scale*Point(205.2734375, 77.7578125), scale*Point(205.2734375, 68.08984375)),
    PathCurve(scale*Point(205.2734375, 58.42578125), scale*Point(213.10546875, 50.58984375), scale*Point(222.7734375, 50.58984375)),
    PathCurve(scale*Point(232.4375, 50.58984375), scale*Point(240.2734375, 58.42578125), scale*Point(240.2734375, 68.08984375)),
    ]

    _blue_dot = [
    PathMove(scale*Point(77.953125, 68.08984375)),
    PathCurve(scale*Point(77.953125, 77.7578125), scale*Point(70.1171875, 85.58984375), scale*Point(60.453125, 85.58984375)),
    PathCurve(scale*Point(50.7890625, 85.58984375), scale*Point(42.953125, 77.7578125), scale*Point(42.953125, 68.08984375)),
    PathCurve(scale*Point(42.953125, 58.42578125), scale*Point(50.7890625, 50.58984375), scale*Point(60.453125, 50.58984375)),
    PathCurve(scale*Point(70.1171875, 50.58984375), scale*Point(77.953125, 58.42578125), scale*Point(77.953125, 68.08984375)),
    ]

    _purple_dot = [
    PathMove(scale*Point(282.3203125, 68.08984375)),
    PathCurve(scale*Point(282.3203125, 77.7578125), scale*Point(274.484375, 85.58984375), scale*Point(264.8203125, 85.58984375)),
    PathCurve(scale*Point(255.15625, 85.58984375), scale*Point(247.3203125, 77.7578125), scale*Point(247.3203125, 68.08984375)),
    PathCurve(scale*Point(247.3203125, 58.42578125), scale*Point(255.15625, 50.58984375), scale*Point(264.8203125, 50.58984375)),
    PathCurve(scale*Point(274.484375, 50.58984375), scale*Point(282.3203125, 58.42578125), scale*Point(282.3203125, 68.08984375)),
    ]

    _green_dot = [
    PathMove(scale*Point(261.30078125, 31.671875)),
    PathCurve(scale*Point(261.30078125, 41.3359375), scale*Point(253.46484375, 49.171875), scale*Point(243.80078125, 49.171875)),
    PathCurve(scale*Point(234.1328125, 49.171875), scale*Point(226.30078125, 41.3359375), scale*Point(226.30078125, 31.671875)),
    PathCurve(scale*Point(226.30078125, 22.0078125), scale*Point(234.1328125, 14.171875), scale*Point(243.80078125, 14.171875)),
    PathCurve(scale*Point(253.46484375, 14.171875), scale*Point(261.30078125, 22.0078125), scale*Point(261.30078125, 31.671875))
    ]

    if action == :clip
        map.(drawpath, (_j, _u, _l, _i, _a))
        map(drawpath, _blue_dot)
        map(drawpath, _green_dot)
        map(drawpath, _purple_dot)
        map(drawpath, _red_dot)
        do_action(:clip)
    elseif action == :path
        map.(drawpath, (_j, _u, _l, _i, _a))
        map(drawpath, _blue_dot)
        map(drawpath, _green_dot)
        map(drawpath, _purple_dot)
        map(drawpath, _red_dot)
    elseif color == true
        setcolor(bodycolor)
        map.(drawpath, (_j, _u, _l, _i, _a))
        do_action(action)

        sethue(Luxor.julia_blue)
        map(drawpath, _blue_dot)
        do_action(action)

        sethue(Luxor.julia_green)
        map(drawpath, _green_dot)
        do_action(action)

        sethue(Luxor.julia_purple)
        map(drawpath, _purple_dot)
        do_action(action)

        sethue(Luxor.julia_red)
        map(drawpath, _red_dot)
        do_action(action)
    else
        sethue(bodycolor)
        map.(drawpath, (_j, _u, _l, _i, _a))
        map(drawpath, _blue_dot)
        map(drawpath, _green_dot)
        map(drawpath, _purple_dot)
        map(drawpath, _red_dot)
        do_action(action)
    end
    # restore saved color
    setcolor(original_color)

    # and position
    if centered == true
        translate(scale*Point(330, 213)/2)
    end
end

"""
    save_vibes(filepath::String="vibes.svg")

Create an image of the Eindhoven vibes with Julia styled colors.
"""
function save_vibes(filepath::String="vibes.svg"; scale=4.5)
    Drawing(ceil(93*scale), ceil(133*scale), filepath)
    origin()
    background(1, 1, 1, 0)
    translate(-35.5*scale, -24.5*scale)
    draw_vibes(scale=scale)
    finish()
    preview()
end

function save_logo(filepath::String="eindhoven.svg"; scale=4.5, textcolor="black")
    Drawing(ceil((150+93)*scale), ceil(133*scale), filepath)
    origin()
    background(1, 1, 1, 0)

    translate((75-35.5)*scale, -24.5*scale)
    draw_vibes(scale=scale)

    translate(-80*scale, -10*scale)
    draw_eindhoven(;scale=scale, textcolor=textcolor)

    translate(-70*scale, -107*scale)
    scaled_julialogo(;bodycolor=textcolor, scale=scale/2.4)

    finish()
    preview()
end

end
