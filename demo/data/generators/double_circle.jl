using DelimitedFiles
using Distributions
using Random

# Step 0
Random.seed!(10000)
N = 1000

# Step 1
r = rand(Uniform(2.8, 3.2), N)
ϕ = rand(Normal(90, 1.3), N)

# Step 2
δ1 = r .* cos.(ϕ)
δ2 = r .* sin.(ϕ)

# Step 3
δ2[1:Int(N / 2)] = δ2[1:Int(N / 2)] .+ 2.9
δ2[Int((N / 2) + 1):N] = (δ2[Int((N / 2) + 1):N] * (-1)) .- 2.9

δ = [δ1 δ2]

writedlm("demo/data/double_circle.csv", δ, ',')
