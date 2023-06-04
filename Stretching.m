
close all
clear

image = imread('apple_1_1_1.png');

[x, y, z] = size(image); % for RGB z = 3
disp(x)


red = image(:, :, 1);
green = image(:, :, 2);
blue = image(:, :, 3);


greyImage = .299*double(red) + .587*double(green) + .144*double(blue);
greyImage = uint8(greyImage);
% Display the Results
subplot(2,2,1), imshow(image), title('Original Image');
subplot(2,2,2), imshow(greyImage), title('Gray Scale Image');
subplot(2,2,3), MyHistogram(greyImage), title('Gray Scale Hist');





dk = 0.25*greyImage; 
Washedout_Image = 2.5*greyImage; 
figure % Plotting the results
subplot(2,2,1), imshow(dk), title('Darkened Image');
subplot(2,2,2), imshow(Washedout_Image), title('Brightened');
subplot(2,2,3), MyHistogram(dk), title('Histogram of Darkened Image');
subplot(2,2,4), MyHistogram(Washedout_Image), title('Histogram of brighten');

rangemin = min(dk(:));  % rmin (Min Valued Pixel)
rangemax = max(dk(:)); % rmax (Max Valued Pixel)
% Image Transformation Using the Contrast Stretching Equation
hist_str = (dk-rangemin).*(255/(rangemax-rangemin)); 
figure %Plotting the Results in Comparison
subplot(2,2,1), imshow(dk), title('Darkened Image');
subplot(2,2,2), imshow(hist_str), title('Hist Stretched Image Display');
subplot(2,2,3), MyHistogram(dk), title('Histogram of Darkened Image');
subplot(2,2,4), MyHistogram(hist_str), title('Histogram Stretched Image');
