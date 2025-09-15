using Test
using HTTP
using MoleculeDatasets

@testset "Remote Dataset Availability" begin
    @testset "All remote datasets are accessible" begin
        remote_datasets = filter(p -> p.second["type"] == "remote", MoleculeDatasets.MOL_DATASETS)

        for (name, info) in remote_datasets
            @testset "Dataset: $name" begin
                url = info["url"]

                is_accessible = false
                last_error = nothing

                try
                    response = HTTP.head(url; timeout=15, retry=false)
                    status = response.status
                    is_accessible = status in [200, 301, 302]
                catch e1
                    # Some servers don't support HEAD, try GET with minimal range
                    try
                        response = HTTP.get(url; timeout=15, retry=false,
                                          headers=["Range" => "bytes=0-0"])
                        status = response.status
                        is_accessible = status in [200, 206, 301, 302, 416]  # 416 = Range Not Satisfiable is OK
                    catch e2
                        # Fallback: try basic GET request
                        try
                            response = HTTP.get(url; timeout=15, retry=false,
                                              headers=["User-Agent" => "Julia HTTP.jl"])
                            is_accessible = response.status in [200, 301, 302]
                        catch e3
                            last_error = e3
                            is_accessible = false
                        end
                    end
                end

                @test is_accessible

                @test haskey(info, "name")
                @test haskey(info, "description")
                @test haskey(info, "url")
                @test haskey(info, "format")
                @test haskey(info, "size")
                @test info["type"] == "remote"

                @test startswith(info["url"], "http")
                @test !isempty(info["name"])
                @test !isempty(info["description"])
            end
        end
    end

    @testset "Dataset registry integrity" begin
        @test !isempty(MoleculeDatasets.MOL_DATASETS)

        names = [info["name"] for info in values(MoleculeDatasets.MOL_DATASETS)]
        @test length(names) == length(unique(names))

        remote_datasets = filter(p -> p.second["type"] == "remote", MoleculeDatasets.MOL_DATASETS)
        for (_, info) in remote_datasets
            @test haskey(info, "url")
            @test !isempty(info["url"])
        end
    end
end