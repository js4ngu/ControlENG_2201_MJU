function ceo0325a
clc
global k1

k1 = 8*3;
x0 = [0;0;0]
tsim = 3*4;

[t, x] = ode45(@eq0325a, [0:0.01:tsim], x0) % ode45(@미분된 함수 이름, 시간 구간, 초기값)
v1 = x(:,1); v2 = x(:,2); v3 = x(:,3);

figure(1)
plot(t, v1, t, v2, t,   v3), grid on
legend('v1', 'v2', 'v3')
xlabel('[sec]')
title('60171851 JongsangYoo')

end

function dx = eq0325a(t,x)
    global k1
    v1 = x(1); v2 = x(2); v3 = x(3);
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
    
    dx = [dv1; dv2; dv3];
end
