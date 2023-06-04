function seam = backTrack(Im)

[rows,cols] = size(Im);
for i=rows:-1:1
    if i==rows
        
        
        [~,j]=min(Im(rows,:));  
    else 
        if seam(i+1)==1
            vec=[Inf Im(i,seam(i+1)) Im(i,seam(i+1)+1)];
        elseif seam(i+1)==cols
            vec=[Im(i,seam(i+1)-1) Im(i,seam(i+1)) Inf];
        else
            vec=[Im(i,seam(i+1)-1) Im(i,seam(i+1)) Im(i,seam(i+1)+1)];
        end
        
        
        [~,Inx]=min(vec);
        IndexInc=Inx-2;
        j=seam(i+1)+IndexInc;
    end
    seam(i,1) = j;
end

end
