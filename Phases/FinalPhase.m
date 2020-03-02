%Reading characters Images
images=imread('images.jpg');
image1=imread('image1.png');
image2=imread('image2.png');
image3=imread('image3.png');
image4=imread('image4.png');
image5=imread('image5.png');
image6=imread('image6.png');
image7=imread('image7.png');
image8=imread('image8.png');
image9=imread('image9.png');
image10=imread('image10.png');
image11=imread('image11.png');
image12=imread('image12.png');

%Defining Structures
%|-----------------------------|
%| Male Characters Information |
%|-----------------------------|
icon(1).Gender='male';
icon(1).Hair='Black';
icon(1).Hat='No'; 
icon(1).Glasses='Yes';
icon(1).Clothes='Suit';  
icon(1).Profession='Lawyer';
icon(1).Image='image1.png';

%--------------------------------------------------------------------------

icon(2).Gender='male';
icon(2).Hair='Black';
icon(2).Hat='Yes';
icon(2).Glasses='No'; 
icon(2).Clothes='White Coat';
icon(2).Profession='Chef';
icon(2).Image='image2.png';

%--------------------------------------------------------------------------

icon(3).Gender='male';
icon(3).Hair='Brown';
icon(3).Hat='No';
icon(3).Glasses='No';
icon(3).Clothes='Blue Scrup Uniform';
icon(3).Profession='Doctor';
icon(3).Image='image3.png';

%--------------------------------------------------------------------------

icon(4).Gender='male';
icon(4).Hair='Brown';
icon(4).Hat='Yes';
icon(4).Glasses='No';
icon(4).Clothes='Blue Overalls';
icon(4).Profession='Farmer/Gardener';
icon(4).Image='image4.png';

%--------------------------------------------------------------------------

icon(5).Gender='male';
icon(5).Hair='Black';
icon(5).Hat='No';
icon(5).Glasses='No'; 
icon(5).Clothes='Sport Clothes';
icon(5).Profession='Basketball player';
icon(5).Image='image5.png';

%--------------------------------------------------------------------------

icon(6).Gender='male';
icon(6).Hair='Black';
icon(6).Hat='Yes';
icon(6).Glasses='No'; 
icon(6).Clothes='Red bunker gear';
icon(6).Profession='Fire-fighter';
icon(6).Image='image6.png';

%==========================================================================

%|-------------------------------|
%| Female Characters Information |
%|-------------------------------|
icon(7).Gender='female';
icon(7).Hair='Black';
icon(7).Hat='Yes';
icon(7).Glasses='No';
icon(7).Clothes='Scanta Clause Uniform';
icon(7).Profession='Christmas Lady';
icon(7).Image='image7.png';

%--------------------------------------------------------------------------

icon(8).Gender='female';
icon(8).Hair='Brown';
icon(8).Hat='Yes'
icon(8).Glasses='No';
icon(8).Clothes='Dark Blue Shirt and a Black Tie';
icon(8).Profession='Police Officer';
icon(8).Image='image8.png';

%--------------------------------------------------------------------------

icon(9).Gender='female';
icon(9).Hair='Brown';
icon(9).Hat='Yes';
icon(9).Glasses='No';
icon(9).Clothes='WhiteCoat';
icon(9).Profession='Chef';
icon(9).Image='image9.png';

%--------------------------------------------------------------------------

icon(10).Gender='female';
icon(10).Hair='Brown';
icon(10).Hat='No';
icon(10).Glasses='No';
icon(10).Clothes='Red Skirt';
icon(10).Profession='Waitress';
icon(10).Image='image10.png';

%--------------------------------------------------------------------------

icon(11).Gender='female';
icon(11).Hair='Grey';
icon(11).Hat='No';
icon(11).Glasses='No';
icon(11).Clothes='Black Skirt';
icon(11).Profession='Laywer';
icon(11).Image='image11.png';

%--------------------------------------------------------------------------

icon(12).Gender='female';
icon(12).Hair='Red';
icon(12).Hat='Yes'; 
icon(12).Glasses='Yes'; 
icon(12).Clothes='White Coat';
icon(12).Profession='Nurse';
icon(12).Image='image12.png';
 
%=========================================================================

