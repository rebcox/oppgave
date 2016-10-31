% dod = hmrIntensity2OD( d )
%
% UI NAME:
% Intensity_to_OD 
%
% Converts internsity (raw data) to optical density
%
% INPUT
% d - intensity data (#time points x #data channels
%
% OUTPUT
% dod - the change in optical density

function dod = hmrIntensity2OD( d )

% convert to dod
dm = mean(abs(d),1); % mean of the whole experiment, on each channel
nTpts = size(d,1); % #rows
%I_init (the denominator) is the mean of the whole experiment 
dod = -log(abs(d)./(ones(nTpts,1)*dm));

if ~isempty(find(d(:)<=0))
    warning( 'WARNING: Some data points in d are zero or negative.' );
end
