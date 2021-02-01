function energyImg = energy_img(im)
gray_im = rgb2gray(im);
intgray_im8 = uint8(gray_im);
dy_filt = fspecial('sobel');
dx_filt = dy_filt';
dx_mat = imfilter(double(intgray_im8), dx_filt);
dy_mat = imfilter(double(intgray_im8), dy_filt);
energyImg = dy_mat .^ 2 + dx_mat .^ 2;
energyImg = sqrt(energyImg);

