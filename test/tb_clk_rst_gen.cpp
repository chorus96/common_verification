// SPDX-License-Identifier: Apache-2.0

#include "Vtb_clk_rst_gen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char** argv) {
    VerilatedContext* contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);

    Vtb_clk_rst_gen* dut = new Vtb_clk_rst_gen{contextp};

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("tb_clk_rst_gen.vcd");

    while (!contextp->gotFinish()) {
        contextp->timeInc(1);
        dut->eval();
        tfp->dump(contextp->time());
    }

    dut->final();
    tfp->close();
    delete dut;
    delete contextp;
    return 0;
}
