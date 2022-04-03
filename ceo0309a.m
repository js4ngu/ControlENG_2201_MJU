function ceo0309
clc
global a b
clc
x0 = 1; b = 0;

a = 3;
[t1, x1] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@미분된 함수 이름, 시간 구간, 초기값)

a = 1;
[t2, x2] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@미분된 함수 이름, 시간 구간, 초기값)

a = 5;
[t3, x3] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@미분된 함수 이름, 시간 구간, 초기값)

figure(1)
plot(t1, x1, t2, x2, t3, x3)
legend('a=3', 'a=1', 'a=5')
xlabel('[sec]')
title('60171851 JongsangYoo')

end

function dx = eq0309a(t,x)
    global a b
    dx = -a*x + b;
end
