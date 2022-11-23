using EindhovenLogo
using Test

@testset "EindhovenLogo.jl" begin
    points = EindhovenLogo.vibe_points(scale=1)
    @test length(points) == 12

    points2 = EindhovenLogo.vibe_points(scale=2)
    @test all(isapprox.(2 .* points, points2))
end
