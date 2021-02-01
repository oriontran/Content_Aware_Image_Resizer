
girl = imread('IU.jpg');
city = imread('city.jpg');
east = imread('east.jpg');
im = imread('IU.jpg');
im2 = imread('city.jpg');
im3 = imread('east.jpg');
energyImg = energy_img(im);
energyImg2 = energy_img(im2);
energyImg3 = energy_img(im3);
energyMap = cumulative_min_energy_map(energyImg,'VERTICAL');
energyMap2 = cumulative_min_energy_map(energyImg2,'VERTICAL');
energyMap3 = cumulative_min_energy_map(energyImg3,'VERTICAL');



for i=1:100
    [im,energyMap] = decrease_width(im,energyMap);
    [im2,energyMap2] = decrease_width(im2,energyMap2); 
    [im3,energyMap3] = decrease_width(im3,energyMap3); 
  
end

energyImg = energy_img(im);
energyImg2 = energy_img(im2);
energyImg3 = energy_img(im3);
energyMap = cumulative_min_energy_map(energyImg,'HORIZONTAL');
energyMap2 = cumulative_min_energy_map(energyImg2,'HORIZONTAL');
energyMap3 = cumulative_min_energy_map(energyImg3,'HORIZONTAL');

for i=1:100
    [im,energyMap] = decrease_height(im,energyMap);
    [im2,energyMap2] = decrease_height(im2,energyMap2); 
    [im3,energyMap3] = decrease_height(im3,energyMap3); 
  
end

imwrite(im, 'outputIU.png');
imwrite(im2, 'outputcity.png');
imwrite(im3, 'outputeast.png');


subplot(3,3,1)
imshow('IU.jpg');
title('Original');

subplot(3,3,2)
imshow(im);
title('Altered');

subplot(3,3,3)
resized1 = imresize(girl,[59,218]);
imshow(resized1);
title('imresize');

subplot(3,3,4)
imshow('city.jpg');
title('Original');

subplot(3,3,5)
imshow(im2);
title('Altered');

subplot(3,3,6)
resized2 = imresize(city,[68,199]);
imshow(resized2);
title('imresize');

subplot(3,3,7)
imshow('east.jpg');
title('Original');

subplot(3,3,8)
imshow(im3);
title('Altered');

subplot(3,3,9)
resized3 = imresize(east,[83,175]);
imshow(resized3);
title('imresize');



