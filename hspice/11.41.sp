****** Title ******
***** model/lib *****
.lib 'cic018.l' TT
***** options *****
.option post accurate method=gear
.option probe
.temp 27
.global	vdd vss gnd vi
***** Source *****
Vdd		Vdd		gnd 		DC=2.5
Vss		gnd		Vss			DC=2.5
vi		vi		0			sin(0 10v 100Meg)
***** Main Circuit *****
M1 Vdd N001 vo vo n_18 l=0.18u w=64.08u m=1
M2 N001 N001 N002 N002 n_18 l=0.18u w=6.408u m=1
M3 Vss vi vo vo p_18 l=0.18u w=80.01u m=2
M4 vi vi N002 N002 p_18 l=0.18u w=16.002u m=1
I1 Vdd N001 0.1m
***** ac/dc/tran analysis *****
.op
.dc  vi  -5 5 0.1
.probe dc v(vo)
.probe dc v(vi)
.tran 1n 10u
.probe tran v(vo) 
.probe tran v(vi) 



.end