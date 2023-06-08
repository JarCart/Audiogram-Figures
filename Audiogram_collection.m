close all; clear all; clc;
SubNum=input('\n        ***   Please input subject number:     ','s'); 

prompt = [{'250 Hz L','500 Hz L','1000 Hz L','2000 Hz L','4000 Hz L','6000 Hz L','8000 Hz L'},{'250 Hz R','500 Hz R','1000 Hz R','2000 Hz R','4000 Hz R','6000 Hz R','8000 Hz R'}];
      width = 12;
      height = 1;
      num_lines = [height, width];
      options.resize='on';
      options.WindowStyle='normal';
      defaults = {'','','','','','','','','','','','','',''};
      HL = inputdlg(prompt,'Audiogram', num_lines,defaults,options);
      HL = str2double(HL);
        audiogram(:,1) = [250,500,1000,2000,4000,6000,8000];
        audiogram(:,2) = [HL(1),HL(2),HL(3),HL(4),HL(5),HL(6),HL(7)]; %Left Ear
        audiogram(:,3) = [HL(8),HL(9),HL(10),HL(11),HL(12),HL(13),HL(14)]; %Right Ear
        save(['X:\experiments\e218 Voice Familiarity EEG\pilot files\Audiograms\',SubNum,'_audiogram.mat'],'audiogram'); %change to save location