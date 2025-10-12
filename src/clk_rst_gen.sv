// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// Clock and Reset Generator
module clk_rst_gen #(
  parameter time          ClkPeriod    = 0ps, // minimum: 2ps
  parameter int unsigned  RstClkCycles = 0
) (
  output logic clk_o,
  output logic rst_no
);

  logic clk;
  initial begin : clock_generation
    clk = 1'b0;
    while (1) begin
      // Emit rising clock edge.
      clk = 1'b1;
      // Wait for at most half the clock period before emitting falling clock edge.
      // Due to integer division
      // this is not always exactly half the clock period but as close as we can get.
      #(ClkPeriod / 2);
      // Emit falling clock edge.
      clk = 1'b0;
      // Wait for remainder of clock period before continuing with next cycle.
      #((ClkPeriod + 1) / 2);
    end
  end
  assign clk_o = clk;

  logic rst_n;
  initial begin : reset_generation
    static int unsigned rst_cnt = 0;
    rst_n = 1'b0;
    #(ClkPeriod / 2); // Start counting clock cycles on first complete cycle.
    while (rst_cnt < RstClkCycles) begin
      @(posedge clk);
      rst_cnt++;
    end
    rst_n = 1'b1;
  end
  assign rst_no = rst_n;

  // Validate parameters.
`ifndef VERILATOR
  initial begin : validate_params
    assert(ClkPeriod >= 2ps)
      else $fatal(1, "The clock period must be at least 2ps!");
      // Reason: Gets divided by two, and some simulators do not support non-integer time steps, so
      // if the time unit is 1ps, this would fail.
    assert(RstClkCycles > 0)
      else $fatal(1, "The number of clock cycles in reset must be greater than 0!");
  end
`endif

endmodule
