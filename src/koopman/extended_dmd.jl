
function ExtendedDMD(X::AbstractArray, Ψ; alg::O = DMDPINV(), p::AbstractArray = [], dt::T = 0.0, kwargs...)  where {O <: abstractDMDAlg, T <: Real}
    return ExtendedDMD(X[:, 1:end-1], X[:, 2:end], Ψ, alg = alg, p = p, dt = dt, kwargs...)
end

function ExtendedDMD(X::AbstractArray, Y::AbstractArray, ψ; alg::O = DMDPINV(), p::AbstractArray = [], dt::T = 0.0, kwargs...)  where {O <: abstractDMDAlg, T <: Real}
    @assert dt >= zero(typeof(dt)) "Provide positive dt"
    @assert size(X) == size(Y) "Provide consistent dimensions for data"

    # Transform Data
    Ψ₀ = ψ(X, p, 0.0)
    Ψ₁ = ψ(Y, p, 0.0)

    A = estimate_operator(alg, Ψ₀, Ψ₁; kwargs...)

    C = X*pinv(Ψ₀)

    return  Koopman(A, ψ, C, Q = Ψ₁*Ψ₀', P = Ψ₀*Ψ₀', dt = dt)
end

function ExtendedDMD(X::AbstractArray, Y::AbstractArray, ψ::Basis; alg::O = DMDPINV(), p::AbstractArray = [], dt::T = 0.0, kwargs...)  where {O <: abstractDMDAlg, T <: Real}
    @assert dt >= zero(typeof(dt)) "Provide positive dt"
    @assert size(X) == size(Y) "Provide consistent dimensions for data"

    # Transform Data
    Ψ₀ = ψ(X, p = p)
    Ψ₁ = ψ(Y, p = p)

    A = estimate_operator(alg, Ψ₀, Ψ₁; kwargs...)

    C = X*pinv(Ψ₀)

    return  Koopman(A, (u, p, t)->ψ(u, p = p), (u, p, t)->C*u, Q = Ψ₁*Ψ₀', P = Ψ₀*Ψ₀', dt = dt)

end