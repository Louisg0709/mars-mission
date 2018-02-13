%rocket2
%what rocket2 does

%this rocket will go out of the earths atmosphere

%use newtons law of gravity
%  https://en.wikipedia.org/wiki/Gravitational_constant


clear all %here because variables not initilised correctly :-( :-(  merde!!!

G=6.67e-11; %gravitational constants SI units
re=6.3781e6; %radius of the earth metres
me=5.97237e24; %earth mass kg
mm=7.342e22; %moonmas kg
ms=1.99e30; %mass sun
mmars=6.42e23 ; %mass mars
dem=381.5e6; %dist moon-earth metres
xm=381.5e6; %xpos moon
ym=0; %ypos moon
vxm=0; %moon speed in orbit x-direction
vym=1023.1;


xe=0; %x position of earth
ye=0; %y position of earth
vxe=30000;
vye=0;

xs=0; %x position of sun
ys=149.6e9; %y position of sun


xma=0; %xpos mars
yma=225e9+ys; %ypos mars (note added sun distance on)
vxma=-24130;
vyma=0;





thetam=0;
dthetam=2*pi/(27*24*3600); %angular velocity of the moon
mr=1000; %not used ?????

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nsteps=400000;
dt=1; %time step
%launch angle
theta=0;
% box=20000000;
box=800e6; %include moon
 %theta is in degrees here

%initial speed
u=9000; %metres per second
g=9.81; %acceleration due to gravity

xe=0;
ye=0;

y=re+50000;
x=0;

%convert theta to radians
theta=theta*2*pi/360;

vx=u*cos(theta);
vy=u*sin(theta);



pause;
