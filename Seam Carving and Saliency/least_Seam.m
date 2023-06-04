function least_seam = least_Seam(E)

sz = size(E); % Get the size of the Energy map.

least_seam = zeros(sz(1),sz(2));
least_seam(1,:) = E(1,:);

for i=2:sz(1)
    for j=1:sz(2)
        % Boundary conditions
        if j-1<1
            least_seam(i,j)= E(i,j)+min([least_seam(i-1,j),least_seam(i-1,j+1)]);
        elseif j+1>sz(2)
            least_seam(i,j)= E(i,j)+min([least_seam(i-1,j-1),least_seam(i-1,j)]);
        else
            least_seam(i,j)= E(i,j)+min([least_seam(i-1,j-1),least_seam(i-1,j),least_seam(i-1,j+1)]);
        end
    end
end