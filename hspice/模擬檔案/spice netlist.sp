****** Title ******
***** model/lib *****
.lib 'cic018.l' TT
***** options *****
.option post accurate method=gear
.option probe
.temp 27
.global	vdd gnd
***** Source *****
Vdd		Vdd		gnd 		DC=1.8
***** Main Circuit *****
X1 input_pin output_pin circuit_name
Mp D G S B p_18 l=1u w=1u m=1
Mn D G S B n_18 l=1u w=1u m=1
Q1	C B E	PNP_V50X50	M=1
R1 plus minus 1k
C1 plus minus 1p
***** ac/dc/tran analysis *****
.op
.ac dec 10 1k 1g
.probe ac vdb(vout) vp(vout)
.dc  vin  0 1 0.1
.probe dc v(vout)
.tran 1n 10u
.probe tran v(vout)

***** Sub circuit *****
.subckt circuit_name input_pin output_pin

.ends


.end