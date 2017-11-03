UlowSt = load('outputs/output_U_St  10_P    500_Tf  7_dt 10sometime.txt');
VlowSt = load('outputs/output_V_St  10_P    500_Tf  7_dt 10sometime.txt');
XlowSt = load('outputs/output_X_St  10_P    500_Tf  7_dt 10sometime.txt');
YlowSt = load('outputs/output_Y_St  10_P    500_Tf  7_dt 10sometime.txt');
UhighSt = load('outputs/output_U_St 100_P    500_Tf  7_dt 10sometime.txt');
VhighSt = load('outputs/output_V_St 100_P    500_Tf  7_dt 10sometime.txt');
XhighSt = load('outputs/output_X_St 100_P    500_Tf  7_dt 10sometime.txt');
YhighSt = load('outputs/output_Y_St 100_P    500_Tf  7_dt 10sometime.txt');
[N,P] = size(UlowSt);

figure('Name','Position initiale particules St=0.01')
for p=1:P
    scatter(mod(XlowSt(1,p),1),mod(YlowSt(1,p),1));
    hold on
end

figure('Name','Position finale particules St=0.01')
for p=1:P
    scatter(mod(XlowSt(N,p),1),mod(YlowSt(N,p),1));
    hold on
end

figure('Name','Position initiale particules St=0.1')
for p=1:P
    scatter(mod(XhighSt(1,p),1),mod(YhighSt(1,p),1));
    hold on
end

figure('Name','Position finale particules St=0.1')
for p=1:P
    scatter(mod(XhighSt(N,p),1),mod(YhighSt(N,p),1));
    hold on
end