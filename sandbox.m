UlowSt = load('outputs/output_U_St  10_P    500_Tf  7_dt 10alltime.txt');
VlowSt = load('outputs/output_V_St  10_P    500_Tf  7_dt 10alltime.txt');
XlowSt = load('outputs/output_X_St  10_P    500_Tf  7_dt 10alltime.txt');
YlowSt = load('outputs/output_Y_St  10_P    500_Tf  7_dt 10alltime.txt');
UhighSt = load('outputs/output_U_St 100_P    500_Tf  7_dt 10alltime.txt');
VhighSt = load('outputs/output_V_St 100_P    500_Tf  7_dt 10alltime.txt');
XhighSt = load('outputs/output_X_St 100_P    500_Tf  7_dt 10alltime.txt');
YhighSt = load('outputs/output_Y_St 100_P    500_Tf  7_dt 10alltime.txt');
[N,P] = size(UlowSt);

figure('Name','Evolution position particules St=0.01')
axis([0,1,0,1])
title('Evolution position particules St=0.01')
xlabel('X')
ylabel('Y')
for p=1:P
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

for k=1:100
    for p=1:P
        x = mod(XlowSt(:,p),1);
        y = mod(YlowSt(:,p),1);
        addpoints(S(p).data,x(k),y(k));
        drawnow
        hold on
    end 
    hold on
end