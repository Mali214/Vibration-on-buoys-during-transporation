                          %% Main matlab file that has all funcations and data
                          
%% Load the excel data from the folder
sep17=readtable('sep_17.xlsx');
sep04=readtable('sep_04.xlsx');
aug06=readtable('aug_06.xlsx');
july13=readtable('july_13.xlsx');
july08=readtable('july_08.xlsx');
july07=readtable('july_07.xlsx');
%% Ask user for which Day they want to see the data 
prompt1 = {'Day','month'}; 
dlgtitle1 = 'Acceleration data';
opts.Interpreter1 = 'tex';
answer1 = inputdlg(prompt1,dlgtitle1);
%% Determine the right date file and ask user for the requried range
if (str2double(answer1(1,1))==7) && (str2double(answer1(2,1))==7)
       
    sub=Day_analysis(july07,str2double(answer1(2,1)) ,str2double(answer1(1,1)))
    
elseif (str2double(answer1(1,1))==8) && (str2double(answer1(2,1))==7)
    
    sub=Day_analysis(july08,str2double(answer1(2,1)) ,str2double(answer1(1,1))) 

elseif (str2double(answer1(1,1))==13) && (str2double(answer1(2,1))==7)
    
    sub=Day_analysis(july13,str2double(answer1(2,1)) ,str2double(answer1(1,1))) 

elseif (str2double(answer1(1,1))==6) && (str2double(answer1(2,1))==8)
    
    sub=Day_analysis(aug06,str2double(answer1(2,1)) ,str2double(answer1(1,1)))

elseif (str2double(answer1(1,1))==4) && (str2double(answer1(2,1))==9)
    
    sub=Day_analysis(sep04,str2double(answer1(2,1)) ,str2double(answer1(1,1)))

elseif (str2double(answer1(1,1))==17) && (str2double(answer1(2,1))==9)
    
    sub=Day_analysis(sep17,str2double(answer1(2,1)) ,str2double(answer1(1,1)))    

    
else
    Massage=msgbox("There were no data recorded in that day");        

end
%% Ask user to if they want to show the Displacement graph of the selected range
opts1.Interpreter = 'tex';
opts1.Default = 'Don''t know';
answer2 = questdlg('Do you want show the Displacement graph of the selected range ?','Boundary Condition',...
                  'Yes','No','Don''t know',opts1)
 

              
    




if (answer2 == 'Yes') % if the user wants to see the data the selected range will be fillterted and integrated 
     
    filter_analysis(sub,0.3,3)
    filter_analysis(sub,0.25,3)
    filter_analysis(sub,0.2,3)
    filter_analysis(sub,0.15,3)
    filter_analysis(sub,0.1,3)
    filter_analysis(sub,0.05,3)
     
elseif(answer2 == 'No' ||answer2 == 'Don''t know')   
 
 Massage2=msgbox(""); 


end 
          
