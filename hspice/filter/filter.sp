****** Low Pass Filter ******
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
vi		vi		gnd		DC=0	AC=1
*vi		vi		gnd		sin(0 1v 100k)
*Vinp	Vinp	gnd		DC=0	AC=1
*Vinn	Vinn	gnd		DC=0
vo		vo		Vinn	DC=0
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
Cc	2	vo	1.8p
R1	5	vi	10k
R2	5	Vinp	10k
C3	gnd	Vinp	7n
C4	5	vo		14n

***** Analysis *****
.op
.ac dec 10 10m 1MEG
.probe vdb(vo)vp(vo)
*.tran 1n 100u
*.probe tran v(vo) 
*.probe tran v(vi)
.end