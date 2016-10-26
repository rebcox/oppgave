
%CreateNirsFileForHomer;
nirsFile =  'cw012.nirs';
load(nirsFile,'-mat');

dod = hmrIntensity2OD( d ); %dod: delta optical density
dc = hmrOD2Conc( dod, SD, [6, 6] ); %dc: the concentration data

% dimToPlot = 1;
% sz = size(dc);
% inds = repmat({1},1,ndims(dc));
% inds{dimToPlot} = 1:sz(dimToPlot);
% oneChannel = dc(inds{:});
% plot(oneChannel)

%%
hbo=squeeze(dc(:,1,:));
hbr=squeeze(dc(:,2,:));
hbt=squeeze(dc(:,3,:));

%%
plot(hbo(:,13));
%%
figure

dimToPlot = 1;
sz = size(dod);
inds = repmat({1},1,ndims(dod));
inds{dimToPlot} = 1:sz(dimToPlot);
oneChannel = dod(inds{:});
plot(oneChannel)