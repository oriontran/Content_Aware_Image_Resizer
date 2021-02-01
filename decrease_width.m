function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)

%creating vertical energy map then finding the vertical seam
venergymap = cumulative_min_energy_map(energyImg,'VERTICAL');
verticalseam = find_vertical_seam(venergymap);

%from the energyImg we create a 2d vector where we will use it to reduce
%the color img
[r,c] = size(energyImg);
reducedColorImg = zeros(r,c-1,3);

for temp = 1:r
    reducedColorImg(temp,1:verticalseam(temp)-1,1) = im(temp,1:verticalseam(temp)-1,1);
    reducedColorImg(temp,verticalseam(temp):c-1,1) = im(temp,verticalseam(temp)+1:c,1);
    reducedColorImg(temp,1:verticalseam(temp)-1,2) = im(temp,1:verticalseam(temp)-1,2);
    reducedColorImg(temp,verticalseam(temp):c-1,2) = im(temp,verticalseam(temp)+1:c,2);
    reducedColorImg(temp,1:verticalseam(temp)-1,3) = im(temp,1:verticalseam(temp)-1,3);
    reducedColorImg(temp,verticalseam(temp):c-1,3) = im(temp,verticalseam(temp)+1:c,3);
end

reducedColorImg = uint8(reducedColorImg);
reducedEnergyImg = energy_img(reducedColorImg);
