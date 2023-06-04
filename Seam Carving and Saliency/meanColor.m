function [pcolor,showcolor] = meanColor(image,patchSize)
pcolor = zeros([patchSize patchSize 3]);

for i=1:patchSize*2
   for j=1:patchSize*2
%        patchColor(i,j,:) = mean(mean(patches(1+patchSize*(i-1):patchSize*i,1+patchSize*(j-1):patchSize*j,:)));
        pcolor(i,j,:) = mean(mean(image(1+10*(i-1):10*i,1+10*(j-1):10*j,:)));
   end
end
showcolor = uint8(imresize(pcolor,[200 200]));
figure;
imshow(showcolor);

