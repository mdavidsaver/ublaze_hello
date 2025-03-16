#!/bin/sh
set -e -x

die() {
    echo "Error: $1" >&2
    exit 1
}

[ -f "ublaze_hello.xpr" ] \
|| die "Must run in git checkout containing ublaze_hello.xpr"

NPROC="$(nproc)"
echo "Found $NPROC CPUs"

# scratch space for script fragments
SCRATCH="$(mktemp -d)"
trap 'rm -rf "$SCRATCH"' INT QUIT EXIT

cat <<EOF > "$SCRATCH/vivado.tcl"
open_project "ublaze_hello.xpr"

# remove .dcp in not present (from clean checkout)
foreach dcp [get_files -quiet -filter file_type=="Design\ Checkpoint"] {
    if {[get_property IS_AVAILABLE \$dcp] == 0} {
        puts "Remove reference to missing DCP \$dcp"
        remove_files \$dcp
    }
}

reset_run synth_1 impl_1
launch_runs synth_1 -jobs $NPROC
wait_on_run -verbose synth_1
launch_runs impl_1 -jobs $NPROC -to_step write_bitstream
wait_on_run -verbose impl_1

write_hw_platform -force -include_bit -fixed -verbose ublaze_hello.xsa
EOF

vivado -mode batch -source "$SCRATCH/vivado.tcl"
