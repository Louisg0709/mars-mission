function [gx,gy] = gravaccel(x,xs,y,ys,ms)
%Return gravitational acceleration on body at x,y due to body of mass mds
%located at xs,ys
       G=6.67e-11; %gravitational constants SI units
       r2=((x-xs).^2+(y-ys).^2);
       r=sqrt(r2);
       g=G*ms/r2;
       gx=g*(x-xs)/r;
       gy=g*(y-ys)/r;
end

