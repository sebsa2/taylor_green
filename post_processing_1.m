U = load('outputs\output_U_St 100_P    100_Tf  1_dt 10sometime.txt');
V = load('outputs\output_V_St 100_P    100_Tf  1_dt 10sometime.txt');
X = load('outputs\output_X_St 100_P    100_Tf  1_dt 10sometime.txt');
Y = load('outputs\output_Y_St 100_P    100_Tf  1_dt 10sometime.txt');
[N,P] = size(U);

figure('Name','Position finale particules')
for p=1:P
    scatter(mod(X(:,p),1),mod(Y(:,p),1));
    hold on
end