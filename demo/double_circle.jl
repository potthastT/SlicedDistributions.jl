using DelimitedFiles
using Plots
using SlicedDistributions

δ = readdlm("demo/data/double_circle.csv", ',')

# Fit Sliced Normal Distribution
d = 8
b = 10000

@time sn, lh = SlicedNormal(δ, d, b, [-3.5, -6.5], [3.5, 6.5])

println("Likelihood: $lh")

samples = rand(sn, 1000)

p = scatter(
    δ[1, :],
    δ[2, :];
    xlims=[-3.5, 3.5],
    ylims=[-6.5, 6.5],
    xlab="δ1",
    ylab="δ2",
    label="data",
)
scatter!(p, samples[1, :], samples[2, :]; label="samples")

display(p)

# Plot density
xs = range(sn.lb[1], sn.ub[1]; length=1000)
ys = range(sn.lb[2], sn.ub[2]; length=1000)

contour!(xs, ys, (x, y) -> pdf(sn, [x, y]))