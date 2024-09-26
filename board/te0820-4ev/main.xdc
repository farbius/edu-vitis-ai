set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]

set_property PACKAGE_PIN K9 [get_ports {SI5338_CLK0_D_clk_p[0]}]
set_property IOSTANDARD LVDS [get_ports {SI5338_CLK0_D_clk_p[0]}]
set_property DIFF_TERM TRUE [get_ports {SI5338_CLK0_D_clk_p[0]}]

set_property PACKAGE_PIN H1 [get_ports {x0[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {x0[0]}]
set_property PACKAGE_PIN J1 [get_ports {x1[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {x1[0]}]

################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name SI5338_CLK0_D_clk_p -period 10 [get_ports SI5338_CLK0_D_clk_p]

################################################################################