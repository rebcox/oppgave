function [fwmodel, err] = genMCoutput(fwmodel, probe, dirnameSubj, mode)

err = true;

if ~isempty(dir([dirnameSubj 'fw/fw.*.2pt']))
    delete([dirnameSubj 'fw/fw.*.2pt']);
end
if ~isempty(dir([dirnameSubj 'fw/fw.*.his']))
    delete([dirnameSubj 'fw/fw.*.his']);
end
if ~isempty(dir([dirnameSubj 'fw/Adot.mat']))
    delete([dirnameSubj 'fw/Adot.mat']);
end
if ~isempty(dir([dirnameSubj 'fw/AdotVol.3pt']))
    delete([dirnameSubj 'fw/AdotVol.3pt']);
end
if ~isempty(dir([dirnameSubj 'fw/AdotVolAvg.3pt']))
    delete([dirnameSubj 'fw/AdotVolAvg.3pt']);
end
if ~isempty(dir([dirnameSubj 'fw/.fw_all_start']))
    delete([dirnameSubj 'fw/.fw_all_start']);
end
if ~isempty(dir([dirnameSubj 'fw/.fw_all_stop']))
    delete([dirnameSubj 'fw/.fw_all_stop']);
end

if ~exist('mode','var')
    mode='interactive';
end

q=0;
status = 0;
while q~=1
    if strcmp(mode,'interactive')
    q = menu('Run MC application to generate output and click Done button when done.',...
             'Ran MC app manually. Now done', ...
             'MC app exists. Try running it.', ...
             'Cancel');
    else
        q = 2;
    end
         
    fwmodel = existMCOutput(fwmodel, probe, dirnameSubj);     
    if q==1 && all(fwmodel.errMCoutput(:)==3) && ~isempty(probe.ml)
        enableDisableMCoutputGraphics(fwmodel, 'on');
        menu('Now use the menu item ''Generate/Load Sensitivity Profile'' under the Forward Model menu to generate the sensitivity profile','OK');
        break;
    elseif q==2
        delete([dirnameSubj, '/fw/.fw_all*']);
        if ~isempty(findstr(computer(),'PCWIN'))
            status = system(['start ' dirnameSubj 'fw\fw_all.bat']);
        elseif ~isempty(findstr(computer(),'MAC'))
            system(['chmod 755 ' dirnameSubj 'fw/fw_all.csh']);
            status = system([dirnameSubj 'fw/fw_all.csh&']);
        elseif ~isempty(findstr(computer(),'GLNX'))
            system(['chmod 755 ' dirnameSubj 'fw/fw_all.csh']);
            status = system([dirnameSubj 'fw/fw_all.csh&']);
        else
            status = 1;
        end
        
        % If status is ok then MC application is running. 
        % Monitor it.
        if status==0
            
            count = 0;
            while ~all(fwmodel.errMCoutput(:)==3)
                if mod(count,5)==0
                    disp(sprintf('%d output files completed', length(find(fwmodel.errMCoutput(:)==3))));
                end
                fwmodel = existMCOutput(fwmodel, probe, dirnameSubj);
                if ~isMCRunning(fwmodel, dirnameSubj)
                    menu('Doesn''t look like MC application is executing. Please run it manually','OK');
                    enableDisableMCoutputGraphics(fwmodel, 'off');
                    break;
                end
                count=count+1;
            end
                
            if all(fwmodel.errMCoutput(:)==3)
                err = false;
                enableDisableMCoutputGraphics(fwmodel, 'on');
                if strcmp(mode,'interactive')
                	menu('Now use the menu item ''Generate/Load Sensitivity Profile'' under the Forward Model menu to generate the sensitivity profile','OK');
                    fwmodel.Adot = [];
                    fwmodel.Adot_scalp = [];
                end
            end

        else            

            menu('Sorry. Couldn''t execute MC application. Please run it manually','OK');
            if ~all(fwmodel.errMCoutput(:)==3)
                enableDisableMCoutputGraphics(fwmodel, 'off');
                q=0;
            end

        end
        break;
    elseif q==3
        enableDisableMCoutputGraphics(fwmodel, 'off');
        break;
    elseif ~all(fwmodel.errMCoutput(:)==3)
        q=0;
    end
end



% -----------------------------------------------------------------
function done = notifyWhenDone(dirnameSubj, mc_appname)

done = 0;
if ~strcmpi(mc_appname, 'tMCimg')
    return;
end
filesinp = dir([dirnameSubj './fw/*.inp']);
nFilesinp = length(filesinp);

h = waitbar(0,'Please wait...');
nFilesout = 0;
for ii=1:nFileinp
    waitbar(nFilesout/nFilesinp, h, sprintf('Completed %d of %d monte carlo output files.', nFilesout, nFilesinp));
    filesout = dir([dirnameSubj './fw/*.2pt']);
    nFilesout = length(filesout);
    if (nFilesinp==nFilesout) && existingFilesoutCompleted(filesout)
        done=1;
    end
    pause(2);
end
close(h);




% ------------------------------------------------------------------
function b = existingFilesoutCompleted(filesout)

b=1;
if isempty(fileout)
    return;
end
nbytes = filesout(1).bytes;
for ii=2:length(fileout)
   if filesout(1).bytes~=nbytes
       b=0;
       break;
   end
end

