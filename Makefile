
-include bsg_cadenv/cadenv.mk

.init:
	git submodule update --init
	cd cva6-sdk; git apply --ignore-space-change --ignore-whitespace < ../byop.patch
	cd piton-linux; git apply --ignore-space-change --ignore-whitespace < ../linux.patch
	cd opensbi; git apply --ignore-space-change --ignore-whitespace < ../opensbi.patch
	-git clone git@github.com:bespoke-silicon-group/bsg_cadenv.git
	touch .init

init: .init
	cd openpiton; git submodule update --init --recursive piton/design/chip/tile/ariane
	cd openpiton; git submodule update --init --recursive piton/design/chip/tile/black-parrot
	make -C openpiton/piton/design/chip/tile/black-parrot tools -j 4
	source $(PITON_ROOT)/piton/ariane_build_tools.sh

sim_build:
	cd $(PITON_ROOT)/build; \
		sims -sys=manycore -blackparrot -x_tiles=1 -y_tiles=1 -vcs_build -debug_pp

fpga_build:
	cd $(PITON_ROOT)/build; \
		protosyn -b genesys2 -d system --x_tiles=1 --y_tiles=1  --core=blackparrot --uart-dmw ddr

linux_build:
	make -C cva6-sdk all
	make -C cva6-sdk vmlinux

