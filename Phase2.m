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
pause(10);


%|--------------------------------|
%| Converting text to speech      |
%|--------------------------------|

NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;

%=========================================================================

%|------------------------------------------------------------------|
%| In this section of code the user will be asked Yes/No Questions  |
%| starting with the gender since it can eliminate a huge number of |
%| charaters then at the end only one picture will be dislayed      |
%| which must be what the user has picked from the beginning        |
%|------------------------------------------------------------------|

q1 = 'Is this person gender is male?'; %Yes as defualt ans
Speak(obj, q1); % text to speech!
k=1;
guess=[];
guess2=[];
q1 = [q1 '\n'];
str=input(q1,'s');
%  if isempty(str)==0 || str ~= 'Y' || str ~= 'N'
%       str='Y';
%  end
 if (strcmp(str,'Y'))
     
     for i = 1:length(icon)
         if (strcmp(icon(i).Gender,'female') == 0)
             guess(k) = i;
             k = k+1;
         end
     end
 end 
 if (strcmp(str,'N'))
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
 q2 = 'Is this person is wearing glasses?';
 Speak(obj, q2);
 q2 = [q2 '\n'];
 str=input(q2,'s');
 k=1 ;
 j=1;
 if(strcmp(str,'Y')~=0)
     for j= 1:length(guess)
       index=guess(j)        ;        
         answer=icon(index).Glasses;
        if (strcmp(answer,'Yes')~=0)
            guess2(k)= guess(j);
            k=k+1;
        end
         
     end  
 end
 if(strcmp(str,'N')~=0)
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
 
 q3 = 'Is this person is wearing A Hat?';
 Speak(obj, q3);
 q3 = [q3 '\n'];
 str=input(q3,'s');
 
 k=1 ;
 j=1;
 if(strcmp(str,'Y')~=0)
     for j= 1:length(guess2)
       index=guess2(j)    ;          
       answer=icon(index).Hat;
        if (strcmp(answer,'Yes')~=0)
            guess(k)= guess2(j);
            k=k+1;
        end
         
     end  
 end
 
  if(strcmp(str,'N')~=0)
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
 
 q4 = 'Does this person have black hair ?';
 Speak(obj, q4);
 q4 = [q4 '\n'];
 str=input(q4,'s');
 k=1 ;
 j=1;
 if(strcmp(str,'Y')~=0)
     for j= 1:length(guess)
       index=guess(j)      ;         
         answer=icon(index).Hair;
        if (strcmp(answer,'Black')~=0)
            guess2(k)= guess(j);
            k=k+1;
        end
         
     end  
 end
 if(strcmp(str,'N')~=0)
    
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
 

 
 string1 = 'Is this person a ';
 string2 = icon(guess2(1)).Profession;
 q5 = [string1 string2 '?'];
 Speak(obj, q5);
 q5 = [q5 '\n'];
 str=input(q5,'s');
 
 k=1 ;
 j=1;
 if(strcmp(str,'Y')~=0)
     for j= 1:length(guess2)
       index=guess2(j)     ;         
       answer=icon(index).Profession;
        if (strcmp(answer,icon(guess2(1)).Profession)~=0)
            guess(k)= guess2(j);
            k=k+1;
        end
         
     end  
 end
 
  if(strcmp(str,'N')~=0)
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
 str=input(q6,'s');
 
 k=1 ;
 j=1;
 if(strcmp(str,'Y')~=0)
     for j= 1:length(guess)
       index=guess(j)    ;          
       answer=icon(index).Clothes;
        if (strcmp(answer,icon(guess(1)).Clothes)~=0)
            guess2(k)= guess(j);
            k=k+1;
        end
         
     end  
 end
 
  if(strcmp(str,'N')~=0)
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

 guess=[];          %clear the array to re-use 

