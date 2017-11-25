%plots the density matrix of the study space at some times during the
%experiment and create a GIF file

%loads the output density file of simulation
raw_density = 'output_density_matrix_St  10_P1000000_Tf  7_dt 10.txt'

%get the number of images from the size of the raw matrix
D = importdata(raw_density);
D=D.';
[n,p] = size(D);
nimages = n/p;

%for each date, creates a density matrix and puts it into a 3D matrix
for i=1:nimages
    M(i,1:p,1:p)=D((i-1)*p+1:i*p,1:p);
end

%creates a GIF file with the plots of each density matrix
f=figure('Name','Evolution of the density in the study space range')
title('Evolution of the density in the study space range')
xlabel('X')
ylabel('Y')
filename = 'Evolution of the density.gif'

for j=1:nimages
    surf(reshape(M(1:p,1:p,j),[p,p]),'edgecolor','none')
    axis tight
    view(2)
    caxis([min(min(D)) max(max(D))])
    title('Evolution of the density in the study space range');
    xlabel('X (mm)');
    ylabel('Y (mm)');
    colorbar;
    
    frame = getframe(gcf); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    if j == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end
