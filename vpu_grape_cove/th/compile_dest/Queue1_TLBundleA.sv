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

module Queue1_TLBundleA(
  input         clock,
                reset,
                io_enq_valid,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [2:0]  io_enq_bits_opcode,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
                io_enq_bits_param,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [3:0]  io_enq_bits_size,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [6:0]  io_enq_bits_source,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [13:0] io_enq_bits_address,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [7:0]  io_enq_bits_mask,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [63:0] io_enq_bits_data,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input         io_enq_bits_corrupt,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
                io_deq_ready,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output        io_enq_ready,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
                io_deq_valid,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [2:0]  io_deq_bits_opcode,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [3:0]  io_deq_bits_size,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [6:0]  io_deq_bits_source	// src/main/scala/chisel3/util/Decoupled.scala:256:14
);

  wire         ptr_match = 1'h1;	// src/main/scala/chisel3/util/Decoupled.scala:261:33
  wire         enq_ptr_value = 1'h0;	// src/main/scala/chisel3/util/Counter.scala:61:73, src/main/scala/chisel3/util/Decoupled.scala:310:32
  wire         deq_ptr_value = 1'h0;	// src/main/scala/chisel3/util/Counter.scala:61:73, src/main/scala/chisel3/util/Decoupled.scala:310:32
  wire         ptr_diff = 1'h0;	// src/main/scala/chisel3/util/Counter.scala:61:73, src/main/scala/chisel3/util/Decoupled.scala:310:32
  reg  [103:0] ram;	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  reg          maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:260:27
  wire         full = maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:260:27, :263:24
  wire         empty = ~maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:260:27, :262:{25,28}
  wire         do_enq = ~full & io_enq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :263:24, :264:27, :287:19
  wire         do_deq = io_deq_ready & ~empty;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :262:25, :265:27, :286:19
  always @(posedge clock) begin
    if (do_enq)	// src/main/scala/chisel3/util/Decoupled.scala:264:27
      ram <=
        {io_enq_bits_corrupt,
         io_enq_bits_data,
         io_enq_bits_mask,
         io_enq_bits_address,
         io_enq_bits_source,
         io_enq_bits_size,
         io_enq_bits_param,
         io_enq_bits_opcode};	// src/main/scala/chisel3/util/Decoupled.scala:257:91
    if (reset)
      maybe_full <= 1'h0;	// src/main/scala/chisel3/util/Counter.scala:61:73, src/main/scala/chisel3/util/Decoupled.scala:260:27, :310:32
    else if (do_enq != do_deq)	// src/main/scala/chisel3/util/Decoupled.scala:264:27, :265:27, :277:15
      maybe_full <= do_enq;	// src/main/scala/chisel3/util/Decoupled.scala:260:27, :264:27
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:3];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h4; i += 3'h1) begin
          _RANDOM[i[1:0]] = `RANDOM;
        end
        ram = {_RANDOM[2'h0][31:1], _RANDOM[2'h1], _RANDOM[2'h2], _RANDOM[2'h3][8:0]};	// src/main/scala/chisel3/util/Decoupled.scala:257:91
        maybe_full = _RANDOM[2'h0][0];	// src/main/scala/chisel3/util/Decoupled.scala:257:91, :260:27
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = ~full;	// src/main/scala/chisel3/util/Decoupled.scala:263:24, :287:19
  assign io_deq_valid = ~empty;	// src/main/scala/chisel3/util/Decoupled.scala:262:25, :286:19
  assign io_deq_bits_opcode = ram[2:0];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_size = ram[9:6];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_source = ram[16:10];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
endmodule
