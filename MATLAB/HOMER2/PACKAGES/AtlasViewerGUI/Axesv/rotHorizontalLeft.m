function axesv = rotHorizontalLeft(axesv,deg)

if ~exist('deg','var')
    deg = axesv.rotation.degrees;
end
camorbit(axesv.handles.axesSurfDisplay,deg,0,'camera');
%disp(sprintf('Rot Horizontal Left: %s',num2str(deg)));
