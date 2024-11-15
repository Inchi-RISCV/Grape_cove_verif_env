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

module Queue8_AXI4BundleR(
  input         clock,
                reset,
                io_enq_valid,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [3:0]  io_enq_bits_id,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [63:0] io_enq_bits_data,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [1:0]  io_enq_bits_resp,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [3:0]  io_enq_bits_echo_tl_state_size,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input  [6:0]  io_enq_bits_echo_tl_state_source,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  input         io_enq_bits_echo_extra_id,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
                io_enq_bits_last,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
                io_deq_ready,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output        io_enq_ready,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [3:0]  io_deq_bits_id,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [63:0] io_deq_bits_data,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [1:0]  io_deq_bits_resp,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [3:0]  io_deq_bits_echo_tl_state_size,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output [6:0]  io_deq_bits_echo_tl_state_source,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
  output        io_deq_bits_echo_extra_id,	// src/main/scala/chisel3/util/Decoupled.scala:256:14
                io_deq_bits_last	// src/main/scala/chisel3/util/Decoupled.scala:256:14
);

  wire        _io_deq_valid_T;	// src/main/scala/chisel3/util/Decoupled.scala:286:19
  wire [82:0] _ram_ext_R0_data;	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  reg  [2:0]  enq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [2:0]  deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg         maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:260:27
  wire        ptr_match = enq_ptr_value == deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:261:33
  wire        empty = ptr_match & ~maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:260:27, :261:33, :262:{25,28}
  wire        full = ptr_match & maybe_full;	// src/main/scala/chisel3/util/Decoupled.scala:260:27, :261:33, :263:24
  wire        do_enq = ~full & io_enq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :263:24, :264:27, :287:19
  wire        do_deq = io_deq_ready & _io_deq_valid_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, :265:27, :286:19
  wire        wrap = &enq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24
  wire        wrap_1 = &deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24
  assign _io_deq_valid_T = ~empty;	// src/main/scala/chisel3/util/Decoupled.scala:262:25, :286:19
  wire [2:0]  ptr_diff = enq_ptr_value - deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:310:32
  always @(posedge clock) begin
    if (reset) begin
      enq_ptr_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      deq_ptr_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      maybe_full <= 1'h0;	// src/main/scala/chisel3/util/Decoupled.scala:260:27
    end
    else begin
      if (do_enq)	// src/main/scala/chisel3/util/Decoupled.scala:264:27
        enq_ptr_value <= enq_ptr_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24
      if (do_deq)	// src/main/scala/chisel3/util/Decoupled.scala:265:27
        deq_ptr_value <= deq_ptr_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24
      if (do_enq != do_deq)	// src/main/scala/chisel3/util/Decoupled.scala:264:27, :265:27, :277:15
        maybe_full <= do_enq;	// src/main/scala/chisel3/util/Decoupled.scala:260:27, :264:27
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:0];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        enq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][2:0];	// src/main/scala/chisel3/util/Counter.scala:61:40
        deq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][5:3];	// src/main/scala/chisel3/util/Counter.scala:61:40
        maybe_full = _RANDOM[/*Zero width*/ 1'b0][6];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:260:27
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ram_8x83 ram_ext (	// src/main/scala/chisel3/util/Decoupled.scala:257:91
    .R0_addr (deq_ptr_value),	// src/main/scala/chisel3/util/Counter.scala:61:40
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .W0_addr (enq_ptr_value),	// src/main/scala/chisel3/util/Counter.scala:61:40
    .W0_en   (do_enq),	// src/main/scala/chisel3/util/Decoupled.scala:264:27
    .W0_clk  (clock),
    .W0_data
      ({io_enq_bits_last,
        io_enq_bits_echo_extra_id,
        io_enq_bits_echo_tl_state_source,
        io_enq_bits_echo_tl_state_size,
        io_enq_bits_resp,
        io_enq_bits_data,
        io_enq_bits_id}),	// src/main/scala/chisel3/util/Decoupled.scala:257:91
    .R0_data (_ram_ext_R0_data)
  );
  assign io_enq_ready = ~full;	// src/main/scala/chisel3/util/Decoupled.scala:263:24, :287:19
  assign io_deq_bits_id = _ram_ext_R0_data[3:0];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_data = _ram_ext_R0_data[67:4];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_resp = _ram_ext_R0_data[69:68];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_echo_tl_state_size = _ram_ext_R0_data[73:70];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_echo_tl_state_source = _ram_ext_R0_data[80:74];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_echo_extra_id = _ram_ext_R0_data[81];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
  assign io_deq_bits_last = _ram_ext_R0_data[82];	// src/main/scala/chisel3/util/Decoupled.scala:257:91
endmodule
