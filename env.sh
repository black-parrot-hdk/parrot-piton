export PITON_ROOT=$PWD/openpiton
source $PITON_ROOT/piton/piton_settings.bash
function vcs() { command vcs -full64 "$@"; };
export -f vcs
function dve() { command dve -full64 "$@"; };
export -f dve
export ARIANE_ROOT=$PITON_ROOT/piton/design/chip/tile/ariane
export RISCV=$ARIANE_ROOT/tmp
export PATH=$PATH:$RISCV/bin

export BLACKPARROT_ROOT=$PITON_ROOT/piton/design/chip/tile/black-parrot
export BLACKPARROT_SDK=$PITON_ROOT/sdk

