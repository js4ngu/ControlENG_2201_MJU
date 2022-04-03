function ceo0325a
clc
global k1 k0

k1 = 8*3;
k0 = 10;
x0 = [0;0;0;0;0]
tsim = 3*4;

[t, x] = ode45(@eq0325b, [0:0.01:tsim], x0) % ode45(@미분된 함수 이름, 시간 구간, 초기값)
v1 = x(:,1); v2 = x(:,2); v3 = x(:,3); v4 = x(:,4);  eta = x(:,5);

figure(1)
plot(t, v2, t, v3, t, v4), grid on
legend('feedback-con','P-con', 'PI-con')
xlabel('[sec]')
title('60171851 JongsangYoo')
print -djpeg ceo04b

end

function dx = eq0325b(t,x)
    global k1 k0
    v1 = x(1); v2 = x(2); v3 = x(3); v4 = x(4);  eta = x(5);
    a = 2; d = 0;
    
    if(t>3) a = 1; d = 1; end
    if(t>6) a = 1; d = -2; end
    if(t>9) a = 3; d = 0; end
    
    u1 = 20; % open loop control
    dv1 = -a*v1 + u1 + d;
    
    u2 = -8*v2 + 100; % feedback control1
    dv2 = -a*v2 + u2 + d;
    
    u3 = k1*(10 - v3) + 100*0; %p-control
    dv3 = -a*v3 + u3 + d; 
    
    u4 = k1*(10 - v3) + k0*eta; %pI-control
    dv4 = -a*v4 + u4 + d;    
    deta = 10 - v4;
    
    dx = [dv1; dv2; dv3; dv4; deta];
end
