using Aqua
using MoleculeDatasets

@testset "Aqua Quality Assurance" begin
    @testset "Aqua.jl tests" begin
        Aqua.test_all(
            MoleculeDatasets;
            ambiguities = false,
            deps_compat = true,
            stale_deps = true,
            project_extras = true,
            piracies = true,
            unbound_args = true
        )
    end

    @testset "No type piracy" begin
        Aqua.test_piracies(MoleculeDatasets)
    end

    @testset "Dependencies compatibility" begin
        Aqua.test_deps_compat(MoleculeDatasets)
    end

    @testset "No stale dependencies" begin
        Aqua.test_stale_deps(MoleculeDatasets)
    end
end