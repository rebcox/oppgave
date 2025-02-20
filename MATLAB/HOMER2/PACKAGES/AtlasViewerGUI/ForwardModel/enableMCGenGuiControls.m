function fwmodel = enableMCGenGuiControls(fwmodel, onoff)

handles = fwmodel.handles;
if strcmp(onoff,'off')
    set(handles.menuItemGenerateMCInput,'enable','off');
    set(handles.menuItemGenFluenceProfile,'enable','off');
elseif strcmp(onoff,'on')
    set(handles.menuItemGenerateMCInput,'enable','on');
    set(handles.menuItemGenFluenceProfile,'enable','on');
end