%|------------------------------------------------------------------|
%| At first a picture with the available characters will be         |
%| displayed for the user, he/she must pick one character           |
%|------------------------------------------------------------------|


imshow(images);
% pause(10);


%=========================================================================

%|--------------------------------|
%| Converting text to speech      |
%|--------------------------------|

NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;

%=========================================================================



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% For Training Sounds %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

guess=[];
guess2=[];

q1 = 'Is this person gender is male?';
Speak(obj, q1); % text to speech!
k=1;
q1 = [q1 '\n'];

Srecord=audiorecorder(4400,24,1);


%notify to speak
fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)
y = getaudiodata(Srecord);
y = y - mean(y);

%%reading the answer %%%
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);
[y,fs] = audioread('answer.wav');
%%%%%%%%%%%%%%%%%%%%

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy]
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine')) %Yes
                fprintf('Test file classified as yes \n',i);
      for i = 1:length(icon)
            if (strcmp(icon(i).Gender,'female') == 0)
              guess(k) = i;
              k = k+1;
            end
        end
    

     
    else %No
            fprintf('Test file classified as no \n',i);

          for i = 1:length(icon)
                if (strcmp(icon(i).Gender,'male') == 0)
                    guess(k) = i;
                    k = k+1;
                end
            end
    end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 q2 = 'Is this person is wearing glasses?';
 Speak(obj, q2);
 q2 = [q2 '\n'];
 k=1 ;
 j=1;
 
 Srecord=audiorecorder(4400,24,1);


%notify to speak
fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)
y = getaudiodata(Srecord);
y = y - mean(y);

%%reading the answer %%%
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);
[y,fs] = audioread('answer.wav');
%%%%%%%%%%%%%%%%%%%%

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine')) %Yes
                 fprintf('Test file classified as yes \n',i);

        for j= 1:length(guess)
                    index=guess(j)        ;        
                    answer=icon(index).Glasses;
                    if (strcmp(answer,'Yes')~=0)
                     guess2(k)= guess(j);
                     k=k+1;
                    end

               end    
    else %No
            fprintf('Test file classified as no \n',i);

            for j= 1:length(guess)

                index=guess(j)      ;           
                answer=icon(index).Glasses; 
                if (strcmp(answer,'No')~=0)
                    guess2(k)= guess(j);
                    k=k+1;
                end

            end  
    end
    
    
 if (length(guess2)==1)     %if intersection array contain one element then Done
      imshow(icon(guess2(1)).Image);
      return;
 end
 guess=[];          %clear the array to re-use 
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 q3 = 'Is this person is wearing A Hat?';
 Speak(obj, q3);
 q3 = [q3 '\n']; 
 k=1 ;
 j=1;
 
 
 Srecord=audiorecorder(4400,24,1);


%notify to speak
fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)
y = getaudiodata(Srecord);
y = y - mean(y);

%%reading the answer %%%
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);
[y,fs] = audioread('answer.wav');
%%%%%%%%%%%%%%%%%%%%

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine')) %Yes
            fprintf('Test file classified as yes \n',i);
             for j= 1:length(guess2)
                 index=guess2(j)    ;          
                 answer=icon(index).Hat;
                  if (strcmp(answer,'Yes')~=0)
                      guess(k)= guess2(j);
                     k=k+1;
                  end

             end 

          
    else %No
            fprintf('Test file classified as no \n',i);
            for j= 1:length(guess2)

                index=guess2(j)    ;              
                answer=icon(index).Hat; 
                if (strcmp(answer,'No')~=0)
                    guess(k)= guess2(j);
                    k=k+1;
                end

             end 
            
    end
    
     if (length(guess)==1)     %if intersection array contain one element then Done
          imshow(icon(guess(1)).Image);
          return;
     end
 guess2=[];          %clear the array to re-use 
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 q4 = 'Does this person have black hair ?';
 Speak(obj, q4);
 q4 = [q4 '\n'];
 k=1 ;
 j=1;
 
 
 Srecord=audiorecorder(4400,24,1);


%notify to speak
fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)
y = getaudiodata(Srecord);
y = y - mean(y);

