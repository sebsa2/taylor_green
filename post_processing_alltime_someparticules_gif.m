%plots the position as a function of time of some particles for two St
%numbers and exports a gif file

%loads the output files of simulation
UlowSt = load('outputs/output_U_St  10_P    500_Tf  7_dt 10alltime.txt');
VlowSt = load('outputs/output_V_St  10_P    500_Tf  7_dt 10alltime.txt');
XlowSt = load('outputs/output_X_St  10_P    500_Tf  7_dt 10alltime.txt');
YlowSt = load('outputs/output_Y_St  10_P    500_Tf  7_dt 10alltime.txt');
UhighSt = load('outputs/output_U_St 100_P    500_Tf  7_dt 10alltime.txt');
VhighSt = load('outputs/output_V_St 100_P    500_Tf  7_dt 10alltime.txt');
XhighSt = load('outputs/output_X_St 100_P    500_Tf  7_dt 10alltime.txt');
YhighSt = load('outputs/output_Y_St 100_P    500_Tf  7_dt 10alltime.txt');
[N,P] = size(UlowSt);

%plots the position evolution according to their initial position in four 
%spaces of the study space range
f=figure('Name','Evolution position particules St=0.01')
axis([0,1,0,1])
title('Evolution position particules St=0.01')
xlabel('X')
ylabel('Y')
filename = 'Evolution position particules St=0.01.gif'
for p=1:P      %sets animated lines for each studied particle
    if (XlowSt(1,p)<=0.5 & YlowSt(1,p)<=0.5)
        S(p).data = animatedline("Color","r","Linewidth",3);
        S(p).name = num2str(p);
    elseif (XlowSt(1,p)<=0.5 & YlowSt(1,p)>0.5)
        S(p).data = animatedline("Color","g","Linewidth",3);
        S(p).name = num2str(p);
    elseif (XlowSt(1,p)>0.5 & YlowSt(1,p)<=0.5)
        S(p).data = animatedline("Color","c","Linewidth",3);
        S(p).name = num2str(p);
    else
        S(p).data = animatedline("Color","m","Linewidth",3);
        S(p).name = num2str(p);
    end
end

for k=1:N      %updates the animated line for each particle
    for p=1:P
        x = mod(XlowSt(:,p),1);
        y = mod(YlowSt(:,p),1);
        addpoints(S(p).data,x(k),y(k));
        drawnow
        hold on
    end 
    %updates the GIF file
    frame = getframe(gcf); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    if k == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end

%plots the position evolution according to their initial position in four 
%spaces of the study space range for another Stokes number
g=figure('Name','Evolution position particules St=0.1')
axis([0,1,0,1])
title('Evolution position particules St=0.1')
xlabel('X')
ylabel('Y')
filename2 = 'Evolution position particules St=0.1.gif'
for p=1:P      %sets animated lines for each studied particle
    if (XhighSt(1,p)<=0.5 & YhighSt(1,p)<=0.5)
        H(p).data = animatedline("Color","r","Linewidth",3);
        H(p).name = num2str(p);
    elseif (XhighSt(1,p)<=0.5 & YhighSt(1,p)>0.5)
        H(p).data = animatedline("Color","g","Linewidth",3);
        H(p).name = num2str(p);
    elseif (XhighSt(1,p)>0.5 & YhighSt(1,p)<=0.5)
        H(p).data = animatedline("Color","c","Linewidth",3);
        H(p).name = num2str(p);
    else
        H(p).data = animatedline("Color","m","Linewidth",3);
        H(p).name = num2str(p);
    end
end
for k=1:N      %updates the animated line for each particle
    for p=1:P
        x = mod(XhighSt(:,p),1);
        y = mod(YhighSt(:,p),1);
        addpoints(H(p).data,x(k),y(k));
        drawnow
        hold on
    end 
    %updates the GIF file
    frame = getframe(gcf); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    if k == 1 
        imwrite(imind,cm,filename2,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename2,'gif','WriteMode','append'); 
    end 
end