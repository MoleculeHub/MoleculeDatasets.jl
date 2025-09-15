using Test
using MoleculeDatasets
using HTTP

@testset "MoleculeDatasets.jl" begin
    include("test_aqua.jl")
    include("test_dataset_info.jl")
    include("test_remote_availability.jl")
    include("test_local_datasets.jl")
end