function [patches] = splitImage(Image,BlockSize,Verts,Horz,h,w)
Image_Blocks = struct('Blocks',[]);
Index = 1;

for Row = 1: +BlockSize: Verts*BlockSize
    for Column = 1: +BlockSize: Horz*BlockSize
        
    Row_End = Row + BlockSize - 1;
    Column_End = Column + BlockSize - 1;
        
    if Row_End > h
       Row_End = h;
    end
    
    if Column_End > w
       Column_End = w;
    end
    
    patches = Image(Row:Row_End,Column:Column_End,:);
    
    %Storing blocks/tiles in structure for later use%
    Image_Blocks(Index).Blocks = patches;
    subplot(Verts,Horz,Index); imshow(patches);
    Index = Index + 1;
    
    end  
end

