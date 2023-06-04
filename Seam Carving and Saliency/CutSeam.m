function seamI=CutSeam(seamI,Seam)
[a, b, dim] = size(seamI); %dimension of the image
[A, B, ~] = size(Seam); %  size of the seam



if (a == A)
    for k=1:B              
        for i=1:dim             
            for j=1:a        
                if Seam(j,k)==1
                    ReImage(j,:,i)= seamI(j,2:b,i);
                elseif Seam(j,k)==b
                    ReImage(j,:,i)= seamI(j,1:b-1,i);
                else
                    ReImage(j,:,i)=[seamI(j,1:Seam(j,k)-1,i) seamI(j,Seam(j,k)+1:b,i)];
                end
            end
        end
        seamI=ReImage;
        clear ReImage
        [a, b, dim]=size(seamI);
    end
end