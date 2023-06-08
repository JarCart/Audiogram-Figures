close all; clear all; clc;

freqs = [250, 500, 1000, 2000, 4000, 6000, 8000]; %standard audiometric frequencies could add in 3k if needed/wanted

NH_subs = {'test1','test2'}; %puts in the names for normal hearing participants
HL_subs = {'sp3','sp4'}; %puts in the file names for hearing loss participants

%%
for i = 1:length(NH_subs) %For normal hearing participants
    load(['X:\experiments\e218 Voice Familiarity EEG\pilot files\Audiograms\',char(NH_subs(i)),'_audiogram.mat']); %Read in each file
    LE(i,:) = audiogram(:,2)'; %extract the second column and rotate it for the left ear
    RE(i,:) = audiogram(:,3)'; %extract the third column and rotate it for the right ear
end

mean_NH_audiogram_L = mean(LE); %gets the mean threshold for each frequency in the left ear
mean_NH_audiogram_R = mean(RE); %gets the mean threshold for each frequency in the right ear
se_NH_audiogram_L = std(LE)/sqrt(height(LE)); %gets the standard error of the mean for each frequency in the left ear
se_NH_audiogram_R = std(RE)/sqrt(height(RE)); %gets the standard error of the mean for each frequency in the right ear

ax = subplot(1,2,1); %Makes this the left subplot
plot(freqs,mean_NH_audiogram_L,'x-','MarkerSize',12,'LineWidth',2,'Color',[0 0 1]); hold on; errorbar(freqs,mean_NH_audiogram_L,se_NH_audiogram_L,'LineStyle','none','Linewidth',1,'color',[0 0 1]); %plots blue line with X markers and standard error
hold on; plot(freqs,mean_NH_audiogram_R,'o-','MarkerSize',12,'LineWidth',2,'Color',[1 0 0]); hold on; errorbar(freqs,mean_NH_audiogram_R,se_NH_audiogram_R,'LineStyle','none','Linewidth',1,'color',[1 0 0]); %plots red line with O markers and standard error
ylim([-10 100]); %sets the Y axis from -10 to 100
set(gca, 'YDir', 'reverse'); %puts -10 at the top of the graph
xlabel('Frequency (Hz'); ylabel('Hearing Level (dB HL)'); title('Mean Normal Hearing Audiogram'); %titles and label axes
set(ax, 'XScale','log','XLim',[200,10000],...
    'XTick',freqs,'XMinorTick','off') %scales the x axis to a log scaling
grid(ax,'on') %turns on the grid...
ax.MinorGridLineStyle = 'none'; %...but remove the minor lines

%%
%This section of the code does the same thing as the prior section, with
%minor noted differences
for i = 1:length(HL_subs) 
    load(['X:\experiments\e218 Voice Familiarity EEG\pilot files\Audiograms\',char(HL_subs(i)),'_audiogram.mat']);
    LE(i,:) = audiogram(:,2)';
    RE(i,:) = audiogram(:,3)';
end

mean_HL_audiogram_L = mean(LE);
mean_HL_audiogram_R = mean(RE);
se_HL_audiogram_L = std(LE)/sqrt(height(LE));
se_HL_audiogram_R = std(RE)/sqrt(height(RE));

ax2 = subplot(1,2,2); 
plot(freqs,mean_HL_audiogram_L,'x-','MarkerSize',12,'LineWidth',2,'Color',[0 0 1]); hold on; errorbar(freqs,mean_HL_audiogram_L,se_HL_audiogram_L,'LineStyle','none','Linewidth',1,'color',[0 0 1]);
hold on; plot(freqs,mean_HL_audiogram_R,'o-','MarkerSize',12,'LineWidth',2,'Color',[1 0 0]); hold on; errorbar(freqs,mean_HL_audiogram_R,se_HL_audiogram_R,'LineStyle','none','Linewidth',1,'color',[1 0 0]);
ylim([-10 100]);
set(gca, 'YDir', 'reverse'); 
xlabel('Frequency (Hz'); ylabel('Hearing Level (dB HL)'); title('Mean Hearing Loss Audiogram');
set(ax2, 'XScale','log','XLim',[200,10000],...
    'XTick',freqs,'XMinorTick','off')
grid(ax2,'on')
ax2.MinorGridLineStyle = 'none';