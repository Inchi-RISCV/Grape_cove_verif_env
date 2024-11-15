// Generated by CIRCT firtool-1.56.1
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

module IOMSHR(
  input          clock,
                 reset,
  input  [4:0]   io_req_source,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [38:0]  io_req_paddr,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [4:0]   io_req_cmd,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [2:0]   io_req_size,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input          io_req_signed,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [511:0] io_req_wdata,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [63:0]  io_req_wmask,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input          io_req_isMMIO,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_req_noAlloc,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [4:0]   io_req_dest,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input          io_req_isFromCore,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_req_isProbe,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_req_isRefill,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input  [1:0]   io_req_probePerm,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_req_refillCoh,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  input          io_reqValid,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_replayFinish,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output         io_isEmpty,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_sendNReady,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_addrMatch,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [4:0]   io_reqReg_source,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [38:0]  io_reqReg_paddr,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [4:0]   io_reqReg_cmd,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [2:0]   io_reqReg_size,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output         io_reqReg_signed,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [511:0] io_reqReg_wdata,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [63:0]  io_reqReg_wmask,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output         io_reqReg_isMMIO,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_reqReg_noAlloc,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [4:0]   io_reqReg_dest,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output         io_reqReg_isFromCore,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_reqReg_isProbe,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_reqReg_isRefill,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
  output [1:0]   io_reqReg_probePerm,	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
                 io_reqReg_refillCoh	// src/main/scala/gpcdcache/IOMSHR.scala:12:14
);

  reg          state;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46
  reg  [4:0]   reqReg_source;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [38:0]  reqReg_paddr;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [4:0]   reqReg_cmd;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [2:0]   reqReg_size;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  wire [2:0]   reqReg_wdata_size = reqReg_size;	// src/main/scala/gpcdcache/AMOALU.scala:9:22, src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          reqReg_signed;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [511:0] reqReg_wdata;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [63:0]  reqReg_wmask;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          reqReg_isMMIO;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          reqReg_noAlloc;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [4:0]   reqReg_dest;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          reqReg_isFromCore;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          reqReg_isProbe;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          reqReg_isRefill;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [1:0]   reqReg_probePerm;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg  [1:0]   reqReg_refillCoh;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  reg          delayedValid;	// src/main/scala/gpcdcache/IOMSHR.scala:34:29
  always @(posedge clock) begin
    if (reset) begin
      state <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46
      reqReg_source <= 5'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
      reqReg_paddr <= 39'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:{29,42}
      reqReg_cmd <= 5'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
      reqReg_size <= 3'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:{29,42}
      reqReg_signed <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
      reqReg_wdata <= 512'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:{29,42}
      reqReg_wmask <= 64'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:{29,42}
      reqReg_isMMIO <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
      reqReg_noAlloc <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
      reqReg_dest <= 5'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
      reqReg_isFromCore <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
      reqReg_isProbe <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
      reqReg_isRefill <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
      reqReg_probePerm <= 2'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:{29,42}
      reqReg_refillCoh <= 2'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:33:{29,42}
      delayedValid <= 1'h0;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :34:29
    end
    else begin
      automatic logic _GEN;	// src/main/scala/gpcdcache/IOMSHR.scala:35:20
      _GEN = io_reqValid & ~state;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :35:{20,29}
      if (state)	// src/main/scala/gpcdcache/IOMSHR.scala:28:46
        state <= ~io_replayFinish & state;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :50:23
      else	// src/main/scala/gpcdcache/IOMSHR.scala:28:46
        state <= io_reqValid | state;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :49:23
      if (_GEN) begin	// src/main/scala/gpcdcache/IOMSHR.scala:35:20
        reqReg_source <= io_req_source;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_paddr <= io_req_paddr;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_cmd <= io_req_cmd;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_size <= io_req_size;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_signed <= io_req_signed;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_wdata <= io_req_wdata;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isMMIO <= io_req_isMMIO;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_noAlloc <= io_req_noAlloc;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_dest <= io_req_dest;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isFromCore <= io_req_isFromCore;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isProbe <= io_req_isProbe;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isRefill <= io_req_isRefill;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_probePerm <= io_req_probePerm;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_refillCoh <= io_req_refillCoh;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
      end
      else if (delayedValid) begin	// src/main/scala/gpcdcache/IOMSHR.scala:34:29
        automatic logic [7:0][511:0] _GEN_0 =
          {{io_req_wdata},
           {io_req_wdata},
           {{2{io_req_wdata[255:0]}}},
           {{2{{2{io_req_wdata[127:0]}}}}},
           {{2{{2{{2{io_req_wdata[63:0]}}}}}}},
           {{2{{2{{2{{2{io_req_wdata[31:0]}}}}}}}}},
           {{2{{2{{2{{2{{2{io_req_wdata[15:0]}}}}}}}}}}},
           {{2{{2{{2{{2{{2{{2{io_req_wdata[7:0]}}}}}}}}}}}}}};	// src/main/scala/gpcdcache/AMOALU.scala:25:{13,19,32,71}
        reqReg_wdata <= _GEN_0[reqReg_wdata_size];	// src/main/scala/gpcdcache/AMOALU.scala:9:22, :25:{13,19}, src/main/scala/gpcdcache/IOMSHR.scala:33:29
      end
      if (_GEN | delayedValid)	// src/main/scala/gpcdcache/IOMSHR.scala:33:29, :34:29, :35:{20,44}, :36:18, :38:28, :40:18
        reqReg_wmask <= io_req_wmask;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
      delayedValid <= _GEN;	// src/main/scala/gpcdcache/IOMSHR.scala:34:29, :35:20
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:20];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h15; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        state = _RANDOM[5'h0][0];	// src/main/scala/gpcdcache/IOMSHR.scala:28:46
        reqReg_source = _RANDOM[5'h0][5:1];	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
        reqReg_paddr = {_RANDOM[5'h0][31:6], _RANDOM[5'h1][12:0]};	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29
        reqReg_cmd = _RANDOM[5'h1][17:13];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_size = _RANDOM[5'h1][20:18];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_signed = _RANDOM[5'h1][21];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_wdata =
          {_RANDOM[5'h1][31:22],
           _RANDOM[5'h2],
           _RANDOM[5'h3],
           _RANDOM[5'h4],
           _RANDOM[5'h5],
           _RANDOM[5'h6],
           _RANDOM[5'h7],
           _RANDOM[5'h8],
           _RANDOM[5'h9],
           _RANDOM[5'hA],
           _RANDOM[5'hB],
           _RANDOM[5'hC],
           _RANDOM[5'hD],
           _RANDOM[5'hE],
           _RANDOM[5'hF],
           _RANDOM[5'h10],
           _RANDOM[5'h11][21:0]};	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_wmask = {_RANDOM[5'h11][31:22], _RANDOM[5'h12], _RANDOM[5'h13][21:0]};	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isMMIO = _RANDOM[5'h13][22];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_noAlloc = _RANDOM[5'h13][23];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_dest = _RANDOM[5'h13][28:24];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isFromCore = _RANDOM[5'h13][29];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isProbe = _RANDOM[5'h13][30];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_isRefill = _RANDOM[5'h13][31];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_probePerm = _RANDOM[5'h14][1:0];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        reqReg_refillCoh = _RANDOM[5'h14][3:2];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
        delayedValid = _RANDOM[5'h14][4];	// src/main/scala/gpcdcache/IOMSHR.scala:33:29, :34:29
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_isEmpty = ~state;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :35:29
  assign io_sendNReady = delayedValid;	// src/main/scala/gpcdcache/IOMSHR.scala:34:29
  assign io_addrMatch = state & io_req_paddr == reqReg_paddr;	// src/main/scala/gpcdcache/IOMSHR.scala:28:46, :33:29, :54:{39,55}
  assign io_reqReg_source = reqReg_source;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_paddr = reqReg_paddr;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_cmd = reqReg_cmd;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_size = reqReg_size;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_signed = reqReg_signed;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_wdata = reqReg_wdata;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_wmask = reqReg_wmask;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_isMMIO = reqReg_isMMIO;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_noAlloc = reqReg_noAlloc;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_dest = reqReg_dest;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_isFromCore = reqReg_isFromCore;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_isProbe = reqReg_isProbe;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_isRefill = reqReg_isRefill;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_probePerm = reqReg_probePerm;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
  assign io_reqReg_refillCoh = reqReg_refillCoh;	// src/main/scala/gpcdcache/IOMSHR.scala:33:29
endmodule
