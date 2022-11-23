module EindhovenLogo

using Luxor

export save_vibes

function vibe_points(;scale::Real = 1)::Vector{Point}
    scale *= 20
    pointlist = Point[]
    y_unit = .63
    x_unit1 = .86
    x_unit2 = .45
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

"""
    save_vibes(filepath::String="vibes.svg")

Create an image of the Eindhoven vibes with Julia styled colors.
"""
function save_vibes(filepath::String="vibes.svg"; scale=4.5)
    Drawing(93*scale, 133*scale, filepath)
    origin()
    background(1, 1, 1, 0)
    translate(-35.5*scale, -24.5*scale)
    draw_vibes(scale=scale)
    finish()
    preview()
end

end
