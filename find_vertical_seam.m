function verticalSeam = find_vertical_seam(cumulativeEnergyMap)

%r is the number of rows
r = size(cumulativeEnergyMap, 1);
%c is the number of columns
c = size(cumulativeEnergyMap, 2);
%creating a verticalseam that is intialized as zeros with 1 column and the
%amount of rows as the cumulativeEnergyMap
verticalSeam = zeros(r,1);

%finding the column where the smallest value in the last row of cumulativeEnergyMap is
[min_row,min_col] = min(cumulativeEnergyMap(r,:)); 

%set last value of verticalSeam using the column number corresponding to
%cumulativeEnergyMap's last row's minimum value
verticalSeam(r) = min_col;

for h = r-1:-1:1
    %finding the column above the smallest value in the last row of cumulativeEnergyMap
    %using 8 connectedness
    if min_col == c
        first = cumulativeEnergyMap(h, min_col - 1);
        second = cumulativeEnergyMap(h, min_col);
        smallest = min(first,second);
        if(smallest == first)
	   min_col = min_col - 1;
        end
    elseif min_col == 1
        second = cumulativeEnergyMap(h, min_col);
        third = cumulativeEnergyMap(h,min_col+1);
        smallest = min(third,second);
        if(smallest == second)
        elseif(smallest == third)
            min_col = min_col + 1;
        end
    else
        first = cumulativeEnergyMap(h, min_col - 1);
        second = cumulativeEnergyMap(h, min_col);
        third = cumulativeEnergyMap(h,min_col+1);
        smallest = min(min(first,second),third);
        if(smallest == first)
            min_col = min_col - 1;
        elseif(smallest == second)
        else
            min_col = min_col + 1;
        end
    end
    
    %setting verticalSeam using the next min_col
    verticalSeam(h) = min_col;
end
