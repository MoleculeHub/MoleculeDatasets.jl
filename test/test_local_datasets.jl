using Test
using MoleculeDatasets
using CSV
using DataFrames

@testset "Local Dataset Handling" begin

    @testset "File format detection" begin
        @test MoleculeDatasets.detect_file_format("test.csv") == "csv"
        @test MoleculeDatasets.detect_file_format("test.txt") == "txt"
        @test MoleculeDatasets.detect_file_format("test.json") == "json"
        @test MoleculeDatasets.detect_file_format("test.unknown") == "unknown"
    end

    @testset "File size formatting" begin
        @test MoleculeDatasets.format_file_size(1024) == "1.0 KB"
        @test MoleculeDatasets.format_file_size(1048576) == "1.0 MB"
        @test MoleculeDatasets.format_file_size(500) == "500 B"
    end
end