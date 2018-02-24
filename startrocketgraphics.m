function [figh]=startrocketgraphics(state)

%% Initiaslise graphics for rocket to the moon simulation
% returns graphics handles for animated  objects and figure handle
figh.fig=figure;
hold on;

%figure handles stored in figh


figh.he=plot( state.xe , state.ye ,'o','MarkerFaceColor','b','MarkerSize',5);
hold on;
figh.h=plot( state.x , state.y ,'o','MarkerFaceColor','g','MarkerSize',4);
hold on;
figh.hm=plot( state.xm , state.ym ,'o','MarkerFaceColor','b','MarkerSize',4);
hold on;
figh.hma=plot( state.xma , state.yma ,'o','MarkerFaceColor','r','MarkerSize',5);
hold on;

figh.hs=plot( state.xs , state.ys ,'o','MarkerFaceColor','y','MarkerSize',7);
hold on;




end