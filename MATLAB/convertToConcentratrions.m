function [ hbo, hbr, hbt ] = convertToConcentratrions( dod, SD, ppf )
%Convert changes in optical density (dod) to changes in concentrations (HbO, HbR, and HbT)

dc = hmrOD2Conc( dod, SD, ppf );

hbo=squeeze(dc(:,1,:));
hbr=squeeze(dc(:,2,:));
hbt=squeeze(dc(:,3,:));

end

