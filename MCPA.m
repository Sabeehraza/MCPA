clear
clc
a = 1;

x = zeros(a,1);
xPos = 0;
v = zeros(a,1);

time = 0;
delta_t = 1;

 F = 1; 
 m = 1; 

steps = 100; % 100 seconds

rebound = 0; 

p = 0.05; % given in the lab manual.
Tau = 20;

for i = 2:steps
    
    time(i) = time(i-1) + delta_t;
    
    v(:,i) = v(:,i-1) + F/m*delta_t;
    x(:,i) = x(:,i-1) + v(:,i-1)*delta_t + (F/m * delta_t^2)/2; 
    
    p = 1 - exp(-delta_t/Tau); % equation given in lab manaual 
    r = rand(a,1) < p;    
    v(r,i) = rebound*v(r,i);
    V(i,:) = mean(v,2);
    
    
    % Velocity vs Time
    subplot(3,1,1), plot(time,v,'m');
    hold on;
    subplot(3,1,1), plot(time,V,'k');
    hold off;
    xlabel('time')
    ylabel('v')
    title(['Average Velocity: ', num2str(V(i,:)/1e7), 'e7 m/s'])
    
    % Velocity vs Position 
    subplot(3,1,2), plot(x(1,:),v,'r');
    hold on;
    subplot(3,1,2), plot(x(1,:),V,'y');
    hold off;    
    xlabel('x')
    ylabel('v')
        
    % Position vs Time
    subplot(3,1,3), plot(time,x,'b');
    xlabel('time')
    ylabel('x')     
      
    pause(0.05)
end 

display('Average Velocity:')
V(steps,:)

