function [X,T,u1,u2,G1,G2] = global_thresh(I,t)
%Performs basic global thresholding algorithm in order to binarize an image
%   t: tolerance percentage represented as a decimal ie) for 10% tolerance set t = 0.1
%   I: Image matrix
%   X: Vector containing threshold value for each iteration
%   T: Threshold
%   G1: region containing pixels with value greater than the threhold
%   G2: region containing pixels with value less than or equal to the threshold
%   u1: mean of region G1
%   u2: mean of region G2


I = mat2gray(I); % pixel values range from [0,1]

%initial guess for T is random number in the interval [0,1]
T = rand;

%Seperate image into two regions
G1 = (I >T);%pixel value greater than thresholds
G2 = (I <= T);%pixel values less than or equal to threshold

%Calulcate the mean of regions G1 and G2
u1 = mean2(I(G1));
u2 = mean2(I(G2));

T0 = 0;
X = T;%Store initial threshold
while abs(T-T0) > (t*T)
    T0 = T; 
    %update threshold
    T = (u1 + u2)/2;
    %update regions
    G1 = (I >T); 
    G2 = (I <= T);
    %update mean values
    u1 = mean2(I(G1));
    u2 = mean2(I(G2));
    %Store threshold values
    X = [X T]; 
end
 
%Display Binarized Image
figure(1)
imshow(G1)
title('Binarized Image After Global Thresholding')

end

