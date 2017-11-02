% Premier script projet final

% Constantes
St = 0.1;
deltat = 0.01;
N = 500;
P = 100;

% Conditions initiales particules
X = zeros(N,P);
Y = zeros(N,P);
U = zeros(N,P);
V = zeros(N,P);

X(1,:) = rand(1,P);
Y(1,:) = rand(1,P);

% Iterations
for n=1:N-1;
    for p=1:P;
        % Vitesse gaz
        Ug = -sin(2*pi*X(n,p)) * cos(2*pi*Y(n,p));
        Vg = cos(2*pi*X(n,p)) * sin(2*pi*Y(n,p));
        
        X(n+1,p) = mod( X(n,p) + deltat*U(n,p) , 1);
        Y(n+1,p) = mod( Y(n,p) + deltat*V(n,p) , 1);
        U(n+1,p) = U(n,p) + deltat*(Ug-U(n,p)) / St;
        V(n+1,p) = V(n,p) + deltat*(Vg-V(n,p)) / St;
        
    end
end

figure
for p=1:P
    scatter(X(:,p),Y(:,p));
    hold on
end

     