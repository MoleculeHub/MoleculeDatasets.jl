# Utility functions
function get_filename_from_url(url::String)
    parts = split(url, "/")
    filename = parts[end]

    if filename == "" || !contains(filename, ".")
        return "dataset_file"
    end

    return filename
end

function format_file_size(size_bytes::Int)
    units = ["B", "KB", "MB", "GB", "TB"]
    size = Float64(size_bytes)
    unit_index = 1

    while size >= 1024 && unit_index < length(units)
        size /= 1024
        unit_index += 1
    end

    if unit_index == 1
        return "$(Int(size)) $(units[unit_index])"
    else
        return "$(round(size, digits=1)) $(units[unit_index])"
    end
end

function detect_file_format(filepath::String)
    ext = lowercase(splitext(filepath)[2])
    format_map = Dict(
        ".csv" => "csv",
        ".tsv" => "tsv",
        ".txt" => "txt",
        ".json" => "json",
        ".xlsx" => "excel",
        ".sdf" => "sdf",
        ".mol" => "mol",
        ".pdb" => "pdb",
        ".xyz" => "xyz"
    )
    return get(format_map, ext, "unknown")
end

function load_dataset(filepath::String; delimiter::Union{Char, Nothing}=nothing, kwargs...)
    format = detect_file_format(filepath)

    if format == "csv"
        delim = delimiter !== nothing ? delimiter : ','
        return CSV.read(filepath, DataFrame; delim=delim, kwargs...)
    elseif format == "tsv"
        delim = delimiter !== nothing ? delimiter : '\t'
        return CSV.read(filepath, DataFrame; delim=delim, kwargs...)
    elseif format == "txt"
        delim = delimiter !== nothing ? delimiter : '\t'
        return CSV.read(filepath, DataFrame; delim=delim, kwargs...)
    else
        # For other formats, try to read as CSV with auto-detection
        try
            delim = delimiter !== nothing ? delimiter : ','
            return CSV.read(filepath, DataFrame; delim=delim, kwargs...)
        catch
            # If CSV reading fails, return filepath for backward compatibility
            @warn "Could not load $filepath as DataFrame, returning filepath instead"
            return filepath
        end
    end
end

# Main dataset handling functions
function get_mol_dataset(dataset_name::String;
                        output_dir::String = "data",
                        force_download::Bool = false,
                        verbose::Bool = true)

    if !haskey(MOL_DATASETS, dataset_name)
        available = join(keys(MOL_DATASETS), ", ")
        throw(ArgumentError("Dataset '$dataset_name' not found. Available datasets: $available"))
    end

    dataset_info = MOL_DATASETS[dataset_name]

    if dataset_info["type"] == "remote"
        return _get_remote_dataset(dataset_name, dataset_info; output_dir, force_download, verbose)
    elseif dataset_info["type"] == "local"
        return _get_local_dataset(dataset_name, dataset_info; verbose)
    else
        throw(ArgumentError("Unknown dataset type: $(dataset_info["type"])"))
    end
end

function _get_remote_dataset(dataset_name::String, dataset_info::Dict;
                           output_dir::String, force_download::Bool, verbose::Bool)

    if !isdir(output_dir)
        mkpath(output_dir)
        verbose && println("Created directory: $output_dir")
    end

    filename = get_filename_from_url(dataset_info["url"])
    filepath = joinpath(output_dir, filename)

    if isfile(filepath) && !force_download
        verbose && println("Dataset '$dataset_name' already exists at: $filepath")
        verbose && println("Use force_download=true to re-download")
    else
        verbose && println("Downloading $(dataset_info["name"])...")
        verbose && println("URL: $(dataset_info["url"])")
        verbose && println("Size: $(dataset_info["size"])")

        try
            Downloads.download(dataset_info["url"], filepath)
            verbose && println("Successfully downloaded to: $filepath")

            file_size = format_file_size(stat(filepath).size)
            verbose && println("File size: $file_size")
        catch e
            rm(filepath; force=true)
            error("Failed to download dataset '$dataset_name': $e")
        end
    end

    delimiter = get(dataset_info, "delimiter", nothing)
    return load_dataset(filepath; delimiter=delimiter)
end

function _get_local_dataset(dataset_name::String, dataset_info::Dict; verbose::Bool)
    filepath = dataset_info["filepath"]

    if !isfile(filepath)
        throw(ArgumentError("Local dataset file no longer exists: $filepath"))
    end

    verbose && println("Loading local dataset: $(dataset_info["name"])")
    verbose && println("   Path: $filepath")

    delimiter = get(dataset_info, "delimiter", nothing)
    return load_dataset(filepath; delimiter=delimiter)
end

