%manipolatore seriale con 6 giunti rotoidali
clear();
clc();

%parametri DH del puma 560
%? pi/2 0 ? ? ? 2 ? ? 2 ? ? ? 2  0   alpha
%? 0 0.4323 0 0 0 0
%? 0 0 0 0 0 0
%? 0 0 0.1501 0.4331 0 0

alpha = [pi/2, 0.0, -pi/2, pi/2, -pi/2, 0.0 ];
a = [0.0, 0.4323, 0.0,  0.0,  0.0,  0.0];
theta = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
d = [0.0,  0.0,  0.1501,  0.4331,  0.0,  0.0];


puma50_model = load_puma560_model(d, a, alpha);

% X = 4
%q(1) = [0 0 0 0 0 0]
q_1 = [0,0,0,0,0,0];
%q(2) = [0 0 ? ?/? 0 0 0]
q_2 = [0,0,-pi/4,0,0,0];
%q(3) = [0 ?/? ? ? 0 0 0]
q_3 = [0,pi/4,-pi,0,0,0];
%q(4) = [0 ?/4 ? ? 0 ?/? 0]
q_4 = [0,pi/4,-pi,0,pi/4,0];
%q(5) = [0 0 ? ?/2 ?/6 0 ? ?/?]
q_5 = [0,0,-pi/2,pi/6,0,-pi/4];
%q(6) = [0 ? ?/? 0 0 ? ?/4 0]
q_6 = [0,-pi/4,0,0,-pi/4,0];

%cinematica diretta tramite CORKE
fkine(puma50_model, q_1)
%fkine(puma50_model, q_2)
%fkine(puma50_model, q_3)
%fkine(puma50_model, q_4)
%fkine(puma50_model, q_5)
%fkine(puma50_model, q_6)

for i=1:6
    A = calcolo_matrice_trasformazione(alpha(i), theta(i), d(i), a(i));
    if i == 1
        T = A;
    elseif i>1
        T = T * A;
    end
end

T








