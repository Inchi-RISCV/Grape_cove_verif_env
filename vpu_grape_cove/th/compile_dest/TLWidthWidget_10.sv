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

module TLWidthWidget_10(
  input          clock,
                 reset,
                 auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [31:0]  auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input          auto_out_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                 auto_out_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [2:0]   auto_out_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [1:0]   auto_out_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [3:0]   auto_out_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [1:0]   auto_out_d_bits_sink,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input          auto_out_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [63:0]  auto_out_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input          auto_out_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output         auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                 auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]   auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [1:0]   auto_in_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [3:0]   auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [1:0]   auto_in_d_bits_sink,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output         auto_in_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [127:0] auto_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output         auto_in_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                 auto_out_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]   auto_out_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                 auto_out_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [3:0]   auto_out_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output         auto_out_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [31:0]  auto_out_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [7:0]   auto_out_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [63:0]  auto_out_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output         auto_out_a_bits_corrupt	// src/main/scala/diplomacy/LazyModule.scala:367:18
);

  wire [127:0] _repeated_repeater_io_deq_bits_data;	// src/main/scala/util/Repeater.scala:35:26
  wire         nodeIn_a_valid = auto_in_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0]  nodeIn_a_bits_address = auto_in_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire         nodeOut_a_ready = auto_out_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_valid = auto_out_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]   nodeOut_d_bits_opcode = auto_out_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   nodeOut_d_bits_param = auto_out_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]   nodeOut_d_bits_size = auto_out_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]   nodeOut_d_bits_sink = auto_out_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_bits_denied = auto_out_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0]  nodeOut_d_bits_data = auto_out_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeOut_d_bits_corrupt = auto_out_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire         nodeIn_d_ready = 1'h1;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/tilelink/WidthWidget.scala:71:29
  wire         nodeOut_d_ready = 1'h1;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/tilelink/WidthWidget.scala:71:29
  wire         nodeIn_a_bits_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire         nodeIn_a_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire         nodeIn_d_bits_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire         nodeOut_d_bits_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire [2:0]   nodeIn_a_bits_param = 3'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire [127:0] nodeIn_a_bits_data = 128'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire [15:0]  nodeIn_a_bits_mask = 16'hFFFF;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire [3:0]   nodeIn_a_bits_size = 4'h6;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire [2:0]   nodeIn_a_bits_opcode = 3'h4;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/Repeater.scala:35:26
  wire         corrupt_out;	// src/main/scala/tilelink/WidthWidget.scala:42:36
  wire         cated_ready = nodeOut_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire         cated_valid;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [2:0]   cated_bits_opcode;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [2:0]   cated_bits_param;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [3:0]   cated_bits_size;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire         cated_bits_source;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [31:0]  cated_bits_address;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire         cated_bits_corrupt;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [2:0]   nodeIn_d_bits_opcode = nodeOut_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [1:0]   nodeIn_d_bits_param = nodeOut_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [3:0]   nodeIn_d_bits_size = nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [1:0]   nodeIn_d_bits_sink = nodeOut_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire         nodeIn_d_bits_denied = nodeOut_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [63:0]  nodeIn_d_bits_data_odata_0 = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:60:47
  wire [63:0]  nodeIn_d_bits_data_odata_1 = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:60:47
  wire         nodeOut_a_valid = cated_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [2:0]   nodeOut_a_bits_opcode = cated_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [2:0]   nodeOut_a_bits_param = cated_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [3:0]   nodeOut_a_bits_size = cated_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire         nodeOut_a_bits_source = cated_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [31:0]  nodeOut_a_bits_address = cated_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire         nodeOut_a_bits_corrupt = cated_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [127:0] cated_bits_data = {_repeated_repeater_io_deq_bits_data[127:64], 64'h0};	// src/main/scala/tilelink/WidthWidget.scala:156:25, :158:39, :159:37, :160:31, src/main/scala/util/Repeater.scala:35:26
  wire         repeat_hasData = ~(cated_bits_opcode[2]);	// src/main/scala/tilelink/Edges.scala:93:{28,37}, src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [18:0]  _repeat_limit_T_1 = 19'hF << cated_bits_size;	// src/main/scala/tilelink/WidthWidget.scala:156:25, src/main/scala/util/package.scala:235:71
  wire         repeat_limit = ~(_repeat_limit_T_1[3]);	// src/main/scala/tilelink/WidthWidget.scala:98:47, src/main/scala/util/package.scala:235:{46,71,76}
  reg          repeat_count;	// src/main/scala/tilelink/WidthWidget.scala:100:26
  wire         repeat_first = ~repeat_count;	// src/main/scala/tilelink/WidthWidget.scala:100:26, :101:25
  wire         repeat_last = repeat_count == repeat_limit | ~repeat_hasData;	// src/main/scala/tilelink/Edges.scala:93:28, src/main/scala/tilelink/WidthWidget.scala:98:47, :100:26, :102:{25,35,38}
  wire         repeat_sel = cated_bits_address[3];	// src/main/scala/tilelink/WidthWidget.scala:111:39, :156:25
  wire         repeat_index = repeat_sel | repeat_count;	// src/main/scala/tilelink/WidthWidget.scala:100:26, :111:39, :121:24
  wire [63:0]  repeat_nodeOut_a_bits_data_mux_0 = cated_bits_data[63:0];	// src/main/scala/tilelink/WidthWidget.scala:123:{43,55}, :156:25
  wire [63:0]  repeat_nodeOut_a_bits_data_mux_1 = cated_bits_data[127:64];	// src/main/scala/tilelink/WidthWidget.scala:123:{43,55}, :156:25
  wire [63:0]  nodeOut_a_bits_data =
    repeat_index ? repeat_nodeOut_a_bits_data_mux_1 : repeat_nodeOut_a_bits_data_mux_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:121:24, :123:43, :132:30
  wire [15:0]  cated_bits_mask;	// src/main/scala/tilelink/WidthWidget.scala:156:25
  wire [7:0]   repeat_nodeOut_a_bits_mask_mux_0 = cated_bits_mask[7:0];	// src/main/scala/tilelink/WidthWidget.scala:123:{43,55}, :156:25
  wire [7:0]   repeat_nodeOut_a_bits_mask_mux_1 = cated_bits_mask[15:8];	// src/main/scala/tilelink/WidthWidget.scala:123:{43,55}, :156:25
  wire [7:0]   nodeOut_a_bits_mask =
    repeat_index ? repeat_nodeOut_a_bits_mask_mux_1 : repeat_nodeOut_a_bits_mask_mux_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:121:24, :123:43, :135:53
  wire         repeat_0 = ~repeat_last;	// src/main/scala/tilelink/WidthWidget.scala:102:35, :143:7, :154:26
  wire         hasData = nodeOut_d_bits_opcode[0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:107:36
  wire [18:0]  _limit_T_1 = 19'hF << nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/util/package.scala:235:71
  wire         limit = ~(_limit_T_1[3]);	// src/main/scala/tilelink/WidthWidget.scala:33:47, src/main/scala/util/package.scala:235:{46,71,76}
  reg          count;	// src/main/scala/tilelink/WidthWidget.scala:35:27
  wire         first = ~count;	// src/main/scala/tilelink/WidthWidget.scala:35:27, :36:26
  wire         last = count == limit | ~hasData;	// src/main/scala/tilelink/Edges.scala:107:36, src/main/scala/tilelink/WidthWidget.scala:33:47, :35:27, :37:{26,36,39}
  wire         enable_0 = ~(count & limit);	// src/main/scala/tilelink/WidthWidget.scala:33:47, :35:27, :38:{47,63}
  wire         enable_1 = ~(~count & limit);	// src/main/scala/tilelink/WidthWidget.scala:33:47, :35:27, :38:{47,56,63}
  reg          corrupt_reg;	// src/main/scala/tilelink/WidthWidget.scala:40:32
  assign corrupt_out = nodeOut_d_bits_corrupt | corrupt_reg;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:40:32, :42:36
  wire         nodeIn_d_bits_corrupt = corrupt_out;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/WidthWidget.scala:42:36
  wire         nodeIn_d_valid = nodeOut_d_valid & last;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/WidthWidget.scala:37:36, :72:29
  reg          nodeIn_d_bits_data_rdata_written_once;	// src/main/scala/tilelink/WidthWidget.scala:57:41
  wire         nodeIn_d_bits_data_masked_enable_0 =
    enable_0 | ~nodeIn_d_bits_data_rdata_written_once;	// src/main/scala/tilelink/WidthWidget.scala:38:47, :57:41, :58:{42,45}
  wire         nodeIn_d_bits_data_masked_enable_1 =
    enable_1 | ~nodeIn_d_bits_data_rdata_written_once;	// src/main/scala/tilelink/WidthWidget.scala:38:47, :57:41, :58:{42,45}
  reg  [63:0]  nodeIn_d_bits_data_rdata_0;	// src/main/scala/tilelink/WidthWidget.scala:61:24
  wire [63:0]  nodeIn_d_bits_data_mdata_0 =
    nodeIn_d_bits_data_masked_enable_0
      ? nodeIn_d_bits_data_odata_0
      : nodeIn_d_bits_data_rdata_0;	// src/main/scala/tilelink/WidthWidget.scala:58:42, :60:47, :61:24, :63:88
  wire [63:0]  nodeIn_d_bits_data_mdata_1 =
    nodeIn_d_bits_data_masked_enable_1 ? nodeIn_d_bits_data_odata_1 : nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:58:42, :60:47, :63:88
  wire [127:0] nodeIn_d_bits_data =
    {nodeIn_d_bits_data_mdata_1, nodeIn_d_bits_data_mdata_0};	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/WidthWidget.scala:63:88, :68:12
  always @(posedge clock) begin
    automatic logic _nodeIn_d_bits_data_T_2;	// src/main/scala/tilelink/WidthWidget.scala:64:23
    _nodeIn_d_bits_data_T_2 = nodeOut_d_valid & ~last;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/WidthWidget.scala:37:36, :64:23, :71:32
    if (reset) begin
      repeat_count <= 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/tilelink/WidthWidget.scala:100:26, src/main/scala/util/Repeater.scala:35:26
      count <= 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/tilelink/WidthWidget.scala:35:27, src/main/scala/util/Repeater.scala:35:26
      corrupt_reg <= 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/tilelink/WidthWidget.scala:40:32, src/main/scala/util/Repeater.scala:35:26
      nodeIn_d_bits_data_rdata_written_once <= 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/tilelink/WidthWidget.scala:57:41, src/main/scala/util/Repeater.scala:35:26
    end
    else begin
      if (nodeOut_a_ready & nodeOut_a_valid)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1205:17
        repeat_count <= ~repeat_last & repeat_count - 1'h1;	// src/main/scala/tilelink/WidthWidget.scala:100:26, :102:35, :105:{15,24}, :106:{21,29}
      if (nodeOut_d_valid) begin	// src/main/scala/diplomacy/Nodes.scala:1205:17
        count <= ~last & count - 1'h1;	// src/main/scala/tilelink/WidthWidget.scala:35:27, :37:36, :45:{15,24}, :47:21, :48:17
        corrupt_reg <= ~last & corrupt_out;	// src/main/scala/tilelink/WidthWidget.scala:37:36, :40:32, :42:36, :45:15, :46:21, :47:21, :48:17, :49:23
      end
      nodeIn_d_bits_data_rdata_written_once <=
        _nodeIn_d_bits_data_T_2 | nodeIn_d_bits_data_rdata_written_once;	// src/main/scala/tilelink/WidthWidget.scala:57:41, :64:{23,33}, :65:30
    end
    if (_nodeIn_d_bits_data_T_2)	// src/main/scala/tilelink/WidthWidget.scala:64:23
      nodeIn_d_bits_data_rdata_0 <= nodeIn_d_bits_data_mdata_0;	// src/main/scala/tilelink/WidthWidget.scala:61:24, :63:88
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:2];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        repeat_count = _RANDOM[2'h0][0];	// src/main/scala/tilelink/WidthWidget.scala:100:26
        count = _RANDOM[2'h0][1];	// src/main/scala/tilelink/WidthWidget.scala:35:27, :100:26
        corrupt_reg = _RANDOM[2'h0][2];	// src/main/scala/tilelink/WidthWidget.scala:40:32, :100:26
        nodeIn_d_bits_data_rdata_written_once = _RANDOM[2'h0][3];	// src/main/scala/tilelink/WidthWidget.scala:57:41, :100:26
        nodeIn_d_bits_data_rdata_0 =
          {_RANDOM[2'h0][31:4], _RANDOM[2'h1], _RANDOM[2'h2][3:0]};	// src/main/scala/tilelink/WidthWidget.scala:61:24, :100:26
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  wire         nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  TLMonitor_25 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid        (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_param   (nodeIn_d_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size    (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_sink    (nodeIn_d_bits_sink),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_denied  (nodeIn_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );
  Repeater_4 repeated_repeater (	// src/main/scala/util/Repeater.scala:35:26
    .clock               (clock),
    .reset               (reset),
    .io_repeat           (repeat_0),	// src/main/scala/tilelink/WidthWidget.scala:154:26
    .io_enq_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready        (cated_ready),	// src/main/scala/tilelink/WidthWidget.scala:156:25
    .io_enq_ready        (nodeIn_a_ready),
    .io_deq_valid        (cated_valid),
    .io_deq_bits_opcode  (cated_bits_opcode),
    .io_deq_bits_param   (cated_bits_param),
    .io_deq_bits_size    (cated_bits_size),
    .io_deq_bits_source  (cated_bits_source),
    .io_deq_bits_address (cated_bits_address),
    .io_deq_bits_mask    (cated_bits_mask),
    .io_deq_bits_data    (_repeated_repeater_io_deq_bits_data),
    .io_deq_bits_corrupt (cated_bits_corrupt)
  );
  assign auto_in_a_ready = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_valid = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_param = nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_size = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_sink = nodeIn_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_denied = nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_data = nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_corrupt = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_out_a_valid = nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_opcode = nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_param = nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_size = nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_source = nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_address = nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_mask = nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_data = nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_corrupt = nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
endmodule
