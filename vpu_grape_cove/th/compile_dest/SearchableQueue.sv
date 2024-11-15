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

module SearchableQueue(
  input        clock,
               reset,
               io_enq_valid,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
  input  [4:0] io_enq_bits,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
  input        io_deq_ready,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
  input  [4:0] io_searchIdx,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
  output       io_enq_ready,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
               io_deq_valid,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
  output [4:0] io_deq_bits,	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
  output       io_idxMatch	// src/main/scala/gpcdcache/RefillQueue.scala:136:14
);

  reg  [4:0]      queue_0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_1;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_2;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_3;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_4;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_5;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_6;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg  [4:0]      queue_7;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
  reg             valids_0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_1;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_2;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_3;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_4;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_5;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_6;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg             valids_7;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
  reg  [2:0]      enq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [2:0]      deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg             maybe_full;	// src/main/scala/gpcdcache/RefillQueue.scala:148:27
  wire            ptr_match = enq_ptr_value == deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:149:34
  wire            empty = ptr_match & ~maybe_full;	// src/main/scala/gpcdcache/RefillQueue.scala:148:27, :149:34, :150:{30,33}
  wire            full = ptr_match & maybe_full;	// src/main/scala/gpcdcache/RefillQueue.scala:148:27, :149:34, :151:30
  wire            do_enq = ~full & io_enq_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/RefillQueue.scala:151:30, :152:31, :169:19
  wire            do_deq = io_deq_ready & ~empty;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/RefillQueue.scala:150:30, :153:31, :168:19
  wire            wrap = &enq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24, src/main/scala/gpcdcache/RefillQueue.scala:156:27
  wire            wrap_1 = &deq_ptr_value;	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24, src/main/scala/gpcdcache/RefillQueue.scala:161:27
  wire [7:0][4:0] _GEN =
    {{queue_7},
     {queue_6},
     {queue_5},
     {queue_4},
     {queue_3},
     {queue_2},
     {queue_1},
     {queue_0}};	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :171:15
  wire            io_idxMatch_hits_0 = queue_0 == io_searchIdx & valids_0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_1 = queue_1 == io_searchIdx & valids_1;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_2 = queue_2 == io_searchIdx & valids_2;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_3 = queue_3 == io_searchIdx & valids_3;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_4 = queue_4 == io_searchIdx & valids_4;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_5 = queue_5 == io_searchIdx & valids_5;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_6 = queue_6 == io_searchIdx & valids_6;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire            io_idxMatch_hits_7 = queue_7 == io_searchIdx & valids_7;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27, :174:20, :176:{23,35}
  wire [1:0]      io_idxMatch_lo_lo = {io_idxMatch_hits_1, io_idxMatch_hits_0};	// src/main/scala/gpcdcache/RefillQueue.scala:174:20, :178:10
  wire [1:0]      io_idxMatch_lo_hi = {io_idxMatch_hits_3, io_idxMatch_hits_2};	// src/main/scala/gpcdcache/RefillQueue.scala:174:20, :178:10
  wire [3:0]      io_idxMatch_lo = {io_idxMatch_lo_hi, io_idxMatch_lo_lo};	// src/main/scala/gpcdcache/RefillQueue.scala:178:10
  wire [1:0]      io_idxMatch_hi_lo = {io_idxMatch_hits_5, io_idxMatch_hits_4};	// src/main/scala/gpcdcache/RefillQueue.scala:174:20, :178:10
  wire [1:0]      io_idxMatch_hi_hi = {io_idxMatch_hits_7, io_idxMatch_hits_6};	// src/main/scala/gpcdcache/RefillQueue.scala:174:20, :178:10
  wire [3:0]      io_idxMatch_hi = {io_idxMatch_hi_hi, io_idxMatch_hi_lo};	// src/main/scala/gpcdcache/RefillQueue.scala:178:10
  always @(posedge clock) begin
    if (reset) begin
      queue_0 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_1 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_2 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_3 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_4 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_5 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_6 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      queue_7 <= 5'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:144:{27,66}
      valids_0 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_1 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_2 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_3 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_4 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_5 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_6 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      valids_7 <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27
      enq_ptr_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      deq_ptr_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      maybe_full <= 1'h0;	// src/main/scala/gpcdcache/RefillQueue.scala:148:27
    end
    else begin
      automatic logic _GEN_0;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_1;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_2;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_3;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_4;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_5;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_6;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      automatic logic _GEN_7;	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
      _GEN_0 = do_enq & enq_ptr_value == 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_1 = do_enq & enq_ptr_value == 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_2 = do_enq & enq_ptr_value == 3'h2;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_3 = do_enq & enq_ptr_value == 3'h3;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_4 = do_enq & enq_ptr_value == 3'h4;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_5 = do_enq & enq_ptr_value == 3'h5;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_6 = do_enq & enq_ptr_value == 3'h6;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      _GEN_7 = do_enq & (&enq_ptr_value);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :152:31, :155:16, :156:27
      if (_GEN_0)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_0 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_1)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_1 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_2)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_2 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_3)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_3 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_4)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_4 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_5)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_5 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_6)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_6 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      if (_GEN_7)	// src/main/scala/gpcdcache/RefillQueue.scala:145:27, :155:16, :156:27
        queue_7 <= io_enq_bits;	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
      valids_0 <= ~(do_deq & deq_ptr_value == 3'h0) & (_GEN_0 | valids_0);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_1 <= ~(do_deq & deq_ptr_value == 3'h1) & (_GEN_1 | valids_1);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_2 <= ~(do_deq & deq_ptr_value == 3'h2) & (_GEN_2 | valids_2);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_3 <= ~(do_deq & deq_ptr_value == 3'h3) & (_GEN_3 | valids_3);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_4 <= ~(do_deq & deq_ptr_value == 3'h4) & (_GEN_4 | valids_4);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_5 <= ~(do_deq & deq_ptr_value == 3'h5) & (_GEN_5 | valids_5);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_6 <= ~(do_deq & deq_ptr_value == 3'h6) & (_GEN_6 | valids_6);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      valids_7 <= ~(do_deq & (&deq_ptr_value)) & (_GEN_7 | valids_7);	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:145:27, :153:31, :155:16, :156:27, :160:16, :161:27
      if (do_enq)	// src/main/scala/gpcdcache/RefillQueue.scala:152:31
        enq_ptr_value <= enq_ptr_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/gpcdcache/RefillQueue.scala:156:27
      if (do_deq)	// src/main/scala/gpcdcache/RefillQueue.scala:153:31
        deq_ptr_value <= deq_ptr_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/gpcdcache/RefillQueue.scala:156:27
      if (do_enq != do_deq)	// src/main/scala/gpcdcache/RefillQueue.scala:152:31, :153:31, :164:15
        maybe_full <= do_enq;	// src/main/scala/gpcdcache/RefillQueue.scala:148:27, :152:31
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:1];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        queue_0 = _RANDOM[1'h0][4:0];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_1 = _RANDOM[1'h0][9:5];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_2 = _RANDOM[1'h0][14:10];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_3 = _RANDOM[1'h0][19:15];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_4 = _RANDOM[1'h0][24:20];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_5 = _RANDOM[1'h0][29:25];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_6 = {_RANDOM[1'h0][31:30], _RANDOM[1'h1][2:0]};	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        queue_7 = _RANDOM[1'h1][7:3];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27
        valids_0 = _RANDOM[1'h1][8];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_1 = _RANDOM[1'h1][9];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_2 = _RANDOM[1'h1][10];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_3 = _RANDOM[1'h1][11];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_4 = _RANDOM[1'h1][12];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_5 = _RANDOM[1'h1][13];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_6 = _RANDOM[1'h1][14];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        valids_7 = _RANDOM[1'h1][15];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :145:27
        enq_ptr_value = _RANDOM[1'h1][18:16];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:144:27
        deq_ptr_value = _RANDOM[1'h1][21:19];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:144:27
        maybe_full = _RANDOM[1'h1][22];	// src/main/scala/gpcdcache/RefillQueue.scala:144:27, :148:27
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = ~full;	// src/main/scala/gpcdcache/RefillQueue.scala:151:30, :169:19
  assign io_deq_valid = ~empty;	// src/main/scala/gpcdcache/RefillQueue.scala:150:30, :168:19
  assign io_deq_bits = _GEN[deq_ptr_value];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/gpcdcache/RefillQueue.scala:171:15
  assign io_idxMatch = |{io_idxMatch_hi, io_idxMatch_lo};	// src/main/scala/gpcdcache/RefillQueue.scala:178:{10,17}
endmodule
