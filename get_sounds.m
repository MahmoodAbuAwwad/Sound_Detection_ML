clc
clear
Srecord=audiorecorder(4400,24,1)
for i=1:31
fprintf('Start speaking for audio %d\n',i)
recordblocking(Srecord, 2); % record 2 seconds
fprintf('Audio #%d ended\n',i)

%play(Srecord)
y = getaudiodata(Srecord);
y = y - mean(y);
file_name = sprintf('Recorded/yes%d.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);

end