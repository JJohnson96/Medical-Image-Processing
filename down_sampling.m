function [y1,y2,x,a] = down_sampling(N,fname1,fname2)
%This function performs downsampling of input images at variable rate N
% The input to this function is the down-sampling rate (N) and original images

%convert images into matrix form
x = imread(fname1);
a = imread(fname2);

%calculate number of rows and columns for each matrix
[x_rows,x_cols] = size(x); 
[a_rows,a_cols] = size(a);

%Iterate through each matrix and perform downsampling
y1 = x(1:N:x_rows,1:N:x_cols);
y2 = a(1:N:a_rows, 1:N:a_cols);

%Display input and output images side-by-side
figure(1)
subplot(1,2,1)
imshow(x,[])
title('Original Image')
subplot(1,2,2)
imshow(y1,[])
title(['Image After Downsampling with N = ', num2str(N)])


figure(2)
subplot(1,2,1) 
imshow(a,[])
title('Original Image')
subplot (1,2,2) 
imshow(y2,[])
title(['Image After Downsampling with N = ', num2str(N)])
end

