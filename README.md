# ParrotPiton

This repo collects all dependencies needed to build OpenPiton+BlackParrot.

## Steps
        # Set up vivado on your path
        source env.sh
        make init
        # To build the simulation model
        make sim_build
        # To build the FPGA model
        make fpga_build
        # To build the linux image for FPGA
        make linux_build
        
