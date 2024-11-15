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

module DivSqrtRawFN_small(
  input         clock,
                reset,
                io_inValid,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_sqrtOp,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_a_isNaN,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_a_isInf,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_a_isZero,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_a_sign,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  input  [9:0]  io_a_sExp,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  input  [24:0] io_a_sig,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  input         io_b_isNaN,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_b_isInf,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_b_isZero,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_b_sign,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  input  [9:0]  io_b_sExp,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  input  [24:0] io_b_sig,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  input  [2:0]  io_roundingMode,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  output        io_inReady,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_rawOutValid_div,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_rawOutValid_sqrt,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  output [2:0]  io_roundingModeOut,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  output        io_invalidExc,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_infiniteExc,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_rawOut_isNaN,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_rawOut_isInf,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_rawOut_isZero,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
                io_rawOut_sign,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  output [9:0]  io_rawOut_sExp,	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
  output [26:0] io_rawOut_sig	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
);

  wire        processTwoBits = 1'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:299:42, :381:85
  reg  [4:0]  cycleNum;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33
  reg         inReady;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33
  reg         rawOutValid;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:225:33
  reg         sqrtOp_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:227:29
  reg         majorExc_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:228:29
  reg         isNaN_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:230:29
  reg         isInf_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:231:29
  reg         isZero_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:232:29
  reg         sign_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:233:29
  reg  [9:0]  sExp_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:234:29
  reg  [23:0] fractB_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:235:29
  reg  [2:0]  roundingMode_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:236:29
  reg  [25:0] rem_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:242:29
  reg         notZeroRem_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:243:29
  reg  [25:0] sigX_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:244:29
  wire        notSigNaNIn_invalidExc_S_div =
    io_a_isZero & io_b_isZero | io_a_isInf & io_b_isInf;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:253:{24,42,59}
  wire        notSigNaNIn_invalidExc_S_sqrt = ~io_a_isNaN & ~io_a_isZero & io_a_sign;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:255:{9,27,43}
  wire        majorExc_S =
    io_sqrtOp
      ? io_a_isNaN & ~(io_a_sig[22]) | notSigNaNIn_invalidExc_S_sqrt
      : io_a_isNaN & ~(io_a_sig[22]) | io_b_isNaN & ~(io_b_sig[22])
        | notSigNaNIn_invalidExc_S_div | ~io_a_isNaN & ~io_a_isInf & io_b_isZero;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:253:42, :255:{9,43}, :257:12, :258:38, :260:46, :261:{36,51}, dependencies/hardfloat/hardfloat/src/main/scala/common.scala:82:{46,49,56}
  wire        isNaN_S =
    io_sqrtOp
      ? io_a_isNaN | notSigNaNIn_invalidExc_S_sqrt
      : io_a_isNaN | io_b_isNaN | notSigNaNIn_invalidExc_S_div;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:253:42, :255:43, :264:12, :265:26, :266:42
  wire        isInf_S = ~io_sqrtOp & io_b_isZero | io_a_isInf;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:268:23
  wire        isZero_S = ~io_sqrtOp & io_b_isInf | io_a_isZero;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:268:23, :269:23
  wire        sign_S = io_a_sign ^ ~io_sqrtOp & io_b_sign;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:270:{30,33,45}
  wire        specialCaseA_S = io_a_isNaN | io_a_isInf | io_a_isZero;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:272:55
  wire        specialCaseB_S = io_b_isNaN | io_b_isInf | io_b_isZero;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:273:55
  wire        normalCase_S_div = ~specialCaseA_S & ~specialCaseB_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:272:55, :273:55, :274:{28,45,48}
  wire        normalCase_S_sqrt = ~specialCaseA_S & ~io_a_sign;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:272:55, :274:28, :275:{46,49}
  wire        normalCase_S = io_sqrtOp ? normalCase_S_sqrt : normalCase_S_div;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:274:45, :275:46, :276:27
  wire [10:0] sExpQuot_S_div =
    {io_a_sExp[9], io_a_sExp} + {{3{io_b_sExp[8]}}, ~(io_b_sExp[7:0])};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:279:21, :280:{28,40,52}
  wire [9:0]  sSatExpQuot_S_div =
    {$signed(sExpQuot_S_div) > 11'sh1BF ? 4'h6 : sExpQuot_S_div[9:6],
     sExpQuot_S_div[5:0]};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:279:21, :283:{12,16,48}, :285:31, :287:27, :288:11
  wire        evenSqrt_S = io_sqrtOp & ~(io_a_sExp[0]);	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:290:{32,35,48}
  wire        oddSqrt_S = io_sqrtOp & io_a_sExp[0];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:290:48, :291:32
  wire        idle = cycleNum == 5'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :295:25
  wire        entering = inReady & io_inValid;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :296:28
  wire        entering_normalCase = entering & normalCase_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:276:27, :296:28, :297:40
  wire        skipCycle2 = cycleNum == 5'h3 & sigX_Z[25];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :244:29, :300:{31,39,48,63}
  wire        _sigX_Z_T_7 = inReady & oddSqrt_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :291:32, :352:21
  wire [26:0] rem =
    {1'h0, inReady & ~oddSqrt_S ? {io_a_sig, 1'h0} : 26'h0}
    | (_sigX_Z_T_7 ? {io_a_sig[23:22] - 2'h1, io_a_sig[21:0], 3'h0} : 27'h0)
    | (inReady ? 27'h0 : {rem_Z, 1'h0});	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :242:29, :291:32, :299:42, :351:{12,21,24,47,57}, :352:{12,21}, :353:{16,27,56}, :354:27, :357:11, :358:{12,29}, :381:85, :385:81
  wire [31:0] _bitMask_T = 32'h1 << cycleNum;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :359:23
  wire [29:0] bitMask = _bitMask_T[31:2];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:359:{23,34}
  wire [25:0] _trialTerm_T_3 = inReady & ~io_sqrtOp ? {io_b_sig, 1'h0} : 26'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :270:33, :299:42, :361:{12,21,48}, :381:85, :385:81
  wire [25:0] _trialTerm_T_9 =
    {_trialTerm_T_3[25], _trialTerm_T_3[24:0] | {inReady & evenSqrt_S, 24'h0}}
    | (_sigX_Z_T_7 ? 26'h2800000 : 26'h0);	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :290:32, :341:16, :352:21, :361:{12,74}, :362:{12,21,74}, :363:12, :385:81
  wire [26:0] trialTerm =
    {1'h0,
     _trialTerm_T_9[25],
     _trialTerm_T_9[24] | ~inReady & ~sqrtOp_Z,
     _trialTerm_T_9[23:0] | (inReady ? 24'h0 : fractB_Z)}
    | (~inReady & sqrtOp_Z ? {sigX_Z, 1'h0} : 27'h0);	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :227:29, :235:29, :244:29, :299:42, :339:23, :341:16, :352:12, :362:74, :363:74, :364:{12,74}, :365:{23,26,74}, :366:{12,23,44}, :381:85
  wire [28:0] trialRem = {2'h0, rem} - {2'h0, trialTerm};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:357:11, :365:74, :367:29
  wire        newBit = $signed(trialRem) > -29'sh1;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:367:29, :368:23
  wire [25:0] nextRem_Z = newBit ? trialRem[25:0] : rem[25:0];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:357:11, :367:29, :368:23, :370:{24,54}
  wire [25:0] nextRem_Z_2 = nextRem_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:370:54, :386:83
  wire [26:0] rem2 = {nextRem_Z, 1'h0};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:299:42, :370:54, :371:25, :381:85
  wire [26:0] trialTerm2_newBit0 =
    sqrtOp_Z
      ? {sigX_Z[25:22], fractB_Z[23:2] | sigX_Z[21:0], fractB_Z[1]}
      : {3'h1, fractB_Z};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:227:29, :235:29, :244:29, :372:{33,56}
  wire [26:0] trialTerm2_newBit1 =
    {trialTerm2_newBit0[26:25],
     trialTerm2_newBit0[24:0] | (sqrtOp_Z ? {fractB_Z, 1'h0} : 25'h0)};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:227:29, :235:29, :299:42, :362:12, :372:33, :373:{49,54,73}, :381:85
  wire [27:0] _trialRem2_T_9 = {1'h0, rem_Z[24:0], 2'h0} - {1'h0, trialTerm2_newBit0};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:242:29, :299:42, :372:33, :377:{23,44}, :381:85
  wire [29:0] trialRem2 =
    newBit
      ? {trialRem, 1'h0} - {3'h0, trialTerm2_newBit1}
      : {{2{_trialRem2_T_9[27]}}, _trialRem2_T_9};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:299:42, :367:29, :368:23, :373:49, :375:12, :376:27, :377:44, :381:85
  wire        newBit2 = $signed(trialRem2) > -30'sh1;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:375:12, :378:24
  wire        nextNotZeroRem_Z = inReady | newBit ? (|trialRem) : notZeroRem_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :243:29, :367:29, :368:23, :379:{31,40,60}
  wire        nextNotZeroRem_Z_2 = nextNotZeroRem_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:379:31, :382:103
  always @(posedge clock) begin
    if (reset) begin
      cycleNum <= 5'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33
      inReady <= 1'h1;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :345:45, :383:9, :387:13
      rawOutValid <= 1'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:225:33, :299:42, :381:85
    end
    else if (~idle | entering) begin	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:295:25, :296:28, :302:{11,18}
      automatic logic [4:0] _cycleNum_T_15;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:311:15
      _cycleNum_T_15 =
        {4'h0, entering & ~normalCase_S}
        | (entering_normalCase ? (io_sqrtOp ? {4'hC, ~(io_a_sExp[0])} : 5'h1A) : 5'h0)
        | (entering | skipCycle2 ? 5'h0 : cycleNum - 5'h1);	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :276:27, :290:48, :296:28, :297:40, :300:63, :304:{26,28,57}, :305:16, :306:20, :307:24, :311:15, :312:{16,56}, :316:38
      cycleNum <= {_cycleNum_T_15[4:1], _cycleNum_T_15[0] | skipCycle2};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :300:63, :311:15, :312:95
      inReady <=
        entering & ~normalCase_S | ~entering & ~skipCycle2 & cycleNum - 5'h1 < 5'h2
        | skipCycle2;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :224:33, :276:27, :296:28, :300:63, :304:{26,28}, :312:{16,17,31,56,95}, :316:38
      rawOutValid <=
        entering & ~normalCase_S | ~entering & ~skipCycle2 & cycleNum - 5'h1 == 5'h1
        | skipCycle2;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :225:33, :276:27, :296:28, :300:63, :304:{26,28}, :312:{16,17,31,56,95}, :316:38, :317:42
    end
    if (entering) begin	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:296:28
      sqrtOp_Z <= io_sqrtOp;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:227:29
      majorExc_Z <= majorExc_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:228:29, :257:12
      isNaN_Z <= isNaN_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:230:29, :264:12
      isInf_Z <= isInf_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:231:29, :268:23
      isZero_Z <= isZero_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:232:29, :269:23
      sign_Z <= sign_S;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:233:29, :270:30
      if (io_sqrtOp)	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
        sExp_Z <= {io_a_sExp[9], io_a_sExp[9:1]} + 10'h80;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:234:29, :279:21, :334:{29,34}
      else	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:202:16
        sExp_Z <= sSatExpQuot_S_div;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:234:29, :288:11
      roundingMode_Z <= io_roundingMode;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:236:29
    end
    if (entering | ~inReady & sqrtOp_Z) begin	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :227:29, :296:28, :339:{20,23,33}
      automatic logic [23:0] _fractB_Z_T_4;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:341:16
      automatic logic        _fractB_Z_T_10;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:342:25
      _fractB_Z_T_4 = inReady & ~io_sqrtOp ? {io_b_sig[22:0], 1'h0} : 24'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :270:33, :299:42, :341:{16,25,73,90}, :381:85
      _fractB_Z_T_10 = inReady & io_sqrtOp;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :342:25
      fractB_Z <=
        {_fractB_Z_T_4[23] | _fractB_Z_T_10 & ~(io_a_sExp[0]),
         _fractB_Z_T_4[22:0] | {_fractB_Z_T_10 & io_a_sExp[0], 22'h0}
           | (inReady ? 23'h0 : fractB_Z[23:1])};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :235:29, :290:48, :341:{16,100}, :342:{16,25,38,100}, :343:{38,41}, :344:100, :345:{16,71}
    end
    if (entering | ~inReady) begin	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :296:28, :339:23, :389:20
      automatic logic [25:0] _sigX_Z_T_3;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:393:16
      automatic logic [24:0] _GEN;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:393:74
      _sigX_Z_T_3 = inReady & ~io_sqrtOp ? {newBit, 25'h0} : 26'h0;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :270:33, :362:12, :368:23, :385:81, :393:{16,25,50}
      _GEN = _sigX_Z_T_3[24:0] | {inReady & io_sqrtOp, 24'h0};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :341:16, :393:{16,74}, :394:{16,25}
      rem_Z <= nextRem_Z_2;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:242:29, :386:83
      notZeroRem_Z <= nextNotZeroRem_Z_2;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:243:29, :382:103
      sigX_Z <=
        {_sigX_Z_T_3[25], _GEN[24], _GEN[23:0] | (_sigX_Z_T_7 ? {newBit, 23'h0} : 24'h0)}
        | (inReady ? 26'h0 : sigX_Z) | (~inReady & newBit ? bitMask[25:0] : 26'h0);	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33, :244:29, :339:23, :341:16, :342:16, :352:21, :359:34, :368:23, :385:81, :393:{16,74}, :394:74, :395:{16,50}, :396:{16,74}, :397:{16,27}
    end
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
        cycleNum = _RANDOM[2'h0][4:0];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33
        inReady = _RANDOM[2'h0][5];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :224:33
        rawOutValid = _RANDOM[2'h0][6];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :225:33
        sqrtOp_Z = _RANDOM[2'h0][7];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :227:29
        majorExc_Z = _RANDOM[2'h0][8];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :228:29
        isNaN_Z = _RANDOM[2'h0][9];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :230:29
        isInf_Z = _RANDOM[2'h0][10];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :231:29
        isZero_Z = _RANDOM[2'h0][11];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :232:29
        sign_Z = _RANDOM[2'h0][12];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :233:29
        sExp_Z = _RANDOM[2'h0][22:13];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :234:29
        fractB_Z = {_RANDOM[2'h0][31:23], _RANDOM[2'h1][14:0]};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:223:33, :235:29
        roundingMode_Z = _RANDOM[2'h1][17:15];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:235:29, :236:29
        rem_Z = {_RANDOM[2'h1][31:18], _RANDOM[2'h2][11:0]};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:235:29, :242:29
        notZeroRem_Z = _RANDOM[2'h2][12];	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:242:29, :243:29
        sigX_Z = {_RANDOM[2'h2][31:13], _RANDOM[2'h3][6:0]};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:242:29, :244:29
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_inReady = inReady;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:224:33
  assign io_rawOutValid_div = rawOutValid & ~sqrtOp_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:225:33, :227:29, :365:26, :403:40
  assign io_rawOutValid_sqrt = rawOutValid & sqrtOp_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:225:33, :227:29, :404:40
  assign io_roundingModeOut = roundingMode_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:236:29
  assign io_invalidExc = majorExc_Z & isNaN_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:228:29, :230:29, :406:36
  assign io_infiniteExc = majorExc_Z & ~isNaN_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:228:29, :230:29, :407:{36,39}
  assign io_rawOut_isNaN = isNaN_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:230:29
  assign io_rawOut_isInf = isInf_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:231:29
  assign io_rawOut_isZero = isZero_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:232:29
  assign io_rawOut_sign = sign_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:233:29
  assign io_rawOut_sExp = sExp_Z;	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:234:29
  assign io_rawOut_sig = {sigX_Z, notZeroRem_Z};	// dependencies/hardfloat/hardfloat/src/main/scala/DivSqrtRecFN_small.scala:243:29, :244:29, :413:35
endmodule
