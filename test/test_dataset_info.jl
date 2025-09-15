using Test
using MoleculeDatasets

@testset "Dataset Information" begin
    @testset "Dataset registry access" begin
        @test isa(MoleculeDatasets.MOL_DATASETS, Dict)
        @test !isempty(MoleculeDatasets.MOL_DATASETS)
    end


    @testset "Dataset types" begin
        remote_count = 0
        local_count = 0

        for (name, info) in MoleculeDatasets.MOL_DATASETS
            if info["type"] == "remote"
                remote_count += 1
                @test haskey(info, "url")
            elseif info["type"] == "local"
                local_count += 1
                @test haskey(info, "filepath")
                filepath = info["filepath"]
                if !isfile(filepath) && !isfile(joinpath(@__DIR__, "..", filepath))
                    @warn "Local dataset '$name' file does not exist at: $filepath"
                else
                    @test true  # File exists
                end
            end
        end

        @test remote_count > 0
        @test remote_count + local_count == length(MoleculeDatasets.MOL_DATASETS)
    end

    @testset "Dataset references" begin
        for (name, info) in MoleculeDatasets.MOL_DATASETS
            @testset "References for $name" begin
                @test haskey(info, "reference")
                @test !isempty(info["reference"])

                if info["type"] == "remote"
                    if haskey(info, "doi")
                        @test !isempty(info["doi"])
                    end

                    if haskey(info, "website")
                        @test !isempty(info["website"])
                    end
                end
            end
        end
    end
end