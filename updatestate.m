function [currentstate] = updatestate(state, control, const,figh)
%Update the state for one iteration

figh.h.XDataSource ='x';
figh.h.YDataSource = 'y';
figh.hm.XDataSource ='xm';
figh.hm.YDataSource = 'ym';
figh.hma.XDataSource ='xma';
figh.hma.YDataSource = 'yma';
figh.he.XDataSource ='xe';
figh.he.YDataSource = 'ye';

       %%update rocket
       %calculate vx
       newvx=state.vx;
       newvy=state.vy;
       
       %TODO replace with gravaccel
       %rocket-earth
       r2=((state.x-state.xe).^2+(state.y-state.ye).^2);
       r=sqrt(r2);
       g=const.G*const.me/r2;
       
       gx=g*(state.x-state.xe)/r;
       gy=g*(state.y-state.ye)/r;
       
       %rocket moon
       %replace with gravaccel
       r2=((state.x-state.xm).^2+(state.y-state.ym).^2);
       r=sqrt(r2);
       g=const.G*const.mm/r2;
       gx=gx+g*(state.x-state.xm)/r;
       gy=gy+g*(state.y-state.ym)/r;
      
       %rocket-sun
       [gxt,gyt]=gravaccel(state.x,state.xs,state.y,state.ys,const.ms);%sun contrib
       gx=gx+gxt;
       gy=gy+gyt;
       
        %rocket-mars
       [gxt,gyt]=gravaccel(state.x,state.xma,state.y,state.yma,const.mmars);%mars contrib
       gx=gx+gxt;
       gy=gy+gyt;      
             
       gx=gx+control.fx/const.mr;
       gy=gy+control.fy/const.mr;  
       
       %calculate vy
       newvy=state.vy-gy*control.dt;
       newvx=state.vx-gx*control.dt;
 
        %store old position vector
        oldr(1,1)=state.x;
        oldr(1,2)=state.y;
        
 
      

        
       
       %calculate x
       state.x=state.x+0.5*(state.vx+newvx)*control.dt;
       
       %calculate y
       state.y=state.y+0.5*(state.vy+newvy)*control.dt;
       
       
       
%% moon             %moon
   %old locator for moon
%       thetam=thetam+dthetam*dt;
%       if thetam>(2*pi)
%          thetam=0; 
%       end
%       xm=dem*cos(thetam);
%       ym=dem*sin(thetam);
       gx=0;
       gy=0;
       [gxt,gyt]=gravaccel(state.xm,state.xe,state.ym,state.ye,const.me);%earth contrib
       gx=gx+gxt;
       gy=gy+gyt;
       
       [gxt,gyt]=gravaccel(state.xm,state.xs,state.ym,state.ys,const.ms);%earth contrib
       gx=gx+gxt;
       gy=gy+gyt; 

       [gxt,gyt]=gravaccel(state.xm,state.xma,state.ym,state.yma,const.mmars);%earth contrib
       gx=gx+gxt;
       gy=gy+gyt; 
       
       
       %update velocity
       newvy=state.vym-gy*control.dt;
       newvx=state.vxm-gx*control.dt;
       state.xm=state.xm+0.5*(state.vxm+newvx)*control.dt;
       state.ym=state.ym+0.5*(state.vym+newvy)*control.dt;
       state.vxm=newvx;
       state.vym=newvy; 
       
 
       
%% update earth
       gx=0;
       gy=0;


       %earth-sun
       [gxt,gyt]=gravaccel(state.xe,state.xs,state.ye,state.ys,const.ms);%sun contrib
       gx=gx+gxt;
       gy=gy+gyt;
       
        %earth-moon
       [gxt,gyt]=gravaccel(state.xe,state.xm,state.ye,state.ym,const.mm);%sun contrib
       gx=gx+gxt;
       gy=gy+gyt;
       
        %earth-mars
       [gxt,gyt]=gravaccel(state.xe,state.xma,state.ye,state.yma,const.mmars);%sun contrib
       gx=gx+gxt;
       gy=gy+gyt;

       %update velocity
       newvy=state.vye-gy*control.dt;
       newvx=state.vxe-gx*control.dt;
       state.xe=state.xe+0.5*(state.vxe+newvx)*control.dt;
       state.ye=state.ye+0.5*(state.vye+newvy)*control.dt;
       state.vxe=newvx;
       state.vye=newvy; 
       

       
%% update mars
       gx=0;
       gy=0;


        %sun
       [gxt,gyt]=gravaccel(state.xma,state.xs,state.yma,state.ys,const.ms);%sun contrib
       gx=gx+gxt;
       gy=gy+gyt;       
 
  
               %earth
        [gxt,gyt]=gravaccel(state.xma,state.xe,state.yma,state.ye,const.me);%sun contrib
       gx=gx+gxt;
       gy=gy+gyt; 
       
              %update velocity
       newvy=state.vyma-gy*control.dt;
       newvx=state.vxma-gx*control.dt;
       state.xma=state.xma+0.5*(state.vxma+newvx)*control.dt;
       state.yma=state.yma+0.5*(state.vyma+newvy)*control.dt;
       state.vxma=newvx;
       state.vyma=newvy; 
       
       
       
%%        %%update the animation
      set(figh.h,'XData',state.x);
      set(figh.h,'YData',state.y);

       set(figh.hm,'XData',state.xm);
      set(figh.hm,'YData',state.ym);
     
        set(figh.he,'XData',state.xe);
      set(figh.he,'YData',state.ye);     

             set(figh.hma,'XData',state.xma);
      set(figh.hma,'YData',state.yma);
      
      
      drawnow;
       state.vx=newvx;
       state.vy=newvy;

        newr(1,1)=state.x;
        newr(1,2)=state.y;
 
 %plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
 %hold on;
        %vectarrow(oldr, newr);
%         hold on;

currentstate=state;


end

