#!/bin/sh
set -e -x

BIT="$1"
[ "$BIT" ] || exit 1

BIT="$(readlink -f "$BIT")"

echo "Load: $BIT"

CFG="$(mktemp)"
trap 'rm -f "$CFG"' EXIT TERM KILL

cat <<EOF > "$CFG"
adapter driver ftdi

ftdi vid_pid 0x0403 0x6011
ftdi channel 0
ftdi layout_init 0xfff8 0xfffb
reset_config none
adapter speed 15000

transport select jtag

source [find cpld/xilinx-xc7.cfg]
source [find fpga/xilinx-dna.cfg]

init

xilinx_print_dna [xc7_get_dna xc7.tap]

xc7_program xc7.tap

pld load 0 $BIT

exit

EOF

cat "$CFG"

openocd -f "$CFG"