%%reading the answer %%%
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);
[y,fs] = audioread('answer.wav');
%%%%%%%%%%%%%%%%%%%%

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine')) %Yes
            fprintf('Test file classified as yes \n',i);
         
            for j= 1:length(guess)
                index=guess(j)      ;         
                answer=icon(index).Hair;
                    if (strcmp(answer,'Black')~=0)
                        guess2(k)= guess(j);
                        k=k+1;
                    end

            end
          
    else %No
            fprintf('Test file classified as no \n',i);
            for j= 1:length(guess)
   
        index=guess(j)       ;           
        answer=icon(index).Hair ;
        if (strcmp(answer,'Red')~=0)
            guess2(k)= guess(j);
            k=k+1;
        end
        if (strcmp(answer,'Grey')~=0)
            guess2(k)= guess(j);
            k=k+1;
        end
        if (strcmp(answer,'Brown')~=0)
            guess2(k)= guess(j);
            k=k+1;
        end
         
      end  
          
            
    end
    if (length(guess2)==1)     %if intersection array contain one element then Done
      imshow(icon(guess2(1)).Image);
      return;
 end
 guess=[];          %clear the array to re-use 
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 string1 = 'Is this person a ';
 string2 = icon(guess2(1)).Profession;
 q5 = [string1 string2 '?'];
 Speak(obj, q5);
 q5 = [q5 '\n'];
 k=1 ;
 j=1;
 
 
 Srecord=audiorecorder(4400,24,1);


%notify to speak
fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)
y = getaudiodata(Srecord);
y = y - mean(y);

%%reading the answer %%%
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);
[y,fs] = audioread('answer.wav');
%%%%%%%%%%%%%%%%%%%%

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine')) %Yes
        fprintf('Test file classified as yes \n',i);

            for j= 1:length(guess2)
                index=guess2(j)     ;         
                answer=icon(index).Profession;
              if (strcmp(answer,icon(guess2(1)).Profession)~=0)
                guess(k)= guess2(j);
                k=k+1;
             end
         
     end
          
    else %No
            fprintf('Test file classified as no \n',i);
             for j= 1:length(guess2)

                index=guess2(j)   ;             
                answer=icon(index).Profession; 
                if (strcmp(answer,icon(guess2(1)).Profession)==0)
                    guess(k)= guess2(j);
                    k=k+1;
                end


            end
       
    end
        if (length(guess)==1)     %if intersection array contain one element then Done
            imshow(icon(guess(1)).Image);
            return;
        end
        guess2=[];          %clear the array to re-use 

 

      
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 string1 = 'Is this person Wearing ';
 string2 = icon(guess(1)).Clothes;
 q6 = [string1 string2 '?'];
 Speak(obj, q6);
 q6 = [q6 '\n']; 
 k=1 ;
 j=1;
 
 
 Srecord=audiorecorder(4400,24,1);


%notify to speak
fprintf('Start speaking for audio \n',i)
recordblocking(Srecord, 3); % record 2 seconds
fprintf('Audio #%d ended\n',i)
y = getaudiodata(Srecord);
y = y - mean(y);

%%reading the answer %%%
file_name = sprintf('answer.wav',i);
audiowrite(file_name, y, Srecord.SampleRate);
[y,fs] = audioread('answer.wav');
%%%%%%%%%%%%%%%%%%%%

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_yes1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_yes2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_yes3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_yes1 ZCR_yes2 ZCR_yes3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_yes],'cosine') < pdist([y_ZCR;ZCR_no],'cosine')) %Yes
        fprintf('Test file classified as yes \n',i);

            for j= 1:length(guess)
                index=guess(j)    ;          
                answer=icon(index).Clothes;
                if (strcmp(answer,icon(guess(1)).Clothes)~=0)
                    guess2(k)= guess(j);
                    k=k+1;
                end

            end 
          
    else %No
            fprintf('Test file classified as no \n',i);
            for j= 1:length(guess)

                index=guess(j) ;                   
                answer=icon(index).Clothes ;
            if (strcmp(answer,icon(guess(1)).Clothes)==0)
             guess2(k)= guess(j);
             k=k+1;
            end

            end
       
    end
    
     imshow(icon(guess2(1)).Image);

    guess=[];          %clear the arrays
    guess2=[];

 
 

    
  