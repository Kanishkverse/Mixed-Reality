
function [value, grayValue] = MyHistogram(grayImage)
[rows, columns, ~] = size(grayImage);
%value is zero matrix of 256
value = zeros(1, 256);
for col = 1 : columns % 1 to size of coloums
	for row = 1 : rows % 1 to size of rows

		% 
		grayLevel = grayImage(row, col);
		
		value(grayLevel+ 1) = value(grayLevel+1) + 1;
	end
end

grayValue = 0 : 255;

bar(grayValue, value, 'BarWidth', 1, 'FaceColor', 'black');
xlabel('Gray Level', 'FontSize', 10);
ylabel('Pixel Count', 'FontSize', 10);
title('Histogram', 'FontSize', 10);
grid on;
end