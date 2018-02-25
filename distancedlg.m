function distancedlg(selected, state, control, consts)
%% distance dialog Computes distance from rocket to selected object
%   e.g. sun, moon, earth, mars

    rootmsg='Distance of the rocket from the';
    
    switch selected
        case 'earth'
            distance=dist(state.x,state.y,state.xe,state.ye)/1.0e9;
            msg=[rootmsg, ' Earth is: ',num2str(distance) ,'Gm']; %n.b. Millions of km
        case 'moon'
            distance=dist(state.x,state.y,state.xm,state.ym)/1.0e9;
            msg=[rootmsg, ' Moon is: ',num2str(distance) ,'Gm']; %n.b. Millions of km            
        case 'sun'
            distance=dist(state.x,state.y,state.xs,state.ys)/1.0e9;
            msg=[rootmsg, ' Sun is: ',num2str(distance) ,'Gm']; %n.b. Millions of km            
        case 'mars'
            distance=dist(state.x,state.y,state.xma,state.yma)/1.0e9;
            msg=[rootmsg, ' Mars is: ',num2str(distance) ,'Gm']; %n.b. Millions of km            
        case 'rocket'
           msg='Distance from the rocket is zero!';
        otherwise
           msg='Click the close button when you''re done.';
    end

    d = dialog('Position',[300 300 250 150],'Name','Distance Dialog');  

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String',msg);

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','Close',...
               'Callback','delete(gcf)');
end