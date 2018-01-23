****** Low Pass Filter ******
***** Model/Lib *****
.lib 'cic018.l' TT
***** Options *****
.option post accurate method=gear
.option probe
.temp 27
.global Vdd gnd
***** Source *****
Vdd		Vdd		gnd		DC=1.8
Iref	vdd		4		20uA
*Vinp	Vinp	gnd		DC=0.9	AC=1
*Vinn	Vinn	gnd		DC=0.9
vi		vi		gnd		sin(0.9 0.5v 100k)
*vi		vi		gnd		DC=0.9	AC=1
vo		vo		Vinn	DC=0
***** Main Circuit *****
*M	D	G		S	B
M1	3	Vinn	1	gnd n_18 l=1u w=25u m=1
M2	2	Vinp	1	gnd n_18 l=1u w=25u m=1
M3	3	3		Vdd Vdd p_18 l=1u w=62.5u m=1
M4	2	3		Vdd Vdd p_18 l=1u w=62.5u m=1
M5	1	4		gnd gnd n_18 l=1u w=50u m=1
M6	vo	2		Vdd	Vdd p_18 l=1u w=62.5u m=5
M7	vo	4		gnd gnd n_18 l=1u w=25u m=5
M8	4	4		gnd gnd n_18 l=1u w=5u m=1
Cc	2	vo		10p
*Cl	vo	gnd		4p
R1	5	vi		10k
R2	5	Vinp	10k
C3	gnd	Vinp	1n
C4	5	vo		2n

***** Analysis *****
.op
*.ac dec 10 10m 1MEG
*.probe vdb(vo)vp(vo)
.tran 1n 100u
.probe tran v(vo) 
.probe tran v(vi)

.end
