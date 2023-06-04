clc;
clear all;
close all;

depth1 = imread("apple_1_1_160_depth.png");
depth = depth1;
subplot(3,3,1), imshow(depth);
%b = DepthKernelTerm(depth,5,2);
%b = double(b);
color1 = imread("apple_1_1_160.png");
color = color1;
subplot(3,3,2), imshow(color);
height = size(color,1);
width = size(color,2);
 
Interval = 0.6;             % Down-sample factor
view_3d = 0;

BF_sigma_w = 5;      % range sigma
BF_sigma_c = 5;	 % spatial sigma
BF_window = 10;	   	 % window size - radius
BF_method = 1;	

SamplePoints = zeros(height,width);
StartPoint = Interval; % It should be set to 'Interval' for the Joint Bilateral Upsample model to work
SamplePoints(StartPoint:Interval:end,StartPoint:Interval:end) = 1;                 
SampleDepth = SamplePoints.*double(depth);
subplot(3,3,3),imshow(SampleDepth);

Result = BilateralFilter1(color,SampleDepth,...
                                        BF_sigma_w,BF_sigma_c,BF_window);
result = imcomplement(Result);
 colormap(jet);
subplot(3,3,4),imshow(result,[]);
imwrite(result,"apple_1_1_1_denoised1.png");
