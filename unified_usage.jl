using Pkg
Pkg.activate(".")
using MoleculeDatasets
using DataFrames

list_mol_datasets()

data = get_mol_dataset("esol")