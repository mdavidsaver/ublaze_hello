#!/bin/sh
set -e -x

vitis -s build_cpu.py

updatemem \
 --meminfo "Workspace/bar/_ide/bitstream/ublaze_hello.mmi" \
 --bit "Workspace/bar/_ide/bitstream/ublaze_hello.bit" \
 --proc ps_1_i/microblaze_mcs_0/inst/microblaze_I \
 --data "Workspace/bar/build/bar.elf" \
 --force \
 --out ublaze_hello.bit

ls -l ublaze_hello.bit
