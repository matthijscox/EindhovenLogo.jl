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

#= previous font-based version
function draw_eindhoven(; scale::Real=4.5, textcolor="black")
    fontface("Bangla MN Bold")
    fontsize(24.5 * scale)
    sethue(textcolor)
    textoutlines("eindhoven", O, :path; valign=:middle, halign=:center)
    fillpreserve()
    #settext("eindhoven", Point(xoffset-215*scale, 110*scale))
    sethue(Luxor.julia_blue...)
    return circle(-45 * scale, -7.5 * scale, 2.5 * scale, :fill)
end
=#

function draw_eindhoven(; scale::Real=4.5, textcolor="black", dotcolor=Luxor.Colors.RGB(Luxor.julia_blue...))
    @layer begin
        sethue(textcolor)
        Luxor.scale(scale)
        # newpath
        move(Point(45.51, 131.337),)
        curve(Point(50.303, 131.337), Point(55.057, 130.435), Point(59.769, 128.631),)
        curve(Point(64.482, 126.826), Point(68.832, 124.376), Point(72.817, 121.279),)
        curve(Point(76.803, 118.182), Point(80.29, 114.559), Point(83.28, 110.412),)
        curve(Point(86.269, 106.265), Point(88.437, 101.848), Point(89.783, 97.162),)
        line(Point(76.291, 95.143),)
        curve(Point(75.483, 97.728), Point(74.218, 100.179), Point(72.494, 102.495),)
        curve(Point(70.771, 104.811), Point(68.724, 106.844), Point(66.354, 108.594),)
        curve(Point(63.984, 110.345), Point(61.399, 111.718), Point(58.598, 112.715),)
        curve(Point(55.797, 113.711), Point(52.943, 114.209), Point(50.034, 114.209),)
        curve(Point(46.695, 114.209), Point(43.652, 113.226), Point(40.905, 111.261),)
        curve(Point(38.158, 109.295), Point(35.761, 106.642), Point(33.714, 103.303),)
        curve(Point(31.668, 99.963), Point(30.038, 96.112), Point(28.827, 91.75),)
        curve(Point(27.615, 87.387), Point(26.928, 82.809), Point(26.766, 78.015),)
        line(Point(86.875, 78.015),)
        curve(Point(86.875, 72.844), Point(85.878, 68.01), Point(83.886, 63.513),)
        curve(Point(81.893, 59.016), Point(79.105, 55.084), Point(75.524, 51.718),)
        curve(Point(71.942, 48.351), Point(67.633, 45.712), Point(62.597, 43.8),)
        curve(Point(57.561, 41.888), Point(52.027, 40.932), Point(45.995, 40.932),)
        curve(Point(39.208, 40.932), Point(33.041, 42.144), Point(27.494, 44.568),)
        curve(Point(21.946, 46.991), Point(17.206, 50.344), Point(13.274, 54.626),)
        curve(Point(9.343, 58.908), Point(6.299, 63.971), Point(4.145, 69.815),)
        curve(Point(1.991, 75.659), Point(0.913, 82.001), Point(0.913, 88.841),)
        curve(Point(0.913, 94.55), Point(2.071, 99.977), Point(4.387, 105.12),)
        curve(Point(6.703, 110.264), Point(9.881, 114.775), Point(13.921, 118.653),)
        curve(Point(17.96, 122.531), Point(22.686, 125.614), Point(28.099, 127.903),)
        curve(Point(33.512, 130.193), Point(39.316, 131.337), Point(45.51, 131.337),)
        closepath()
        move(Point(56.659, 69.047),)
        line(Point(26.928, 69.047),)
        curve(Point(27.197, 66.462), Point(27.776, 64.106), Point(28.665, 61.978),)
        curve(Point(29.554, 59.851), Point(30.644, 58.033), Point(31.937, 56.525),)
        curve(Point(33.23, 55.017), Point(34.657, 53.859), Point(36.219, 53.051),)
        curve(Point(37.781, 52.243), Point(39.37, 51.839), Point(40.986, 51.839),)
        curve(Point(43.086, 51.839), Point(45.039, 52.256), Point(46.843, 53.091),)
        curve(Point(48.647, 53.926), Point(50.236, 55.097), Point(51.61, 56.605),)
        curve(Point(52.983, 58.114), Point(54.114, 59.918), Point(55.003, 62.018),)
        curve(Point(55.892, 64.119), Point(56.444, 66.462), Point(56.659, 69.047),)
        closepath()
        fillpath()
        # newpath i, but just the body
        move(Point(98.621, 47.395),)
        line(Point(98.621, 129.398),)
        line(Point(124.878, 129.398),)
        line(Point(124.878, 40.124),)
        closepath()
        fillpath()
        # newpath
        move(Point(190.866, 70.017),)
        line(Point(190.866, 129.398),)
        line(Point(217.123, 129.398),)
        line(Point(217.123, 67.351),)
        curve(Point(217.123, 63.688), Point(216.41, 60.255), Point(214.982, 57.05),)
        curve(Point(213.555, 53.845), Point(211.643, 51.044), Point(209.246, 48.648),)
        curve(Point(206.849, 46.251), Point(204.049, 44.366), Point(200.844, 42.992),)
        curve(Point(197.639, 41.619), Point(194.259, 40.932), Point(190.705, 40.932),)
        curve(Point(186.073, 40.932), Point(181.441, 41.619), Point(176.809, 42.992),)
        curve(Point(172.177, 44.366), Point(167.841, 46.534), Point(163.801, 49.496),)
        line(Point(163.801, 42.709),)
        line(Point(137.383, 42.709),)
        line(Point(137.383, 129.398),)
        line(Point(163.801, 129.398),)
        line(Point(163.801, 65.896),)
        curve(Point(165.363, 64.442), Point(166.979, 63.123), Point(168.649, 61.938),)
        curve(Point(170.318, 60.753), Point(171.961, 59.743), Point(173.577, 58.908),)
        curve(Point(175.193, 58.073), Point(176.741, 57.427), Point(178.222, 56.969),)
        curve(Point(179.704, 56.511), Point(181.01, 56.282), Point(182.141, 56.282),)
        curve(Point(183.272, 56.282), Point(184.362, 56.579), Point(185.413, 57.171),)
        curve(Point(186.463, 57.763), Point(187.392, 58.639), Point(188.2, 59.797),)
        curve(Point(189.008, 60.955), Point(189.654, 62.395), Point(190.139, 64.119),)
        curve(Point(190.624, 65.843), Point(190.866, 67.808), Point(190.866, 70.017),)
        closepath()
        fillpath()
        # newpath
        move(Point(284.864, 124.308),)
        line(Point(284.864, 129.398),)
        line(Point(311.04, 129.398),)
        line(Point(311.04, 0.537),)
        line(Point(284.864, 7.808),)
        line(Point(284.864, 43.194),)
        curve(Point(283.086, 42.44), Point(281.067, 41.875), Point(278.805, 41.498),)
        curve(Point(276.542, 41.121), Point(274.146, 40.932), Point(271.614, 40.932),)
        curve(Point(264.989, 40.932), Point(258.782, 42.238), Point(252.992, 44.85),)
        curve(Point(247.202, 47.463), Point(242.152, 50.923), Point(237.844, 55.232),)
        curve(Point(233.535, 59.541), Point(230.128, 64.442), Point(227.623, 69.936),)
        curve(Point(225.119, 75.43), Point(223.867, 81.085), Point(223.867, 86.902),)
        curve(Point(223.867, 90.78), Point(224.338, 94.577), Point(225.281, 98.294),)
        curve(Point(226.223, 102.01), Point(227.529, 105.511), Point(229.199, 108.796),)
        curve(Point(230.869, 112.082), Point(232.902, 115.112), Point(235.299, 117.885),)
        curve(Point(237.695, 120.659), Point(240.348, 123.043), Point(243.257, 125.035),)
        curve(Point(246.165, 127.028), Point(249.289, 128.577), Point(252.628, 129.681),)
        curve(Point(255.968, 130.785), Point(259.469, 131.337), Point(263.131, 131.337),)
        curve(Point(266.794, 131.337), Point(270.537, 130.718), Point(274.361, 129.479),)
        curve(Point(278.185, 128.24), Point(281.686, 126.517), Point(284.864, 124.308),)
        closepath()
        move(Point(284.864, 70.34),)
        line(Point(284.864, 112.109),)
        curve(Point(284.11, 113.024), Point(283.235, 113.873), Point(282.238, 114.654),)
        curve(Point(281.242, 115.435), Point(280.191, 116.108), Point(279.087, 116.674),)
        curve(Point(277.983, 117.239), Point(276.866, 117.67), Point(275.734, 117.966),)
        curve(Point(274.603, 118.262), Point(273.553, 118.41), Point(272.584, 118.41),)
        curve(Point(269.729, 118.41), Point(267.063, 117.428), Point(264.585, 115.462),)
        curve(Point(262.108, 113.496), Point(259.926, 110.857), Point(258.041, 107.544),)
        curve(Point(256.156, 104.232), Point(254.675, 100.394), Point(253.598, 96.031),)
        curve(Point(252.521, 91.669), Point(251.982, 87.091), Point(251.982, 82.297),)
        curve(Point(251.982, 77.88), Point(252.453, 73.787), Point(253.396, 70.017),)
        curve(Point(254.338, 66.247), Point(255.618, 62.988), Point(257.233, 60.241),)
        curve(Point(258.849, 57.494), Point(260.734, 55.353), Point(262.889, 53.818),)
        curve(Point(265.043, 52.283), Point(267.332, 51.516), Point(269.756, 51.516),)
        curve(Point(271.587, 51.516), Point(273.405, 51.973), Point(275.209, 52.889),)
        curve(Point(277.014, 53.805), Point(278.629, 55.084), Point(280.057, 56.727),)
        curve(Point(281.484, 58.369), Point(282.642, 60.349), Point(283.531, 62.665),)
        curve(Point(284.419, 64.981), Point(284.864, 67.539), Point(284.864, 70.34),)
        closepath()
        fillpath()
        # newpath
        move(Point(375.224, 70.017),)
        line(Point(375.224, 129.398),)
        line(Point(401.643, 129.398),)
        line(Point(401.643, 67.351),)
        curve(Point(401.643, 63.688), Point(400.983, 60.241), Point(399.663, 57.009),)
        curve(Point(398.344, 53.778), Point(396.539, 50.964), Point(394.25, 48.567),)
        curve(Point(391.961, 46.17), Point(389.268, 44.271), Point(386.171, 42.871),)
        curve(Point(383.074, 41.471), Point(379.775, 40.77), Point(376.274, 40.77),)
        curve(Point(371.588, 40.77), Point(366.768, 41.484), Point(361.813, 42.911),)
        curve(Point(356.858, 44.339), Point(352.36, 46.534), Point(348.321, 49.496),)
        line(Point(348.321, 0.537),)
        line(Point(321.74, 7.808),)
        line(Point(321.74, 129.398),)
        line(Point(348.321, 129.398),)
        line(Point(348.321, 65.735),)
        curve(Point(349.829, 64.388), Point(351.471, 63.136), Point(353.249, 61.978),)
        curve(Point(355.026, 60.82), Point(356.79, 59.81), Point(358.541, 58.948),)
        curve(Point(360.291, 58.087), Point(361.934, 57.427), Point(363.469, 56.969),)
        curve(Point(365.004, 56.511), Point(366.31, 56.282), Point(367.387, 56.282),)
        curve(Point(369.703, 56.282), Point(371.588, 57.454), Point(373.043, 59.797),)
        curve(Point(374.497, 62.14), Point(375.224, 65.546), Point(375.224, 70.017),)
        closepath()
        fillpath()
        # newpath
        move(Point(455.809, 131.014),)
        curve(Point(462.703, 131.014), Point(469.085, 129.789), Point(474.956, 127.338),)
        curve(Point(480.827, 124.887), Point(485.903, 121.548), Point(490.185, 117.32),)
        curve(Point(494.467, 113.092), Point(497.82, 108.15), Point(500.243, 102.495),)
        curve(Point(502.667, 96.839), Point(503.879, 90.807), Point(503.879, 84.398),)
        curve(Point(503.879, 78.311), Point(502.667, 72.629), Point(500.243, 67.351),)
        curve(Point(497.82, 62.072), Point(494.467, 57.467), Point(490.185, 53.535),)
        curve(Point(485.903, 49.604), Point(480.813, 46.52), Point(474.916, 44.285),)
        curve(Point(469.018, 42.05), Point(462.622, 40.932), Point(455.728, 40.932),)
        curve(Point(448.834, 40.932), Point(442.465, 42.077), Point(436.621, 44.366),)
        curve(Point(430.777, 46.655), Point(425.727, 49.832), Point(421.472, 53.899),)
        curve(Point(417.217, 57.965), Point(413.891, 62.813), Point(411.495, 68.441),)
        curve(Point(409.098, 74.07), Point(407.899, 80.223), Point(407.899, 86.902),)
        curve(Point(407.899, 93.096), Point(409.098, 98.886), Point(411.495, 104.272),)
        curve(Point(413.891, 109.658), Point(417.217, 114.331), Point(421.472, 118.289),)
        curve(Point(425.727, 122.248), Point(430.79, 125.359), Point(436.661, 127.621),)
        curve(Point(442.532, 129.883), Point(448.914, 131.014), Point(455.809, 131.014),)
        closepath()
        move(Point(458.879, 120.43),)
        curve(Point(455.324, 120.43), Point(452.146, 119.34), Point(449.345, 117.158),)
        curve(Point(446.544, 114.977), Point(444.161, 112.028), Point(442.195, 108.312),)
        curve(Point(440.229, 104.595), Point(438.735, 100.259), Point(437.711, 95.304),)
        curve(Point(436.688, 90.349), Point(436.176, 85.071), Point(436.176, 79.469),)
        curve(Point(436.176, 75.753), Point(436.621, 72.198), Point(437.509, 68.805),)
        curve(Point(438.398, 65.412), Point(439.57, 62.422), Point(441.024, 59.837),)
        curve(Point(442.478, 57.252), Point(444.161, 55.192), Point(446.073, 53.657),)
        curve(Point(447.985, 52.122), Point(449.965, 51.354), Point(452.011, 51.354),)
        curve(Point(456.32, 51.354), Point(459.969, 52.431), Point(462.958, 54.586),)
        curve(Point(465.948, 56.74), Point(468.371, 59.649), Point(470.23, 63.311),)
        curve(Point(472.088, 66.974), Point(473.421, 71.256), Point(474.229, 76.157),)
        curve(Point(475.037, 81.058), Point(475.441, 86.283), Point(475.441, 91.83),)
        curve(Point(475.441, 95.601), Point(475.023, 99.209), Point(474.188, 102.656),)
        curve(Point(473.354, 106.103), Point(472.209, 109.146), Point(470.755, 111.786),)
        curve(Point(469.301, 114.425), Point(467.564, 116.525), Point(465.544, 118.087),)
        curve(Point(463.524, 119.649), Point(461.302, 120.43), Point(458.879, 120.43),)
        closepath()
        fillpath()
        # newpath
        move(Point(526.588, 41.094),)
        line(Point(498.958, 41.094),)
        line(Point(540.969, 131.337),)
        line(Point(553.007, 131.337),)
        line(Point(595.826, 41.094),)
        line(Point(577.809, 41.094),)
        line(Point(551.956, 95.466),)
        closepath()
        fillpath()
        # newpath
        move(Point(637.958, 131.337),)
        curve(Point(642.751, 131.337), Point(647.504, 130.435), Point(652.217, 128.631),)
        curve(Point(656.93, 126.826), Point(661.279, 124.376), Point(665.265, 121.279),)
        curve(Point(669.251, 118.182), Point(672.738, 114.559), Point(675.727, 110.412),)
        curve(Point(678.717, 106.265), Point(680.885, 101.848), Point(682.231, 97.162),)
        line(Point(668.739, 95.143),)
        curve(Point(667.931, 97.728), Point(666.665, 100.179), Point(664.942, 102.495),)
        curve(Point(663.218, 104.811), Point(661.172, 106.844), Point(658.802, 108.594),)
        curve(Point(656.432, 110.345), Point(653.846, 111.718), Point(651.046, 112.715),)
        curve(Point(648.245, 113.711), Point(645.39, 114.209), Point(642.482, 114.209),)
        curve(Point(639.143, 114.209), Point(636.099, 113.226), Point(633.353, 111.26),)
        curve(Point(630.606, 109.295), Point(628.209, 106.642), Point(626.162, 103.303),)
        curve(Point(624.115, 99.963), Point(622.486, 96.112), Point(621.274, 91.749),)
        curve(Point(620.062, 87.387), Point(619.376, 82.809), Point(619.214, 78.015),)
        line(Point(679.323, 78.015),)
        curve(Point(679.323, 72.844), Point(678.326, 68.01), Point(676.333, 63.513),)
        curve(Point(674.34, 59.016), Point(671.553, 55.084), Point(667.971, 51.718),)
        curve(Point(664.39, 48.351), Point(660.081, 45.712), Point(655.045, 43.8),)
        curve(Point(650.009, 41.888), Point(644.475, 40.932), Point(638.442, 40.932),)
        curve(Point(631.656, 40.932), Point(625.489, 42.144), Point(619.941, 44.568),)
        curve(Point(614.394, 46.991), Point(609.654, 50.344), Point(605.722, 54.626),)
        curve(Point(601.79, 58.908), Point(598.747, 63.971), Point(596.593, 69.815),)
        curve(Point(594.438, 75.659), Point(593.361, 82.001), Point(593.361, 88.841),)
        curve(Point(593.361, 94.55), Point(594.519, 99.977), Point(596.835, 105.12),)
        curve(Point(599.151, 110.264), Point(602.329, 114.775), Point(606.368, 118.653),)
        curve(Point(610.408, 122.531), Point(615.134, 125.614), Point(620.547, 127.903),)
        curve(Point(625.96, 130.193), Point(631.764, 131.337), Point(637.958, 131.337),)
        closepath()
        move(Point(649.107, 69.047),)
        line(Point(619.376, 69.047),)
        curve(Point(619.645, 66.462), Point(620.224, 64.106), Point(621.113, 61.978),)
        curve(Point(622.001, 59.851), Point(623.092, 58.033), Point(624.385, 56.525),)
        curve(Point(625.677, 55.017), Point(627.105, 53.859), Point(628.667, 53.051),)
        curve(Point(630.229, 52.243), Point(631.818, 51.839), Point(633.433, 51.839),)
        curve(Point(635.534, 51.839), Point(637.486, 52.256), Point(639.291, 53.091),)
        curve(Point(641.095, 53.926), Point(642.684, 55.097), Point(644.057, 56.605),)
        curve(Point(645.431, 58.114), Point(646.562, 59.918), Point(647.451, 62.018),)
        curve(Point(648.339, 64.119), Point(648.891, 66.462), Point(649.107, 69.047),)
        closepath()
        fillpath()
        # newpath
        move(Point(743.332, 70.017),)
        line(Point(743.332, 129.398),)
        line(Point(769.589, 129.398),)
        line(Point(769.589, 67.351),)
        curve(Point(769.589, 63.688), Point(768.876, 60.255), Point(767.448, 57.05),)
        curve(Point(766.021, 53.845), Point(764.109, 51.044), Point(761.712, 48.648),)
        curve(Point(759.315, 46.251), Point(756.515, 44.366), Point(753.31, 42.992),)
        curve(Point(750.105, 41.619), Point(746.725, 40.932), Point(743.171, 40.932),)
        curve(Point(738.539, 40.932), Point(733.907, 41.619), Point(729.275, 42.992),)
        curve(Point(724.643, 44.366), Point(720.307, 46.534), Point(716.267, 49.496),)
        line(Point(716.267, 42.709),)
        line(Point(689.849, 42.709),)
        line(Point(689.849, 129.398),)
        line(Point(716.267, 129.398),)
        line(Point(716.267, 65.896),)
        curve(Point(717.829, 64.442), Point(719.445, 63.123), Point(721.115, 61.938),)
        curve(Point(722.784, 60.753), Point(724.427, 59.743), Point(726.043, 58.908),)
        curve(Point(727.659, 58.073), Point(729.207, 57.427), Point(730.688, 56.969),)
        curve(Point(732.17, 56.511), Point(733.476, 56.282), Point(734.607, 56.282),)
        curve(Point(735.738, 56.282), Point(736.829, 56.579), Point(737.879, 57.171),)
        curve(Point(738.929, 57.763), Point(739.858, 58.639), Point(740.666, 59.797),)
        curve(Point(741.474, 60.955), Point(742.12, 62.395), Point(742.605, 64.119),)
        curve(Point(743.09, 65.843), Point(743.332, 67.808), Point(743.332, 70.017),)
        closepath()
        fillpath()
        # end
        # the blue dot (tittle)
        @layer begin
            sethue(dotcolor)
            translate(Point(111.669, 15.498),)
            circle(O, 18.0, :fill)
        end
    end
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

    @layer begin
        translate((75 - 35.5) * scale, -24.5 * scale)
        draw_vibes(; scale=scale)
    end

    #= old version
    @layer begin
        translate(-40 * scale, 40 * scale)
        draw_eindhoven_old(; scale=scale, textcolor=textcolor)
    end
    =#

    @layer begin
        translate(-105 * scale, 30 * scale)
        draw_eindhoven(;scale=scale / 6, textcolor=textcolor)
    end

    @layer begin
        translate(-112 * scale, -65 * scale)
        scaled_julialogo(; bodycolor=textcolor, scale=scale / 2.3)
    end

    finish()
    preview()
end

end
