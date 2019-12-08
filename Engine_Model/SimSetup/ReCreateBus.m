% To create all buses for the model call.
% 1) Enter ORU_GTF_eng.slx (make sure to create the MWS variable first with
% setup_everything.
% 2) remove bus outport from model (Sys_Out in top level of ORU_GTF_eng.slx)
% 3) select bus creator you wish to generate the bus objects for (marked as
% BusCreatorHere in ORU_GTF_eng.slx -> ORU_GTF_eng/Engine/EngData)
% 4) run the command below
% 5) put outport back into model
% 6) go into model to the bus editor.  Here there will be all the bus
% objects... export the bus objects to a .mat file. Overwrite the current
% mat file located in the SimSetup folder (Eng_Bus.mat).
%------------------------------------------------------------------------
% Automated Version
clear all
cd ..
% Generate MWS variable so system can be run, use the known cruise IC so the
% simulation does not run the SS solver to determine ICs (this is bad 
% because the bus files may not work).
Input.ICPoint = 'cruise';
run('setup_everything.m');
% separate MWS variable from bus objects.
save('MWS.mat','MWS');
% clear bus variables
clear all;
% Load MWS variable back into system
load('MWS.mat');

% Remove Eng_Out outport from ORU_GTF_eng, for some reason the auto bus
% creation script doesn't work with this block here. Then create bus
% objects and close system w/o saving.
% open system
open_system('ORU_GTF_eng');
try
    % delete the outport file that uses the buses... auto bus generator
    % doesn't like it.
    Temp.OffendingBlockString=['ORU_GTF_eng','/','Eng_Out'];
    delete_block(Temp.OffendingBlockString);
    
    % Create bus files based on final mux location within the file.
    Temp.MuxBlockString = ['ORU_GTF_eng','/','Engine','/','EngData','/','BusCreatorHere'];
    Simulink.Bus.createObject('ORU_GTF_eng', Temp.MuxBlockString,'ORU_GTF_Bus');
catch
    % something went wrong
    disp('bus objects not created')
end
% close w/o saving
bdclose('ORU_GTF_eng');

% Adjust file format to meet current ORU_GTF format. A .m was created ORU_GTF
% needs a .mat file.
% remove all workspace vars
clear all
if exist('ORU_GTF_Bus.m', 'file') == 2
    % create bus files
    run('ORU_GTF_Bus.m');
    % save the buf files as a .mat
    save('Eng_Bus.mat','-regexp','^(?!(ans)$).');
    % clean up files MWS and Buf file
    delete('ORU_GTF_Bus.m');
    if exist('MWS.mat', 'file') == 2
        delete('MWS.mat');
    end
    % move file to proper destination
    Temp.Dest = fullfile(pwd,'SimSetup');
    movefile('Eng_Bus.mat',Temp.Dest);
end
cd SimSetup
clear all;
disp('Bus generation complete, run ORU_GTF setup as normal to begin')




