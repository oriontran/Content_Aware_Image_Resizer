function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)

%creating horizontal energy map then finding the horizontal seam
henergymap = cumulative_min_energy_map(energyImg,'HORIZONTAL');
horizontalseam = find_horizontal_seam(henergymap);

%creating a 2d vector from input energyImg
[r,c] = size(energyImg);
reducedColorImg = zeros(r-1, c, 3);

%looping from first row to last row. Starting from first column to last
%column. Setting the reduced color img equal to the image after the
%horizontal seam is removed.
for temp = 1:c
    reducedColorImg(1:horizontalseam(temp)-1,temp,1) = im(1:horizontalseam(temp)-1, temp,1);
    reducedColorImg(horizontalseam(temp):r-1,temp,1) = im(horizontalseam(temp)+1:r,temp,1);
    reducedColorImg(1:horizontalseam(temp)-1,temp,2) = im(1:horizontalseam(temp)-1, temp,2);
    reducedColorImg(horizontalseam(temp):r-1,temp,2) = im(horizontalseam(temp)+1:r,temp,2); 
    reducedColorImg(1:horizontalseam(temp)-1,temp,3) = im(1:horizontalseam(temp)-1, temp,3);
    reducedColorImg(horizontalseam(temp):r-1,temp,3) = im(horizontalseam(temp)+1:r,temp,3);
end

%reduced energy img is produced after horizontal seams are removed same
%with color img.
reducedColorImg = uint8(reducedColorImg);
reducedEnergyImg = energy_img(reducedColorImg);