function [speed, relspeed, orbspeed] = orbitalspeed(x1,y1,vx1,vy1,x2,y2,vx2,vy2,mass,consts)
%% orbitalspeed
%   Object 1 is at x1,y1,vx1,vy1
%   Object 2 is at x2,y2,vx2,vy2

relspeed=sqrt((vx1-vx2).^2+(vy1-vy2).^2);
speed=sqrt(vx1.^2+vx2.^2);
sep=sqrt((x1-x2).^2+(y1-y2).^2);

orbspeed=consts.G*mass/sep;
orbspeed=sqrt(orbspeed);
end

