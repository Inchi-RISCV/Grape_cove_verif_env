
#run -posedge tb_top.testHarness.ldut.tile_prci_domain.element_reset_domain_gpctile.core.io_verif_commit_start
#call {$fsdbAutoSwitchDumpfile(500,"xxx_top.fsdb",1)}
call \$fsdbDumpvars 0,tb_top,"+all"
call \$fsdbDumpMDA 0 "tb_top"
call \$fsdbDumpSVA
run 
