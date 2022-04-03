function ceo0309
clc
global a b
clc
x0 = 0; a = 2;

b = 2;
[t1, x1] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@�̺е� �Լ� �̸�, �ð� ����, �ʱⰪ) : �̺й������� �ظ� ���ϴ� �Լ�

b = -2;
[t2, x2] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@�̺е� �Լ� �̸�, �ð� ����, �ʱⰪ)

b = 4;
[t3, x3] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@�̺е� �Լ� �̸�, �ð� ����, �ʱⰪ)

figure(1) %Figure1 �̶�� �̸����� â�� ����
plot(t1, x1, t2, x2, t3, x3), grid 'ON'
legend('b=2', 'b=-2', 'b=4')
xlabel('[sec]')
title('60171851 JongsangYoo')


x0 = 1; b = 0;
a = 3;
[t1, x1] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@�̺е� �Լ� �̸�, �ð� ����, �ʱⰪ)

a = 1;
[t2, x2] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@�̺е� �Լ� �̸�, �ð� ����, �ʱⰪ)

a = 5;
[t3, x3] = ode45(@eq0309a, [0:0.01:5], x0) % ode45(@�̺е� �Լ� �̸�, �ð� ����, �ʱⰪ)

figure(2)%Figure2 �̶�� �̸����� â�� ����
plot(t1, x1, t2, x2, t3, x3), grid 'ON'
legend('a=3', 'a=1', 'a=5')
xlabel('[sec]')
title('60171851 JongsangYoo')


end

function dx = eq0309a(t,x)
    global a b
    dx = -a*x + b;
end