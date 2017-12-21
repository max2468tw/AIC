****** two stage opamp ******
***** model/lib *****
.lib 'cic018.l' TT
***** options *****
.option post accurate method=gear
.option probe
.temp 27
.global Vdd Vss gnd
***** Source *****
Vdd		Vdd		gnd		DC=1.8
Vss		Vss		gnd		DC=-1.8
Iref	4		Vss		30uA
Vinp	Vinp	gnd		DC=0	AC=1
Vinn	Vinn	gnd		DC=0

***** Main Circuit *****
*M	D	G		S	B
M1	3	Vinn	1	Vdd p_18 l=1u w=25u m=1
M2	2	Vinp	1	Vdd p_18 l=1u w=25u m=1
M3	3	3		Vss Vss n_18 l=1u w=10u m=1
M4	2	3		Vss Vss n_18 l=1u w=10u m=1
M5	1	4		Vdd Vdd p_18 l=1u w=50u m=1
M6	vo	2		Vss	Vss n_18 l=1u w=50u m=1
M7	vo	4		Vdd Vdd p_18 l=1u w=25u m=5
M8	4	4		Vdd Vdd p_18 l=1u w=5u m=1
Cc	2	vo		1.8p
Cl	vo	gnd		4p

***** analysis *****
.op
.ac dec 10 10 1G
.probe vdb(vo)vp(vo)
.meas AC Gain10Hz Find vdb(vo) AT 10
.meas AC Unit_gain when vdb(vo)=0
.meas AC Phase_mar Find vp(vo) when vdb(vo)=0

.end
