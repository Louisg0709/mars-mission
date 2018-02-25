function [angle] = orbitalangle(x1,y1,vx1,vy1,x2,y2,vx2,vy2)
%%orbital angle
%  for the rocket around a selected body e.g. sun, moon, earth, mars
%  compute the orbital angle i.e. the angle between the orbital radius
%  vector and the velocity vector
%   Object 1 is at x1,y1,vx1,vy1
%   Object 2 is at x2,y2,vx2,vy2

dp=(vx1-vx2).*(x1-x2)+(vy1-vy2).*(y1-y2);
relspeed=sqrt((vx1-vx2).^2+(vy1-vy2).^2);
sep=sqrt((x1-x2).^2+(y1-y2).^2);

angle=360*acos(dp/(relspeed*sep))/(2*pi);
end

