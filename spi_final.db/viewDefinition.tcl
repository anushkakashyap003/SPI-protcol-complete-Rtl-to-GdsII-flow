if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast_lib\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast.lib]
create_library_set -name slow_lib\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow.lib]
create_timing_condition -name slow_tc\
   -library_sets [list slow_lib]
create_timing_condition -name fast_tc\
   -library_sets [list fast_lib]
create_rc_corner -name rc_corner\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -qrc_tech ${::IMEX::libVar}/mmmc/rc_corner/gpdk090_9l.tch
create_delay_corner -name fast_dc\
   -timing_condition {fast_tc}\
   -rc_corner rc_corner
create_delay_corner -name slow_dc\
   -timing_condition {slow_tc}\
   -rc_corner rc_corner
create_constraint_mode -name func_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/func_mode/func_mode.sdc]
create_analysis_view -name fast_view -constraint_mode func_mode -delay_corner fast_dc -latency_file ${::IMEX::dataVar}/mmmc/views/fast_view/latency.sdc
create_analysis_view -name slow_view -constraint_mode func_mode -delay_corner slow_dc -latency_file ${::IMEX::dataVar}/mmmc/views/slow_view/latency.sdc
set_analysis_view -setup [list slow_view] -hold [list fast_view]
