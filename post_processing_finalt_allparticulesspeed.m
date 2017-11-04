%plots the final velocity field of the experience

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

%plots the velocity of each particle
figure('Name','Final speed according to position St=0.01')
title('Final speed according to position St=0.01')
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
figure('Name','Final speed according to position St=0.1')
title('Final speed according to position St=0.1')
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