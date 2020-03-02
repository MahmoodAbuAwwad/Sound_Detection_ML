clc
clear
training_files_yes = dir('C:\Users\Moham\OneDrive\Desktop\BZU -year3-sem1\DSP\assignmant 2\train\yes\*.wav');
testing_files_yes = dir('C:\Users\Moham\OneDrive\Desktop\BZU -year3-sem1\DSP\assignmant 2\test\yes\*.wav');
training_files_no = dir('C:\Users\Moham\OneDrive\Desktop\BZU -year3-sem1\DSP\assignmant 2\train\no\*.wav');
testing_files_no = dir('C:\Users\Moham\OneDrive\Desktop\BZU -year3-sem1\DSP\assignmant 2\test\no\*.wav');

% ------------ Training -----------------------------

% read the 'yes' training files and calculate the energy of them.
data_yes = [];
for i = 1:length(training_files_yes)
file_path = strcat(training_files_yes(i).folder,'\',training_files_yes(i).name);% get the file path with name
[y,fs] = audioread(file_path); % read the audio file

f = abs(fft(y));
index_f = 1:length(f); % from 1 to number of samples in y
index_f = index_f ./ length(f); % index will be from 0:1/length(f):1
index_f = index_f * fs;
index_f=index_f(1:floor(end/2));
f=f(1:floor(end/2));

energy_yes=sum(f.^2); % calculate the energy
data_yes = [data_yes energy_yes]; % append the energy with all other energies of the other files
end
energy_yes=mean(data_yes); % calculate the average energy
fprintf('The energy of yes is \n');
disp(energy_yes);

% read the 'no' training files and calculate the energy of them.
data_no = [];
for i = 1:length(training_files_no)
file_path = strcat(training_files_no(i).folder,'\',training_files_no(i).name);
[y,fs] = audioread(file_path);

f = abs(fft(y));
index_f = 1:length(f); % from 1 to number of samples in y
index_f = index_f ./ length(f); % index will be from 0:1/length(f):1
index_f = index_f * fs;
index_f=index_f(1:floor(end/2));
f=f(1:floor(end/2));

energy_no=sum(f .^2);
data_no = [data_no energy_no];
end
energy_no=mean(data_no);
fprintf('The energy of no is \n');
disp(energy_no);
% ------------ Evaluation -----------------------------

% read the 'yes' tesing files and calculate the energy of them.

for i = 1:length(testing_files_yes)
file_path = strcat(testing_files_yes(i).folder,'\',testing_files_yes(i).name);
[y,fs] = audioread(file_path);

f = abs(fft(y));
index_f = 1:length(f); % from 1 to number of samples in y
index_f = index_f ./ length(f); % index will be from 0:1/length(f):1
index_f = index_f * fs;
index_f=index_f(1:floor(end/2));
f=f(1:floor(end/2));

y_energy  = sum(f.^2);
 % test if the energy of this file is closer to YES or NO average energies
    if(abs(y_energy-energy_yes) < abs(y_energy-energy_no)) 
        fprintf('Test file [yes] #%d classified as yes ,E=%d\n',i,y_energy);
    else
        fprintf('Test file [yes] #%d classified as no E=%d\n',i,y_energy);
    end
end
fprintf('\n\n------------------------------\n\n')

for i = 1:length(testing_files_no)
file_path = strcat(testing_files_no(i).folder,'\',testing_files_no(i).name);
[y,fs] = audioread(file_path);

f = abs(fft(y));
index_f = 1:length(f); % from 1 to number of samples in y
index_f = index_f ./ length(f); % index will be from 0:1/length(f):1
index_f = index_f * fs;
index_f=index_f(1:floor(end/2));
f=f(1:floor(end/2));

y_energy  = sum(f.^2);

    if(abs(y_energy-energy_yes) < abs(y_energy-energy_no))
        fprintf('Test file [no] #%d classified as yes ,E=%d\n',i,y_energy);
    else
        fprintf('Test file [no] #%d classified as no ,E=%d\n',i,y_energy);
    end
end

