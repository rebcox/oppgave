function [ hbo, hbr, hbt ] = convertToConcentratrions( od, SD, ppf )
%Convert changes in optical density (od) to changes in concentrations (HbO, HbR, and HbT)

dc = hmrOD2Conc( od, SD, ppf );

hbo=squeeze(dc(:,1,:));
hbr=squeeze(dc(:,2,:));
hbt=squeeze(dc(:,3,:));

end

