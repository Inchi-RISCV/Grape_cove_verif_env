#ifndef _VC_HDRS_H
#define _VC_HDRS_H

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#include <dlfcn.h>
#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifndef _VC_TYPES_
#define _VC_TYPES_
/* common definitions shared with DirectC.h */

typedef unsigned int U;
typedef unsigned char UB;
typedef unsigned char scalar;
typedef struct { U c; U d;} vec32;

#define scalar_0 0
#define scalar_1 1
#define scalar_z 2
#define scalar_x 3

extern long long int ConvUP2LLI(U* a);
extern void ConvLLI2UP(long long int a1, U* a2);
extern long long int GetLLIresult();
extern void StoreLLIresult(const unsigned int* data);
typedef struct VeriC_Descriptor *vc_handle;

#ifndef SV_3_COMPATIBILITY
#define SV_STRING const char*
#else
#define SV_STRING char*
#endif

#endif /* _VC_TYPES_ */


 extern SV_STRING snps_reg__get_context_name(/* INPUT */int id);

 extern int snps_reg__get_reg_id(/* INPUT */const char* path, /* INPUT */const char* name);

 extern int snps_reg__get_reg_array_id(/* INPUT */const char* path, /* INPUT */const char* name, /* INPUT */int index1, /* INPUT */int index2, /* INPUT */int index3);

 extern int snps_reg__get_fld_id(/* INPUT */const char* path, /* INPUT */const char* rg, /* INPUT */const char* name);

 extern int snps_reg__get_fld_array_id(/* INPUT */const char* path, /* INPUT */const char* rg, /* INPUT */const char* name, /* INPUT */int index1, /* INPUT */int index2, /* INPUT */int index3);

 extern void snps_reg__use_context_map(/* INPUT */int ctxt);

 extern void debug_rob_push_trace(/* INPUT */int hartid, /* INPUT */unsigned char should_wb, /* INPUT */unsigned char has_wb, /* INPUT */long long wb_tag, /* INPUT */unsigned char trace_valid, /* INPUT */long long trace_iaddr, /* INPUT */long long trace_insn, /* INPUT */int trace_priv, /* INPUT */unsigned char trace_exception, /* INPUT */unsigned char trace_interrupt, 
/* INPUT */long long trace_cause, /* INPUT */long long trace_tval, const /* INPUT */long long *trace_wdata);

 extern void debug_rob_push_wb(/* INPUT */int hartid, /* INPUT */unsigned char valid, /* INPUT */long long wb_tag, const /* INPUT */long long *wb_data);

 extern void debug_rob_pop_trace(/* INPUT */int hartid, /* OUTPUT */unsigned char *trace_valid, /* OUTPUT */long long *trace_iaddr, /* OUTPUT */long long *trace_insn, /* OUTPUT */int *trace_priv, /* OUTPUT */unsigned char *trace_exception, /* OUTPUT */unsigned char *trace_interrupt, /* OUTPUT */long long *trace_cause, /* OUTPUT */long long *trace_tval, /* OUTPUT */long long *trace_wdata
);

 extern int debug_tick(/* OUTPUT */unsigned char *debug_req_valid, /* INPUT */unsigned char debug_req_ready, /* OUTPUT */int *debug_req_bits_addr, /* OUTPUT */int *debug_req_bits_op, /* OUTPUT */int *debug_req_bits_data, /* INPUT */unsigned char debug_resp_valid, /* OUTPUT */unsigned char *debug_resp_ready, /* INPUT */int debug_resp_bits_resp, /* INPUT */int debug_resp_bits_data);

 extern unsigned char inchi_difftest_init();

 extern unsigned char inchi_difftest_memcpy(/* INPUT */const char* s);

 extern unsigned char inchi_difftest_exec();

 extern unsigned char raise_intr();

 extern unsigned char inchi_difftest_set_reg(const /* INPUT */svBitVecVal *arr);

 extern unsigned char inchi_difftest_get_reg(/* OUTPUT */svBitVecVal *arr);

 extern void snps_reg__regRead(/* INPUT */int id, /* OUTPUT */long long *val);

 extern void snps_reg__regReadAtAddr(/* INPUT */int reg_addr, /* OUTPUT */long long *val);

 extern void snps_reg__regWrite(/* INPUT */int id, /* INPUT */long long val);

 extern void snps_reg__regWriteAtAddr(/* INPUT */int reg_addr, /* INPUT */long long val);

 extern int uvm_hdl_check_path(/* INPUT */const char* path);

 extern int uvm_hdl_deposit(/* INPUT */const char* path, const /* INPUT */svLogicVecVal *value);

 extern int uvm_hdl_force(/* INPUT */const char* path, const /* INPUT */svLogicVecVal *value);

 extern int uvm_hdl_release_and_read(/* INPUT */const char* path, /* INOUT */svLogicVecVal *value);

 extern int uvm_hdl_release(/* INPUT */const char* path);

 extern int uvm_hdl_read(/* INPUT */const char* path, /* OUTPUT */svLogicVecVal *value);

 extern SV_STRING uvm_hdl_read_string(/* INPUT */const char* path);

 extern int uvm_memory_load(/* INPUT */const char* nid, /* INPUT */const char* scope, /* INPUT */const char* fileName, /* INPUT */const char* radix, /* INPUT */const char* startaddr, /* INPUT */const char* endaddr, /* INPUT */const char* types);

 extern SV_STRING uvm_dpi_get_next_arg_c(/* INPUT */int init);

 extern SV_STRING uvm_dpi_get_tool_name_c();

 extern SV_STRING uvm_dpi_get_tool_version_c();

 extern void* uvm_dpi_regcomp(/* INPUT */const char* regex);

 extern int uvm_dpi_regexec(/* INPUT */void* preg, /* INPUT */const char* str);

 extern void uvm_dpi_regfree(/* INPUT */void* preg);

 extern int uvm_re_match(/* INPUT */const char* re, /* INPUT */const char* str);

 extern void uvm_dump_re_cache();

 extern SV_STRING uvm_glob_to_re(/* INPUT */const char* glob);

 extern void m__uvm_report_dpi(/* INPUT */int severity, /* INPUT */const char* id, /* INPUT */const char* message, /* INPUT */int verbosity, /* INPUT */const char* filename, /* INPUT */int line);
void SdisableFork();

#ifdef __cplusplus
}
#endif


#endif //#ifndef _VC_HDRS_H
