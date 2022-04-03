function ceo0321
clc

x0 = [0; 0];
tsim = 12

[t, x] = ode45(@eq0316, [0:0.01:tsim], x0) % ode45(@미분된 함수 이름, 시간 구간, 초기값)
v1 = x(:,1); v2 = x(:,2);

figure(2)%Figure2 이라는 이름으로 창이 열림
plot(t,v1,t,v2), grid 'ON'
legend('u1', 'u2')
xlabel('[sec]')
title('60171851 JongsangYoo')
print -djpeg ceo02
end

function dx = eq0316(t,x)
  v1 = x(1);  v2 = x(2);
  a = 2; d = 0;
  
  if(t > 3)
    a = 1;
    d = 2;
  end
  if(t > 6)
    a = 1;
    d = -2;
  end
  if(t > 9)
    a = 3;
    d = 0;
  end
  
  u1 = 20;%openloop control
  dv1 = -a*v1 + u1 + d;
  
  u2 = -8*v2 + 100;%openloop control
  dv2 = -a*v2 + u2 + d;
  
  dx = [dv1; dv2]; 
end