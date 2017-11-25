%plots the final velocity field of the experience

%loads the output files of simulation
UlowSt = load('outputs/Long Times/output_U_St10000_P    500_Tf  7_dt 10sometime.txt');
VlowSt = load('outputs/Long Times/output_V_St10000_P    500_Tf  7_dt 10sometime.txt');
XlowSt = load('outputs/Long Times/output_X_St10000_P    500_Tf  7_dt 10sometime.txt');
YlowSt = load('outputs/Long Times/output_Y_St10000_P    500_Tf  7_dt 10sometime.txt');
UhighSt = load('outputs/Long Times/output_U_St5000_P    500_Tf  7_dt 10sometime.txt');
VhighSt = load('outputs/Long Times/output_V_St5000_P    500_Tf  7_dt 10sometime.txt');
XhighSt = load('outputs/Long Times/output_X_St5000_P    500_Tf  7_dt 10sometime.txt');
YhighSt = load('outputs/Long Times/output_Y_St5000_P    500_Tf  7_dt 10sometime.txt');
[N,P] = size(UlowSt);

%plots the velocity of each particle
figure('Name','Final speed according to position St=10')
title('Final speed according to position St=10')
xlabel('X')
ylabel('Y')
rectangle('Position',[0,0,1,1],'FaceColor',[0.8242,0.8242,0.8242])
hold on;
for p=1:P
    quiver(mod(XlowSt(N,p),1),mod(YlowSt(N,p),1),UlowSt(N,p),VlowSt(N,p),...
        'color',[0.5273,0.8047,0.9792],'linewidth',1);
    legend('Speed','AutoUpdate','off')
    hold on
end 

%plots the velocity of each particle for another Stokes number
figure('Name','Final speed according to position St=5')
title('Final speed according to position St=5')
xlabel('X')
ylabel('Y')
rectangle('Position',[0,0,1,1],'FaceColor',[0.8242,0.8242,0.8242])
hold on;
for p=1:P
    quiver(mod(XhighSt(N,p),1),mod(YhighSt(N,p),1),UhighSt(N,p),VhighSt(N,p),...
        'color',[0.5273,0.8047,0.9792],'linewidth',1);
    legend('Speed','AutoUpdate','off')
    hold on
end 