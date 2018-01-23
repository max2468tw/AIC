****** Two-Stage CMOS op-amp ******
***** Model/Lib *****
.lib 'cic018.l' TT
***** Options *****
.option post accurate method=gear
.option probe
.temp 27
.global Vdd Vss gnd
***** Source *****
Vdd		Vdd		gnd		DC=1.65
Vss		Vss		gnd		DC=-1.65
Iref	4		Vss		20uA
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

***** Analysis *****
.op
.ac dec 10 10 1G
.probe vdb(vo)vp(vo)
.meas AC Gain10Hz FIND vdb(vo) AT 10
.meas AC Unit_gain WHEN vdb(vo)=0
.meas AC Phase_mar FIND vp(vo) WHEN vdb(vo)=0

**SLEW RATE**
vinp vinp gnd pulse(0v 1.8v 1us 0us 0us 1us 2us)
M1 2	vout	3	gnd n_18 l=1u w=3.5u m=1
.tran 1p
.probe V(vout) V(vinp)
.meas Tran Up_Slew-Rate DERIV V(vout) AT=1.05us

**ICMR**
vinp vinp gnd dc=0.9
M1 2	vout	3	gnd n_18 l=1u w=3.5u m=1
.dc vinp 0 1.8 1m
.probe V(vout) V(vinp)

**OUTPUT VOLTAGE SWING**
vinp vinp gnd dc=0.9
R1 VIN vinn 10k
R2 vinn vout 100k
VIN VIN gnd dc=0.9
.dc VIN 0 1.8 1m
.probe V(vout) V(vin)

**CMRR**
vcm 	vcm 	gnd		dc=0.9 ac=1
vinp	vinp	vcm		dc=0
vinn	vinn	vcm		dc=0
.ac dec 10 10 1G
.probe vdb(vout)

.end
