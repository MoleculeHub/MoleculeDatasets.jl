# MoleculeDatasets.jl

[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/JuliaDiff/BlueStyle)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

A Julia package for easily downloading and accessing popular cheminformatics datasets.

## Installation

```julia
using Pkg
Pkg.add("MoleculeDatasets")
```

## Quick Start

```julia
using MoleculeDatasets

# Download and load a dataset
data = get_mol_dataset("esol")
```

## Available Datasets

See [dataset_info.jl](https://github.com/MoleculeHub/MoleculeDatasets.jl/blob/main/src/dataset_info.jl)

## Adding a Dataset

To add a new dataset to the package, edit the `MOL_DATASETS` dictionary in [`src/dataset_info.jl`](src/dataset_info.jl). Each dataset entry should include:

**For local datasets:**
```julia
"dataset_key" => Dict(
    "name" => "Dataset Display Name",
    "description" => "Brief description of the dataset",
    "filepath" => "data/filename.csv",
    "format" => "csv",
    "size" => "file size",
    "type" => "local",
    "reference" => "Full citation",
    "doi" => "DOI if available",
    "website" => "URL if available"
)
```

**For remote datasets:**
```julia
"dataset_key" => Dict(
    "name" => "Dataset Display Name",
    "description" => "Brief description of the dataset",
    "url" => "https://example.com/dataset.csv",
    "format" => "csv",
    "size" => "file size",
    "type" => "remote",
    "reference" => "Full citation",
    "doi" => "DOI if available",
    "website" => "URL if available"
)
```

## API Reference

### Dataset Functions
- `get_mol_dataset(name; output_dir="data", force_download=false, verbose=true)`: Download and load a dataset as a DataFrame
