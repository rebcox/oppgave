function refpts = displayRefpts(refpts, hAxes)

if isempty(refpts)
    return;
end
if refpts.isempty(refpts)
    return;
end
if ~exist('hAxes','var')
    hAxes = refpts.handles.axes;
end
if ishandles(refpts.handles.labels)
    delete(refpts.handles.labels);
end
if ishandles(refpts.handles.circles)
    delete(refpts.handles.circles);
end

if isempty(refpts.orientation)
    [nz,iz,rpa,lpa,cz] = getLandmarks(refpts);
    [refpts.orientation, refpts.center] = getOrientation(nz, iz, rpa, lpa, cz);
end
if leftRightFlipped(refpts)
    axes_order = [2,1,3];
else
    axes_order = [1,2,3];
end

% View ref points on surface
viewOrigin(hAxes);
pts=[];
for ii=1:length(refpts.labels)
    pts(ii).pos = refpts.pos(ii,:);
    pts(ii).col = refpts.handles.color;
    pts(ii).textsize = refpts.handles.textSize;
    pts(ii).circlesize = refpts.handles.circleSize;
    pts(ii).str  = refpts.labels{ii};
end
[hLabels, hCircles]  = viewPts(pts, refpts.center, 0, axes_order);
hold off

refpts.handles.labels = hLabels;
refpts.handles.circles = hCircles;
refpts.handles.selected = zeros(size(hLabels,1),1)-1;

if ishandles(refpts.handles.labels)
    set(refpts.handles.radiobuttonShowRefptsLabels,'enable','on');
    set(refpts.handles.radiobuttonShowRefptsCircles,'enable','on');
else
    set(refpts.handles.radiobuttonShowRefptsLabels,'enable','off');
    set(refpts.handles.radiobuttonShowRefptsCircles,'enable','off');
end
if length(refpts.labels)>=5
    set(refpts.handles.menuItemCalculateRefpts,'enable','on');
else
    set(refpts.handles.menuItemCalculateRefpts,'enable','off');
end

radiobuttonShowRefpts(refpts.handles.radiobuttonShowRefptsLabels, refpts, []);
