function [] = seam_carving_decrease_height()
im = imread('inputSeamCarvingPrague.jpg');
im2 = imread('inputSeamCarvingMall.jpg');
energyImg = energy_img(im);
energyImg2 = energy_img(im2);
energyMap = cumulative_min_energy_map(energyImg,'VERTICAL');
energyMap2 = cumulative_min_energy_map(energyImg2,'VERTICAL');

for i=1:50
    [im,energyMap] = decrease_height(im,energyMap);
    [im2,energyMap2] = decrease_height(im2,energyMap2); 
end

imwrite(im, 'outputReduceHeightPrague.png');
imwrite(im2, 'outputReduceHeightMall.png');
