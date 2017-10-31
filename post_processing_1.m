U = load('outputs\output_U.txt');
V = load('outputs\output_V.txt');
X = load('outputs\output_X.txt');
Y = load('outputs\output_Y.txt');
[N,P] = size(U);

figure('Name','Position finale particules')
for p=1:P
    scatter(mod(X(:,p),1),mod(Y(:,p),1));
    hold on
end