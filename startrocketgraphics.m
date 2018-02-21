

figure;
hold on;
re=re/2; %modification for moon model

hax1=line([-re-box -re-box], [re+box -re-box]);
hax2=line([re+box -re-box], [re+box +re+box]);
hax3=line([re+box re+box], [-re-box +re+box]);
hax4=line([-re-box re+box], [-re-box -re-box]);

  set( hax1 , 'Color' ,'red' );
he=plot( xe , ye ,'o','MarkerFaceColor','b','MarkerSize',5);
hold on;
h=plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',4);
hold on;
hm=plot( xm , ym ,'o','MarkerFaceColor','b','MarkerSize',4);
hold on;
hma=plot( xma , yma ,'o','MarkerFaceColor','r','MarkerSize',5);
hold on;

hs=plot( xs , ys ,'o','MarkerFaceColor','y','MarkerSize',7);
hold on;







%output



pause;
