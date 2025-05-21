transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/AlteraPrj/C4M1P2 {C:/AlteraPrj/C4M1P2/DE10_LITE_Golden_Top.v}
vcom -93 -work work {C:/AlteraPrj/C4M1P2/C4M1P2.vhd}

