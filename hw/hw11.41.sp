***11.41***

***Model***
.model nch nmos level=1 vto=0.45 kp=250u lambda=0.1
.model pch pmos level=1 vto=-0.45 kp=100u lambda=0.2

***Control***
.temp=30
.GLOBAL vdd gnd vss
.option nomod post acout=0 ***
.op
.probe i(*)
.tran 0.5us 100ms

***Power supply***
*name + - value
v1 n3 GND -0.6V			 
v3 vdd GND 2.5V		
v4 vss GND -2.5V    
i1 vdd n1  0.1mA    

***Main***
m1 n1 n1 n2 vss nch l=0.18u w=6.4u 
m2 n3 n3 n2 vdd pch l=0.18u w=16u
mn vdd n1 n4 vss nch l=0.18u w=u m=
mp vss n3 n4 vdd pch l=0.18u w=u m=

.end