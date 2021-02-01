function [] = seam_carving_decrease_width()
im = imread('inputSeamCarvingPrague.jpg');
im2 = imread('inputSeamCarvingMall.jpg');
energyImg = energy_img(im);
energyImg2 = energy_img(im2);
energyMap = cumulative_min_energy_map(energyImg,'VERTICAL');
energyMap2 = cumulative_min_energy_map(energyImg2,'VERTICAL');

for i=1:100
    [im,energyMap] = decrease_width(im,energyMap);
    [im2,energyMap2] = decrease_width(im2,energyMap2); 
end

imwrite(im, 'outputReduceWidthPrague.png');
imwrite(im2, 'outputReduceWidthMall.png');
