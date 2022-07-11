using Pkg
Pkg.add("UnifyJustTheDocs")
using UnifyJustTheDocs

root = joinpath(pwd(), "docs")
md = composite(root)

mdfile = "composite.md"
open(mdfile,"w") do io
    write(io, md)
end


