clc
clear all
close all

%reading image
a = imread("bolt (1).jpeg");
Image=a;

%initial size 
[height, width,channels]=size(Image);
figure, imshow(Image);

%now resizing the image
Ri=imresize(Image,[200 200]);

%getting dimensions of the image
%w= width, h=height, cr is for number of colors
[h,w,cr]=size(Ri);

patchSize = 10;

num_of_verts = floor(h/patchSize);
num_of_horz = floor(w/patchSize);

% %splitting the image

patches = splitImage(Ri,patchSize,num_of_verts,num_of_horz,h,w);

% measuring patch color mean
[pcolor,showcolor] = meanColor(Ri,10);


%measuring Saliency from patch color to 20 size
salvals = sal_value(pcolor,20);



figure, imshow(salvals,[]);


%resizing the image to original height and width


sal_m = imresize(salvals,[height, width],'nearest');



 figure,imshow(sal_m,[]);


%% 2nd Assignment - 2nd Question


%rea is the columns you need to delete from the image, cannot exceed column
%length

 rea = 10;

 seamImg = a; %SeamImg is image container to perform


 res = double(sal_m); % putting saliency map of 1st question into a res container

 for i = 1:rea % looping till columns mentioned
     intensity = res; %intensity equas to res
     M = least_Seam(intensity); % finding the least possible seam from the saliency map
     seam = backTrack(M); %Back tracking to see seam passes through locations
     seamImg = CutSeam(seamImg,seam); %cutting of the unwanted seams
 end 

 figure, imshow(seamImg);

 