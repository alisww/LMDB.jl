module LMDB
    using BinDeps

    if VERSION < v"0.4.0-dev"
        using Docile
        eval(:(@document))
    end

    import Base: open, close, get, put!, insert!, start, reset, isopen, count, delete!, drop

    depsfile = Pkg.dir("LMDB","deps","deps.jl")
    if isfile(depsfile)
        include(depsfile)
    else
        error("LMDB not properly installed. Please run Pkg.build(\"LMDB\")")
    end

    export Environment, create, open, close, sync, put!, unset, get, path,
           Transaction, start, abort, commit, reset, renew, environment,
           DBI, drop,
           Cursor, count, delete!,
           isflagset, isopen

    include("common.jl")
    include("env.jl")
    include("txn.jl")
    include("dbi.jl")
    include("cur.jl")
end
