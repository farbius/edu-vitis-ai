# Create Vidado project for specified board
proc number_of_processor {} {
    global tcl_platform env
    switch ${tcl_platform(platform)} {
        "windows" { 
            return $env(NUMBER_OF_PROCESSORS)       
        }

        "unix" {
            if {![catch {open "/proc/cpuinfo"} f]} {
                set cores [regexp -all -line {^processor\s} [read $f]]
                close $f
                if {$cores > 0} {
                    return $cores
                }
            }
        }

        "Darwin" {
            if {![catch {exec {*}$sysctl -n "hw.ncpu"} cores]} {
                return $cores
            }
        }

        default {
            puts "Unknown System"
            return 1
        }
    }
}

set project_name top
set project_dir .
set n_cores [number_of_processor]
set n_cores [expr $n_cores - 2]

# getting a FPGA part used in the project
set part xczu4ev-sfvc784-1-e
# creating a project
create_project ${project_name} ${project_dir} -part ${part}
# setting ip repository path
set_property  ip_repo_paths ../ip [current_project]
update_ip_catalog

# creating a block design
source sys.tcl
# adding top wrapper
make_wrapper -files [get_files sys.bd] -top
add_files -norecurse  ${project_dir}/${project_name}.gen/sources_1/bd/sys/hdl/sys_wrapper.v
set_property top sys_wrapper [current_fileset]

update_compile_order -fileset sources_1

#launch_runs synth_1 -jobs $n_cores
#wait_on_run synth_1
#
#launch_runs impl_1 -jobs $n_cores
#wait_on_run impl_1
#
#launch_runs impl_1 -to_step write_bitstream -jobs $n_cores
#wait_on_run impl_1 
#
#write_hw_platform -fixed -include_bit -force -file ${project_dir}/sys_wrapper.xsa

puts "<< Vivado project is ready"
