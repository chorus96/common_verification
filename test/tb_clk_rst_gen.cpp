// SPDX-License-Identifier: Apache-2.0

#include "Vtb_clk_rst_gen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#include <stdio.h>
#include <assert.h>

// #define DEBUG 1
// This is a 64-bit integer to reduce wrap over issues and
// allow modulus.  You can also use a double, if you wish.
vluint64_t main_time = 0;

// Called by $time in Verilog
// converts to double, to match
// what SystemC does
double sc_time_stamp () {
    return main_time;
}

int main(int argc, char** argv, char** env) {

    Verilated::commandArgs(argc, argv);
    Vtb_clk_rst_gen* dut = new Vtb_clk_rst_gen;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);  // Trace 99 levels of hierarchy
    tfp->open("tb_clk_rst_gen.vcd");

    while (!Verilated::gotFinish()) {
        // Eval DUT
        dut->eval();

        // Advance Time
        main_time++;

        tfp->dump(main_time);
    }
    dut->final();
    tfp->close();
    delete dut;
    exit(0);
}
