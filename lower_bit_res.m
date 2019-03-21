function [y,x] = lower_bit_res(B, fname)
%This function will lower the bit resolution of the original image by 2^B

%convert image into matrix form
x = imread(fname);

%Perform pointwise division by 2^B 
b = 1/(2^B);
y = x .* b;

%Display images
figure(1)
subplot(1,2,1)
imshow(x,[])
title('Original Image')
subplot(1,2,2)
imshow(y,[])
title(['Image After Lowering Bit Resolution by 2^B for B = ', num2str(B)])

end

