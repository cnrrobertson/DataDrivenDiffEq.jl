using Documenter, DataDrivenDiffEq
using Flux, SymbolicRegression

ENV["GKSwstype"] = "100"

makedocs(
    sitename="DataDrivenDiffEq.jl",
    authors="Julius Martensen, Christopher Rackauckas",
    modules=[DataDrivenDiffEq],
    clean=true,doctest=false,
    format = Documenter.HTML(#analytics = "UA-90474609-3",
                             assets = ["assets/favicon.ico"],
                             canonical="https://datadriven.sciml.ai/stable/"),
    pages=[
        "Home" => "index.md",
        "Getting Started" => "getting_started.md"
        "Tutorials" => Any[
          "examples/linear_systems.md",
          "examples/nonlinear_systems.md",
          "examples/real_world.md"
        ],
        "Unifying SINDy and DMD" => "sindy_dmd.md"
        "Problems And Solvers" => "problems_solutions.md",
        "Basis" => "basis.md",
        "Koopman" => "koopman.md",
        "Sparse Optimization" => "optimization.md",
        "Symbolic Regression" => "symbolic_regression.md",
        "Utilities" => "utils.md",
        "Contributing" => "contributions.md",
        "Citing" => "citations.md"
        ]
        #"Basis" => "basis.md",
        #"Koopman Operators" => Any[
        #    "koopman/koopman.md",
        #    "koopman/dmd.md",
        #    "koopman/edmd.md",
        #    "koopman/dmdc.md",
        #    "koopman/algorithms.md"
        #],
        #"Sparse Identification" => Any[
        #    "sparse_identification/sindy.md",
        #    "sparse_identification/isindy.md",
        #    "sparse_identification/optimizers.md"
        #],
        #"Utilities" => "utils.md",
        #"Contributing" => "contributions.md",
        #"Extended Examples" => "extended_examples.md"
    #]
)

deploydocs(
   repo = "github.com/SciML/DataDrivenDiffEq.jl.git";
   push_preview = true
)
