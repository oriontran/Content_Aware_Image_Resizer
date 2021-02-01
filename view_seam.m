function view_seam(im,seam,seamDirection)
[r,c,~] = size(im);
if strcmp(seamDirection, 'VERTICAL')
    x_mat = zeros(size(seam));
    for i=1:size(x_mat)
        x_mat(i) = i;
    end
    imagesc(im);
    hold on;
    plot(seam,x_mat,'r');
end
if strcmp(seamDirection, 'HORIZONTAL')
    imagesc(im);
    hold on;
    plot(seam,'r');
end
