%plots the initial and final position of all the particles for two St
%numbers

%loads the output files of simulation
UlowSt = load('outputs/output_U_St  10_P    500_Tf  7_dt 10sometime.txt');
VlowSt = load('outputs/output_V_St  10_P    500_Tf  7_dt 10sometime.txt');
XlowSt = load('outputs/output_X_St  10_P    500_Tf  7_dt 10sometime.txt');
YlowSt = load('outputs/output_Y_St  10_P    500_Tf  7_dt 10sometime.txt');
UhighSt = load('outputs/output_U_St 100_P    500_Tf  7_dt 10sometime.txt');
VhighSt = load('outputs/output_V_St 100_P    500_Tf  7_dt 10sometime.txt');
XhighSt = load('outputs/output_X_St 100_P    500_Tf  7_dt 10sometime.txt');
YhighSt = load('outputs/output_Y_St 100_P    500_Tf  7_dt 10sometime.txt');
[N,P] = size(UlowSt);

%plots the initial position according to their initial position in four 
%spaces of the study space range
figure('Name','Position initiale particules St=0.01')
for p=1:P
    if (XlowSt(1,p)<=0.5 & YlowSt(1,p)<=0.5)
        scatter(mod(XlowSt(1,p),1),mod(YlowSt(1,p),1),100,'r.');
        hold on
    elseif (XlowSt(1,p)<=0.5 & YlowSt(1,p)>0.5)
        scatter(mod(XlowSt(1,p),1),mod(YlowSt(1,p),1),100,'g.');
        hold on
    elseif (XlowSt(1,p)>0.5 & YlowSt(1,p)<=0.5)
        scatter(mod(XlowSt(1,p),1),mod(YlowSt(1,p),1),100,'c.');
        hold on
    else
        scatter(mod(XlowSt(1,p),1),mod(YlowSt(1,p),1),100,'m.');
        hold on
    end 
    hold on
    title('Position initiale particules St=0.01')
    xlabel('X')
    ylabel('Y')
end

%plots the final position according to their initial position in four 
%spaces of the study space range
figure('Name','Position finale particules St=0.01')
for p=1:P
    if (XlowSt(1,p)<=0.5 & YlowSt(1,p)<=0.5)
        scatter(mod(XlowSt(N,p),1),mod(YlowSt(N,p),1),100,'r.');
        hold on
    elseif (XlowSt(1,p)<=0.5 & YlowSt(1,p)>0.5)
        scatter(mod(XlowSt(N,p),1),mod(YlowSt(N,p),1),100,'g.');
        hold on
    elseif (XlowSt(1,p)>0.5 & YlowSt(1,p)<=0.5)
        scatter(mod(XlowSt(N,p),1),mod(YlowSt(N,p),1),100,'c.');
        hold on
    else
        scatter(mod(XlowSt(N,p),1),mod(YlowSt(N,p),1),100,'m.');
        hold on
    end 
    hold on
    title('Position finale particules St=0.01')
    xlabel('X')
    ylabel('Y')
end

%post processes data for another Stokes number
figure('Name','Position initiale particules St=0.1')
for p=1:P
    if (XhighSt(1,p)<=0.5 & YhighSt(1,p)<=0.5)
        scatter(mod(XhighSt(1,p),1),mod(YhighSt(1,p),1),100,'r.');
        hold on
    elseif (XhighSt(1,p)<=0.5 & YhighSt(1,p)>0.5)
        scatter(mod(XhighSt(1,p),1),mod(YhighSt(1,p),1),100,'g.');
        hold on
    elseif (XhighSt(1,p)>0.5 & YhighSt(1,p)<=0.5)
        scatter(mod(XhighSt(1,p),1),mod(YhighSt(1,p),1),100,'c.');
        hold on
    else
        scatter(mod(XhighSt(1,p),1),mod(YhighSt(1,p),1),100,'m.');
        hold on
    end 
    hold on
    title('Position initiale particules St=0.1')
    xlabel('X')
    ylabel('Y')
end

figure('Name','Position finale particules St=0.1')
for p=1:P
    if (XhighSt(1,p)<=0.5 & YhighSt(1,p)<=0.5)
        scatter(mod(XhighSt(N,p),1),mod(YhighSt(N,p),1),100,'r.');
        hold on
    elseif (XhighSt(1,p)<=0.5 & YhighSt(1,p)>0.5)
        scatter(mod(XhighSt(N,p),1),mod(YhighSt(N,p),1),100,'g.');
        hold on
    elseif (XhighSt(1,p)>0.5 & YhighSt(1,p)<=0.5)
        scatter(mod(XhighSt(N,p),1),mod(YhighSt(N,p),1),100,'c.');
        hold on
    else
        scatter(mod(XhighSt(N,p),1),mod(YhighSt(N,p),1),100,'m.');
        hold on
    end 
    hold on
    title('Position finale particules St=0.1')
    xlabel('X')
    ylabel('Y')
end