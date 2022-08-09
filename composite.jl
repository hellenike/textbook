#=
Compile a single composite markdown file from a root directory
of markdown files with headers following the JustTheDocs theme's conventions.

Usage:

julia composite.jl [SETTINGSFILE] [SRCDIR] [OUTFILE]

=#

using Pkg
Pkg.add("UnifyJustTheDocs")
using UnifyJustTheDocs
using Dates

settingsfile = isempty(ARGS) ? "pdf/settings.yaml" : ARGS[1]

srcdir = length(ARGS) > 1 ? ARGS[2] : "docs"
outfile = length(ARGS) > 2 ? ARGS[3] : "composite.md"

settings = readlines(settingsfile) 

root = joinpath(pwd(), srcdir)


# create YAML header:
(m,d) = monthday(today())
yr = year(today())
datestr = "$(monthname(m)) $(d), $(yr)"
push!(settings, "date: $(datestr)")
hdr = "---\n"  * join(settings, "\n") * "\n---\n\n"

# Create single markdown file
docsmd = composite(root)
md = hdr * replace(docsmd, "`" => "")
# Another LaText gotcha:
tidier = replace(md, "-*" => "*")

# Write to disk
open(outfile,"w") do io
    write(io, tidier)
end


