UlowSt = load('outputs\output_U_St  10_P    500_Tf  7_dt 10alltime.txt');
VlowSt = load('outputs\output_V_St  10_P    500_Tf  7_dt 10alltime.txt');
XlowSt = load('outputs\output_X_St  10_P    500_Tf  7_dt 10alltime.txt');
YlowSt = load('outputs\output_Y_St  10_P    500_Tf  7_dt 10alltime.txt');
UhighSt = load('outputs\output_U_St 100_P    500_Tf  7_dt 10alltime.txt');
VhighSt = load('outputs\output_V_St 100_P    500_Tf  7_dt 10alltime.txt');
XhighSt = load('outputs\output_X_St 100_P    500_Tf  7_dt 10alltime.txt');
YhighSt = load('outputs\output_Y_St 100_P    500_Tf  7_dt 10alltime.txt');
[N,P] = size(UlowSt);

red_part = {};
blue_part = {};
green_part = {};
yellow_part{};
for p=1:P
    

figure('Name','Evolution position particules St=0.01')
for p=1:P
    scatter(mod(XlowSt(:,p),1),mod(YlowSt(:,p),1));
    hold on
end

figure('Name','Evolution position particules St=0.1')
for p=1:P
    scatter(mod(XhighSt(:,p),1),mod(YhighSt(:,p),1));
    hold on
end