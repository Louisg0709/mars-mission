

figure;
hold on;
re=re/2; %modification for moon model

hax1=line([-re-box -re-box], [re+box -re-box]);
hax2=line([re+box -re-box], [re+box +re+box]);
hax3=line([re+box re+box], [-re-box +re+box]);
hax4=line([-re-box re+box], [-re-box -re-box]);

  set( hax1 , 'Color' ,'red' );
plot( xe , ye ,'o','MarkerFaceColor','r','MarkerSize',30);
hold on;
h=plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
hold on;
hm=plot( xm , ym ,'o','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot( xma , yma ,'o','MarkerFaceColor','r','MarkerSize',30);
hold on;

plot( xs , ys ,'o','MarkerFaceColor','r','MarkerSize',90);
hold on;







%output



pause;
