#!/usr/local/bin/vmd
# VMD script written by save_state $Revision: 1.47 $
# VMD version: 1.9.3
proc vmdrestoremymaterials {} {
  set mlist {AOChalky} 
  set mymlist [material list]
  foreach mat $mlist {
    if { [lsearch $mymlist $mat] == -1 } { 
      material add $mat
    }
  }
  material change ambient AOChalky 0.000000
  material change diffuse AOChalky 0.850000
  material change specular AOChalky 0.000000
  material change shininess AOChalky 0.530000
  material change mirror AOChalky 0.000000
  material change opacity AOChalky 1.000000
  material change outline AOChalky 0.000000
  material change outlinewidth AOChalky 0.000000
  material change transmode AOChalky 0.000000
}
vmdrestoremymaterials
# Display settings
display eyesep       0.065000
display focallength  2.000000
display height       6.000000
display distance     -2.000000
display projection   Perspective
display nearclip set 0.500000
display farclip  set 10.000000
display depthcue   off
display shadows off
display ambientocclusion off
display dof off
display dof_fnumber 64.000000
display dof_focaldist 0.700000
display backgroundgradient on
axes location off
label textsize 1
label textthickness 2
display resize 1080 1920

mol new ion04-atoms.xyz type xyz first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
mol delrep 0 top
mol representation CPK 0.7 0.2 20.0 20.0
mol color Name
mol selection {all}
mol material AOChalky
mol addrep top
mol selupdate 0 top 0
mol colupdate 0 top 0
mol scaleminmax top 0 0.000000 0.000000
mol smoothrep top 0 0
mol drawframes top 0 {now}
mol rename top atoms
set topmol [molinfo top]
# done with molecule 0

mol new ion04-wancs.xyz type xyz first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
mol delrep 0 top
mol representation CPK 0.3 0.0 20.0 10.0
mol color ColorID 4
mol selection {all}
mol material AOChalky
mol addrep top
mol selupdate 0 top 0
mol colupdate 0 top 0
mol scaleminmax top 0 0.000000 0.000000
mol smoothrep top 0 0
mol drawframes top 0 {now}
mol rename top Wannier
mol top $topmol
unset topmol
proc vmdrestoremycolors {} {
color scale colors RGB {1.0 0.0 0.0} {0.0 1.0 0.0} {0.0 0.0 1.0}
  color scale method RWB
  set colorcmds {
#    {color Display {Background} black}
    {color Display {BackgroundTop} white}
    {color Display {BackgroundBot} cyan3}
#    {color Display {FPS} white}
    {color Name {C} gray}
#    {color Name {X} pink}
    {color Labels {Atoms} red2}
  }
  foreach colcmd $colorcmds {
    set val [catch {eval $colcmd}]
  }
  color change rgb 0 0.0 0.0 1.0
  color change rgb 2 0.2 0.2 0.2
  color change rgb 3 1.0 0.5 0.0
  color change rgb 4 1.0 1.0 0.0
  color change rgb 5 0.5 0.5 0.2
  color change rgb 6 0.6 0.6 0.6
  color change rgb 7 0.0 1.0 0.0
  color change rgb 9 1.0 0.6 0.6
  color change rgb 11 0.6 0.0 0.65
  color change rgb 12 0.5 0.9 0.4
  color change rgb 13 0.9 0.4 0.7
  color change rgb 14 0.5 0.3 0.0
  color change rgb 15 0.5 0.5 0.75
  color change rgb 17 0.88 0.97 0.02
  color change rgb 18 0.55 0.9 0.02
  color change rgb 19 0.0 0.9 0.04
  color change rgb 20 0.0 0.9 0.5
  color change rgb 21 0.0 0.88 1.0
  color change rgb 22 0.0 0.76 1.0
  color change rgb 23 0.02 0.38 0.67
  color change rgb 24 0.01 0.04 0.93
  color change rgb 25 0.27 0.0 0.98
  color change rgb 26 0.45 0.0 0.9
  color change rgb 27 0.9 0.0 0.9
  color change rgb 28 1.0 0.0 0.66
  color change rgb 29 0.98 0.0 0.23
  color change rgb 30 0.81 0.0 0.0
  color change rgb 31 0.89 0.35 0.0
  color change rgb 32 0.96 0.72 0.0
}
vmdrestoremycolors
label textsize 1.0

proc adj_bonds {args} {mol bondsrecalc [lindex $args 1]}
trace add variable ::vmd_frame write adj_bonds

display rendermode GLSL

