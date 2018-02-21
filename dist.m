function [sep] = dist(x1,y1,x2,y2)
%dist Computes the distance between two objects
%   Object 1 is at x1,y1
%   Object 2 is at x2,y2
sep=sqrt((x1-x2).^2+(y1-y2).^2);
end

