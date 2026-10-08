#!/usr/local/bin/vmd
# VMD script edited by L. Alvarez
# VMD version: 1.9.3

# Display settings
display height       6.0
display distance     -2.0
display depthcue   off
display shadows off
display ambientocclusion off
display dof off
axes location off
display resize 900 900

# Load files 
## List of files
set cube_dir "cubes/"
set pattern "${cube_dir}SPINDEN.*.cube"
set rawList [glob -nocomplain -type f -directory $cube_dir SPINDEN.*.cube]
set fileList [lsort $rawList]
set matchingFiles {}
foreach file $fileList {if {[regexp $pattern $file]} {lappend matchingFiles $file}}

## Load first file
mol new [lindex $matchingFiles 0] type cube first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
set remainingFiles [lrange $matchingFiles 1 end]
foreach file $remainingFiles {mol addfile $file type cube first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all}

# Colors
proc vmdrestoremycolors {} {
color scale colors RGB {1.0 0.0 0.0} {0.0 1.0 0.0} {0.0 0.0 1.0}
  color scale method RGB
  set colorcmds {
    {color Display {BackgroundTop} white}
    {color Display {BackgroundBot} cyan3}
#    {color Display {FPS} white}
    {color Name {C} gray}
  }
}
vmdrestoremycolors

# Bonds
proc adj_bonds {args} {mol bondsrecalc [lindex $args 1]}
trace add variable ::vmd_frame write adj_bonds

# Representation
display projection   Perspective
display rendermode GLSL
display backgroundgradient on
mol delrep 0 top
mol representation QuickSurf 1.000000 0.500000 0.500000 3.000000
mol color Name
mol selection {all}
mol material Transparent
mol addrep top
mol selupdate 0 top 0
mol colupdate 0 top 0
mol scaleminmax top 0 0.000000 0.000000
mol smoothrep top 0 0
mol drawframes top 0 {now}
mol rename top cubes

