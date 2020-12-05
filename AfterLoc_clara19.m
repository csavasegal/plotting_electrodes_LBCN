%addpath(genpath('/home/jplinux/Documents/MATLAB/EpiSurg-master'));
%addpath(genpath('/Users/serdarakkol/Documents/Code/EpiSurg-master'))

%These scripts have been added to work on CSS computer. It goes into
%applications, freesurfer, subject and the subjects folder has been copied
%there (as opposed to on the server) 

sub = input('Pt Name: ','s'); 
DepthOrGrid = input('(d)epth? (g)rid? (b)oth? ','s');

dykstraElecPjct(sub);
makeIniLocTxtFile(sub) %if Yang Wang
yangWangElecPjct(sub)
createIndivYeoMapping(sub)

switch DepthOrGrid
    case 'g' 
        plotMgridOnPial(sub,1);
    case 'd'        
        cfg=[]; cfg.printFigs=1;
        %plotMgridOnSlices_corrName(sub,cfg);
        %plotMgridOnSlices(sub,cfg)
        %plotMgridOnPial_depth(sub,1);
        plotMgridOnSlices_Clararename(sub,cfg);
        plotMgridOnPial(sub,1)
    case 'b'
        %plotMgridOnPial(sub,1);       
        cfg=[]; cfg.printFigs=1;
        %note: parvi script was previously run, try replacing it with
        plotMgridOnSlices_bothcases(sub,cfg);
        
        %parvi(sub,cfg);
end

close all;

%sub = 'S18_120B_EG'
%DepthOrGrid = 'g';