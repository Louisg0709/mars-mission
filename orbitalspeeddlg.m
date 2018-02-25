function orbitalspeeddlg(selected, state, control, consts)
%% orbital speed dialog Computes the orbital speed 
%  for the rocket around a selected body e.g. sun, moon, earth, mars
%  uses balance of gravtiy force and centripetal force


    rootmsg='Speed relative speed and predicted orbital speed:';
    
    switch selected
        case 'earth'
            [speed, relspeed, orbspeed] = orbitalspeed(state.x,state.y,state.vx,state.vy,state.xe,state.ye,state.vxe,state.vye,consts.me,consts);
            msg=[rootmsg, ' Earth are: ',newline,num2str(speed/1000),' ',num2str(relspeed/1000),' ',num2str(orbspeed/1000) ,'km/s']; 
        case 'moon'
            [speed, relspeed, orbspeed] = orbitalspeed(state.x,state.y,state.vx,state.vy,state.xm,state.ym,state.vxm,state.vym,consts.mm,consts);
            msg=[rootmsg, ' Moon are: ',newline,num2str(speed/1000),' ',num2str(relspeed/1000),' ',num2str(orbspeed/1000) ,'km/s']; 
        case 'sun'
            [speed, relspeed, orbspeed] = orbitalspeed(state.x,state.y,state.vx,state.vy,state.xs,state.ys,state.vxs,state.vys,consts.ms,consts);
            msg=[rootmsg, ' Sun are: ',newline,num2str(speed/1000),' ',num2str(relspeed/1000),' ',num2str(orbspeed/1000) ,'km/s']; 
        case 'mars'
            [speed, relspeed, orbspeed] = orbitalspeed(state.x,state.y,state.vx,state.vy,state.xma,state.yma,state.vxma,state.vyma,consts.mmars,consts);
            msg=[rootmsg, ' Mars are: ',newline,num2str(speed/1000),' ',num2str(relspeed/1000),' ',num2str(orbspeed/1000) ,'km/s']; 
        case 'rocket'
           msg='Distance from the rocket is zero!';
        otherwise
           msg='Click the close button when you''re done.';
    end




    d = dialog('Position',[300 300 250 150],'Name','Orbital Speed Dialog');

   
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String',msg);

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','Close',...
               'Callback','delete(gcf)');
end