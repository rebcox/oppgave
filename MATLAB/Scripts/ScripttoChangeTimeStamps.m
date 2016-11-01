%First backup the marker array into a fake container
s1 = s; 
BackupS = s; % This is a back-up of s incase anything gets screwey
%Flag contains the 4 variables we use to traverse the array. Can also be
%used to calculate the number of times a flag is triggred
flag = [0 0 0 0];
N = length(s1); %total number of time samples
lasti =0; % due to some freak accident, everytime, the 2 or 3 marker is placed,
%there is a double event at a distance of less than 5 samples. We use this
%to eliminate the intereference of the double event in processing
for i = 1:N
    if (s1(i,4) == 1 && (i - lasti)>= 5)
         flag(4) = flag(4) + 1;
         lasti = i;
     elseif ((s1(i,3) == 1) && (i-lasti)>=5)
         flag(3) = flag(3) + 1;
         lasti = i;
     elseif ((s1(i,2) == 1) && (i-lasti)>=5)
         flag(2) = flag(2) + 1;
         lasti = i;
    end
    if ( flag(4) == 1 && s1(i,1) == 1)
            s1(i,1) = 4;
     elseif ( flag(3) == 1 && s1(i,1) == 1)
            s1(i,1) = 3;
    elseif ( flag(2) == 1 && s1(i,1) == 1)
            s1(i,1) = 2;
    end
end
%%

%clear out all drivel in columns 2 , 3 , 4
for i = 1:N
    s1(i,2) = 0;
    s1(i,3) = 0;
    s1(i,4) = 0;
end
%%
%%Now throw the numbers from s1(;,1) into markers with value =1 in the
%%diferent cases. Verify this in the Homer2 GUI
 for i =1:N
     if (s1(i,1)>1)
        temp = s1(i,1);
        s1(i,temp) = 1;
        s1(i,1) = 0;
     end
 end
%Put s1 back into s to complete the process.
s = s1;