function orbitalangledlg(selected, state, control, consts)
%%orbital angle dialog
%  for the rocket around a selected body e.g. sun, moon, earth, mars
%  compute the orbital angle i.e. the angle between the orbital radius
%  vector and the velocity vector

    rootmsg='Orbital Angle:';
    
    switch selected
        case 'earth'
            angle = orbitalangle(state.x,state.y,state.vx,state.vy,state.xe,state.ye,state.vxe,state.vye);
            msg=[rootmsg, ' Earth  ',num2str(angle),' degrees']; 
        case 'moon'
            angle = orbitalangle(state.x,state.y,state.vx,state.vy,state.xm,state.ym,state.vxm,state.vym);
            msg=[rootmsg, ' Moon  ',num2str(angle),' degrees'];  
        case 'sun'
            angle = orbitalangle(state.x,state.y,state.vx,state.vy,state.xs,state.ys,state.vxs,state.vys);
            msg=[rootmsg, ' Sun  ',num2str(angle),' degrees'];  
        case 'mars'
            angle = orbitalangle(state.x,state.y,state.vx,state.vy,state.xma,state.yma,state.vxma,state.vyma);
            msg=[rootmsg, ' Mars  ',num2str(angle),' degrees'];  
        case 'rocket'
           msg='Distance from the rocket is zero!';
        otherwise
           msg='Click the close button when you''re done.';
    end




    d = dialog('Position',[300 300 250 150],'Name','Orbital Angle Dialog');

   
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String',msg);

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','Close',...
               'Callback','delete(gcf)');
end