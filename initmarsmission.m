function [state, const, control]=initmarsmission()
%% Initialise parameters for rocket to the moon
% will eventually take inputs e.g. read arguments from file

%%
%rocket2
%what rocket2 does

%this rocket will go out of the earths atmosphere

%use newtons law of gravity
%  https://en.wikipedia.org/wiki/Gravitational_constant


%TODO design tests
%TODO tests for gravitational model test each planet, satellite in turn
%TODO test each planet around sun
%TODO test satellite around each planet set initiallisation case to enable
%this

%%

%TODO improved control structure
%TODO add current time  (days??)
%TODO report structure report velocities and separation between objects
%TODO apply force (impulse to rocket)



%%
clear all %here because variables not initilised correctly :-( :-(  merde!!!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%const
const.G=6.67e-11; %gravitational constants SI units
const.re=6.3781e6; %radius of the earth metres
const.de=2*6.3781e6; %diameter of the earth metres
const.me=5.97237e24; %earth mass kg
const.mm=7.342e22; %moonmas kg
const.ms=1.99e30; %mass sun
const.mmars=6.42e23 ; %mass mars
const.dem=381.5e6; %average dist moon-earth metres
const.mr=1.0; %mass of rocket





%%
%%state vars

state.time=0; %time hours
state.xe=0; %x position of earth
state.ye=0; %y position of earth
state.vxe=30000;% x-speed of the earth
state.vye=0;%y-speed of the earth
state.xm=381.5e6; %xpos moon
state.ym=0; %ypos moon
state.vxm=+state.vxe; %moon speed in orbit x-direction
state.vym=state.vye+1023.1;



state.vxs=0.0;
state.vys=0.0;
state.xs=0; %x position of sun
state.ys=149.6e9; %y position of sun

state.xma=0; %xpos mars
state.yma=225e9+state.ys; %ypos mars (note added sun distance on)
state.vxma=-24130;
state.vyma=0;





%initial conds for rocket
state.u=9000; %initial speed%metres per second;
state.y=const.re+50000;
state.x=0;
%convert theta to radians
state.theta=0;
state.theta=state.theta*2*pi/360;
state.vx=state.u*cos(state.theta);
state.vy=state.u*sin(state.theta);


%%
%control vars
control.nsteps=500000;
control.dt=1; %time step
control.theta=0;
control.box=800e6; %include moon
control.saveinterval=control.nsteps;
control.fx=0; %fx and fy force on rocket (thrust from motors)
control.fy=0;


%% 
thetam=0;
dthetam=2*pi/(27*24*3600); %angular velocity of the moon
mr=1000; %not used ?????
%%


end