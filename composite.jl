using Pkg
Pkg.add("UnifyJustTheDocs")
using UnifyJustTheDocs
using Dates

root = joinpath(pwd(), "docs")
settings = readlines("pdf/settings.yaml") 

# create YAML header:
(m,d) = monthday(today())
yr = year(today())
datestr = "$(monthname(m)) $(d), $(yr)"
push!(settings, "date: $(datestr)")
hdr = "---\n"  * join(settings, "\n") * "\n---\n\n"

# Create single markdown file
docsmd = composite(root)
md = hdr * replace(docsmd, "`" => "")

# Write to disk
mdfile = "composite.md"
open(mdfile,"w") do io
    write(io, md)
end


