%% simple start script for rocket2the moon will pause between each step
% this shows hot to use the calls

%%
%%Initialisation
disp('Initialisation: warning will clear current work space');
disp('Press return to continue');
pause();

clear all;
[state,const,control]=initmarsmission();

%or load a current state file (comment the above statement out)
%load('currentstate.mat');
disp('Rocket to the moon state initialised');
disp('Press return to continue');
pause;

%%
% Initialise graphics
disp('Initialise graphics');

figh=startrocketgraphics(state); %returns handle to the graphics

disp('Graphics initialised');
disp('Press return to continue');
pause;

%% play rocket to the moon

[i,currentstate]=playmarsmission(state, control, const,figh);

disp('Current cycle completed at step i.');

save('currentstate.mat');

disp('Current state stored in currentstate.mat');

%% checks which can be made

% check the earth moon distance should average 3.84402e8
%https://en.wikipedia.org/wiki/Lunar_distance_(astronomy)

%following tests can be performed can do similare tests for earth-rocket
%and moon-rocket

%earth moon distance
disp('earth moon distance');
dist(state.xe,state.ye,state.xm,state.ym)

%orbital speed of moon should be (balance centripetal force with gravity)
disp('orbital speed of moon should be (balance centripetal force with gravity)');
sqrt(const.G*const.me/dist(state.xe,state.ye,state.xm,state.ym))

%orbital speed of moon measured (relative to earth)
disp('orbital speed of moon measured (relative to earth)');
sqrt((vxe-vxm).^2+(vye-vym).^2)


