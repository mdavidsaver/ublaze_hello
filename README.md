# Hello World with Microblaze V

Yet Another Hello World project with a scripted build using Vivado 2024.2 .

## Scripted Process

1. Install Vivado 2024.2
1. Source `settings64.sh` (or 32)
1. Run: `./build_hdl.sh`
1. Run: `./build_cpu.sh`

## GUI Process

From a fresh clone, open `ublaze_hello.xpr` in vivado,
then if necessary manually remove the two `.dcp` files
referenced in the Utility Sources.
These files will be automatically re-added after the
first successful build.

## Loading with openocd

Run as a user with permission to access the Quart UART devices.

```sh
./marble-load.sh ublaze_hello.bit
```

## ublaze debug

```sh
git clone https://github.com/BerkeleyLab/XVC-FTDI-JTAG
make -C XVC-FTDI-JTAG
```

```sh
./XVC-FTDI-JTAG/ftdiJTAG -c 30M -g 11
hw_server -e 'set auto-open-servers xilinx-xvc:localhost:2542'
xsdb
  connect -xvc-url TCP:localhost:2542
  memmap -file Workspace/bar/build/bar.elf
  targets 3
```


## Install notes

Replace bundled `rlwrap` with Debian version.

Fix `Default` symlink for shared libraries.  search for `libssl.so.10`.
