const MOL_DATASETS = Dict{String, Dict{String, Any}}(

    # ======= LOCAL DATASETS =======

    "covalentindb" => Dict(
        "name" => "CovalentInDB",
        "description" => "Covalent inhibitor database",
        "filepath" => "data/CovInDB_All.csv",
        "format" => "csv",
        "size" => "17.2 MB",
        "type" => "local",
        "reference" => "Hongyan Du, Xujun Zhang, Zhenxing Wu, Odin Zhang, Shukai Gu, Mingyang Wang, Feng Zhu, Dan Li, Tingjun Hou, Peichen Pan, CovalentInDB 2.0: an updated comprehensive database for structure-based and ligand-based covalent inhibitor design and screening, Nucleic Acids Research, Volume 53, Issue D1, 6 January 2025, Pages D1322–D1327, https://doi.org/10.1093/nar/gkae946",
        "website" => "https://academic.oup.com/nar/article/53/D1/D1322/7832349"
    ),

    "bbbp" => Dict(
        "name" => "BBBP",
        "description" => "Blood-brain barrier penetration dataset",
        "filepath" => "data/BBBP.csv",
        "format" => "csv",
        "size" => "161 KB",
        "type" => "local",
        "reference" => "Martins, I. F., Teixeira, A. L., Pinheiro, L. & Falcao, A. O. A Bayesian approach to in silico blood-brain barrier penetration modeling. J. Chem. Inf. Model. 52, 1686-1697 (2012).",
        "doi" => "10.1021/ci300124c",
        "website" => "https://pubs.acs.org/doi/10.1021/ci300124c"
    ),

    "esol" => Dict(
        "name" => "ESOL",
        "description" => "Aqueous solubility dataset",
        "filepath" => "data/ESOL_delaney-processed.csv",
        "format" => "csv",
        "size" => "100 KB",
        "type" => "local",
        "reference" => "Delaney, J. S. ESOL: Estimating aqueous solubility directly from molecular structure. J. Chem. Inf. Comput. Sci. 44, 1000-1005 (2004).",
        "doi" => "10.1021/ci034243x",
        "website" => "https://pubs.acs.org/doi/10.1021/ci034243x"
    ),

    "freesolv" => Dict(
        "name" => "FreeSolv",
        "description" => "Free solvation database from SAMPL challenges",
        "filepath" => "data/FreeSolv_SAMPL.csv",
        "format" => "csv",
        "size" => "37 KB",
        "type" => "local",
        "reference" => "Duarte Ramos Matos, G. et al. Approaches for calculating solvation free energies and enthalpies demonstrated with an update of the FreeSolv database. J. Chem. Eng. Data 62, 1559-1569 (2017).",
        "doi" => "10.1021/acs.jced.7b00104",
        "website" => "https://github.com/MobleyLab/FreeSolv"
    ),

    "lipophilicity" => Dict(
        "name" => "Lipophilicity",
        "description" => "Lipophilicity dataset from ChEMBL",
        "filepath" => "data/Lipophilicity.csv",
        "format" => "csv",
        "size" => "353 KB",
        "type" => "local",
        "reference" => "Hersey, A. et al. ChEMBL: a large-scale bioactivity database for drug discovery. Nucleic Acids Res. 40, D1100-D1107 (2012).",
        "doi" => "10.1093/nar/gkr777",
        "website" => "https://www.ebi.ac.uk/chembl/"
    ),

    "clintox" => Dict(
        "name" => "ClinTox",
        "description" => "Clinical toxicity data comparing drugs approved by FDA vs those that failed clinical trials",
        "filepath" => "data/clintox.csv",
        "format" => "csv",
        "size" => "109 KB",
        "type" => "local",
        "reference" => "Gayvert, K. M., Madhukar, N. S. & Elemento, O. A data-driven approach to predicting successes and failures of clinical trials. Cell Chem. Biol. 23, 1294-1301 (2016).",
        "doi" => "10.1016/j.chembiol.2016.07.023",
        "website" => "https://www.cell.com/cell-chemical-biology/fulltext/S2451-9456(16)30273-8"
    ),

    "tox21" => Dict(
        "name" => "Tox21",
        "description" => "Toxicity data on ~12K compounds across multiple assays",
        "filepath" => "data/tox21.csv",
        "format" => "csv",
        "size" => "750 KB",
        "type" => "local",
        "reference" => "Huang, R. et al. Tox21Challenge to build predictive models of nuclear receptor and stress response pathways as mediated by exposure to environmental chemicals and drugs. Front. Environ. Sci. 3, 85 (2016).",
        "doi" => "10.3389/fenvs.2015.00085",
        "website" => "https://tripod.nih.gov/tox21/"
    ),

    "toxcast" => Dict(
        "name" => "ToxCast",
        "description" => "US EPA ToxCast database of chemical bioactivity data",
        "filepath" => "data/toxcast_data.csv",
        "format" => "csv",
        "size" => "9.9 MB",
        "type" => "local",
        "reference" => "Richard, A. M. et al. ToxCast chemical landscape: paving the road to 21st century toxicology. Chem. Res. Toxicol. 29, 1225-1251 (2016).",
        "doi" => "10.1021/acs.chemrestox.6b00135",
        "website" => "https://www.epa.gov/chemical-research/toxicity-forecaster-toxcasttm-data"
    ),

    # ======= REMOTE DATASETS =======

    "bace" => Dict(
        "name" => "BACE",
        "description" => "BACE-1 inhibitors dataset",
        "url" => "https://raw.githubusercontent.com/GLambard/Molecules_Dataset_Collection/master/latest/bace.csv",
        "format" => "csv",
        "size" => "4.5 MB",
        "type" => "remote",
        "reference" => "Subramanian, G. et al. Computational modeling of β-secretase 1 (BACE-1) inhibitors using ligand based approaches. J. Chem. Inf. Model. 56, 1936-1949 (2016).",
        "doi" => "10.1021/acs.jcim.6b00290",
        "website" => "https://pubs.acs.org/doi/10.1021/acs.jcim.6b00290"
    ),

    "sider" => Dict(
        "name" => "SIDER",
        "description" => "Side effects of marketed drugs",
        "url" => "https://raw.githubusercontent.com/GLambard/Molecules_Dataset_Collection/master/latest/sider.csv",
        "format" => "csv",
        "size" => "1.2 MB",
        "type" => "remote",
        "reference" => "Kuhn, M., Letunic, I., Jensen, L. J. & Bork, P. The SIDER database of drugs and side effects. Nucleic Acids Res. 44, D1075-D1079 (2016).",
        "doi" => "10.1093/nar/gkv1075",
        "website" => "http://sideeffects.embl.de/"
    ),

    "hiv" => Dict(
        "name" => "HIV",
        "description" => "Ability to inhibit HIV replication",
        "url" => "https://raw.githubusercontent.com/GLambard/Molecules_Dataset_Collection/master/latest/HIV.csv",
        "format" => "csv",
        "size" => "2.8 MB",
        "type" => "remote",
        "reference" => "AIDS Antiviral Screen Data. DTP, NCI/NIH. https://wiki.nci.nih.gov/display/NCIDTPdata/AIDS+Antiviral+Screen+Data",
        "website" => "https://wiki.nci.nih.gov/display/NCIDTPdata/AIDS+Antiviral+Screen+Data"
    )

)
