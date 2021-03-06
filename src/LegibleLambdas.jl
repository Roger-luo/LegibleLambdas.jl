module LegibleLambdas

using MacroTools: postwalk
export @λ, @lambda, LegibleLambda

"""
    @λ <lambda definition>

Create legible lambdas.

# Example

```julia
julia> @λ(x -> g(x)/3)
(x -> g(x)/3)
```
"""
:(@λ)

macro lambda(ex)
    return :(@λ($ex))
end

# NOTE: Base.@locals is in v1.1
@static if VERSION < v"1.1.0"
    # NO Base.@locals
    include("no_local.jl")
else
    # With Base.@locals
    include("local.jl")
end

include("replace_variable.jl")
include("expr_printing.jl")

end
