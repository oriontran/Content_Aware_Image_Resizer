function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)

%r is the number of rows
r = size(cumulativeEnergyMap, 1);
%c is the number of columns
c = size(cumulativeEnergyMap, 2);
%creating a horizontalSeam that is intialized as zeros with 1 row and the
%amount of columns as the cumulativeEnergyMap
horizontalSeam = zeros(r,1);

%finding the row where the smallest value in the last column of cumulativeEnergyMap is
[min_row,min_col] = find(cumulativeEnergyMap == min(cumulativeEnergyMap(:,c)),1,'last'); 

%set last value of horizontalSeam using the column number corresponding to
%cumulativeEnergyMap's last row's minimum value
horizontalSeam(c) = min_row;

for h = c-1:-1:1
    %finding the row to the left of the smallest value in the last column of cumulativeEnergyMap
    %using 8 connectedness
    if min_row == r
        %min_row = find(cumulativeEnergyMap(:,h) == min(cumulativeEnergyMap(r-1,h), cumulativeEnergyMap(r,h)),1,'last');
        first = cumulativeEnergyMap(min_row - 1,h);
        second = cumulativeEnergyMap(min_row, h);
        smallest = min(first,second);
        if(smallest == first)
            min_row = min_row - 1;
        end
    elseif min_row == 1
        %min_row = find(cumulativeEnergyMap(:,h) == min(cumulativeEnergyMap(1,h), cumulativeEnergyMap(2,h)),1,'last');
        second = cumulativeEnergyMap(min_row, h);
        third = cumulativeEnergyMap(min_row + 1, h);
        smallest = min(second,third);
        if(smallest == second)
        else
            min_row = min_row + 1;
        end
    else
        first = cumulativeEnergyMap(min_row - 1,h);
        second = cumulativeEnergyMap(min_row, h);
        third = cumulativeEnergyMap(min_row + 1, h);
        smallest = min(min(first,second),third);
        if(smallest == first)
            min_row = min_row - 1;
        elseif(smallest == second)
        else
            min_row = min_row + 1;
        end
    end
    
    %setting horizontalSeam using the next min_row
    horizontalSeam(h) = min_row;
end
