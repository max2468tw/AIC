****** Wien-bridge oscillator ******
***** Model/Lib *****
.lib 'cic018.l' TT
***** Options *****
.option post accurate method=gear
.option probe
.temp 27
.global Vdd Vss gnd
***** Source *****
Vdd		Vdd		gnd		DC=1.8
Vss		Vss		gnd		DC=-1.8
Iref	4		Vss		20uA

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
*Cl	vo		gnd		4p
R1	Vinn 	gnd		10k
R2	Vinn	vo		21k
Cs	Vinp	5		15.1n
Rs	5		vo		1k
Cp	Vinp	gnd		15.1n
Rp	Vinp	gnd		1k

***** Analysis *****
.op
.tran 10ns 10ms UIC
.probe tran v(vo) 

.end