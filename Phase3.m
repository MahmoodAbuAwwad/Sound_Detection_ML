
Srecord=audiorecorder(4400,24,1)

fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)

y = getaudiodata(Srecord);
y = y - mean(y);
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
training_files_yes = dir('F:\DSP Phase 1 + 3\train\yes\*.wav');
training_files_no = dir('F:\DSP Phase 1 + 3\train\no\*.wav');


% read the 'yes' training files and calculate the energy of them.
data_yes = [];
for i = 1:length(training_files_yes)
file_path = strcat(training_files_yes(i).folder,'\',training_files_yes(i).name);
[y,fs] = audioread(file_path);
%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);
ZCR_yes = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy];
data_yes = [data_yes ;ZCR_yes];
end
ZCR_yes=mean(data_yes);
fprintf('The ZCR of yes is \n');
disp(ZCR_yes);

% read the 'no' training files and calculate the energy of them.
data_no = [];
for i = 1:length(training_files_no)
file_path = strcat(training_files_no(i).folder,'\',training_files_no(i).name);
[y,fs] = audioread(file_path);

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_no1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_no2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_no3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

ZCR_no = [ZCR_no1 ZCR_no2 ZCR_no3 energy];

data_no = [data_no ;ZCR_no];
end
ZCR_no=mean(data_no);
fprintf('The ZCR of no is \n');
disp(ZCR_no);






[y,fs] = audioread('answer.wav');

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy]
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine'))
        fprintf('Test file classified as yes \n',i);
    else
        fprintf('Test file classified as no \n',i);
    end

    
