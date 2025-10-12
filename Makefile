# SPDX-License-Identifier: Apache-2.0

VERILATOR ?= verilator

all: tb_clk_rst_gen

distclean:
	rm -fr obj_dir

tb_clk_rst_gen: test/tb_clk_rst_gen.cpp src/clk_rst_gen.sv test/tb_clk_rst_gen.sv
	$(VERILATOR) --cc $^ --top-module $@ --trace --exe --timing --timescale 1ns/100ps
	cd obj_dir && make -f V$@.mk > /dev/zero
	cd obj_dir && ./V$@
