transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/BCDEncoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/Stopwatch.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/ClockDivider50MHzTo100Hz.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/StopwatchLogic.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/SevenSegEncoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/GetMinute.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/GetSecond.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/GetDecs.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/SevenSegDisplay.v}

vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Stopwatch/Stopwatch {C:/Users/lenovo/Desktop/Stopwatch/Stopwatch/StopwatchLogic_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  StopwatchLogic_tb

add wave *
view structure
view signals
run -all
