function [i,currentstate]=playmarsmission(state, control, const,figh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
newstate=state;
disp('Starting the simulation at time ');
for i=1:control.nsteps
   newstate=updatestate(newstate, control, const,figh); 
% % % figh.h.XDataSource ='x';
% % % figh.h.YDataSource = 'y';
% % % figh.hm.XDataSource ='xm';
% % % figh.hm.YDataSource = 'ym';
% % %        %calculate vx
% % %        newvx=state.vx;
% % %        newvy=state.vy;
% % %        
% % %        %TODO replace with gravaccel
% % %        r2=((state.x-state.xe).^2+(state.y-state.ye).^2);
% % %        r=sqrt(r2);
% % %        g=const.G*const.me/r2;
% % %        
% % %        gx=g*(state.x-state.xe)/r;
% % %        gy=g*(state.y-state.ye)/r;
% % %        
% % %        %replace with gravaccel
% % %        r2=((state.x-state.xm).^2+(state.y-state.ym).^2);
% % %        r=sqrt(r2);
% % %        g=const.G*const.mm/r2;
% % %        gx=gx+g*(state.x-state.xm)/r;
% % %        gy=gy+g*(state.y-state.ym)/r;
% % %       
% % %        
% % %        
% % %        %calculate vy
% % %        newvy=state.vy-gy*control.dt;
% % %        newvx=state.vx-gx*control.dt;
% % %  
% % %         %store old position vector
% % %         oldr(1,1)=state.x;
% % %         oldr(1,2)=state.y;
% % %         
% % %  
% % %       
% % % 
% % %         
% % %        
% % %        %calculate x
% % %        state.x=state.x+0.5*(state.vx+newvx)*control.dt;
% % %        
% % %        %calculate y
% % %        state.y=state.y+0.5*(state.vy+newvy)*control.dt;
% % %        
% % %        
% % %        
% % %              %moon
% % %    %old locator for moon
% % % %       thetam=thetam+dthetam*dt;
% % % %       if thetam>(2*pi)
% % % %          thetam=0; 
% % % %       end
% % % %       xm=dem*cos(thetam);
% % % %       ym=dem*sin(thetam);
% % %        gx=0;
% % %        gy=0;
% % %        [gxt,gyt]=gravaccel(state.xm,state.xe,state.ym,state.ye,const.me);%earth contrib
% % %        gx=gx+gxt;
% % %        gy=gy+gyt;
% % %        %update velocity
% % %        newvy=state.vym-gy*control.dt;
% % %        newvx=state.vxm-gx*control.dt;
% % %        state.xm=state.xm+0.5*(state.vxm+newvx)*control.dt;
% % %        state.ym=state.ym+0.5*(state.vym+newvy)*control.dt;
% % %        state.vxm=newvx;
% % %        state.vym=newvy; 
% % %        
% % %        
% % %        
% % %        
% % %        
% % % %       refreshdata; 
% % % 
% % % %       h.XData=x;
% % % %       h.YData=y;
% % % 
% % %         %update the animation
% % %       set(figh.h,'XData',state.x);
% % %       set(figh.h,'YData',state.y);
% % % 
% % %        set(figh.hm,'XData',state.xm);
% % %       set(figh.hm,'YData',state.ym);
% % %      
% % %       
% % %       
% % %       drawnow;
% % %        state.vx=newvx;
% % %        state.vy=newvy;
% % % 
% % %         newr(1,1)=state.x;
% % %         newr(1,2)=state.y;
% % %  
% % %  %plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
% % %  %hold on;
% % %         %vectarrow(oldr, newr);
% % % %         hold on;

end
  currentstate=newstate;
end