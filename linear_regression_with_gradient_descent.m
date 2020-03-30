clear all;
close all;
clc;

size = 50;

x_co = zeros(1,size);
y_co = zeros(1,size);

for i = 1:length(x_co)
%     x_co(i) = randi([0 100]);
%     y_co(i) = randi([0 100]);

      x_co(i) = 2 * i;
      y_co(i) = randi([2*i 100+2*i]) + 50;
      y_co(i) = y_co(i) * 10;
end

figure(1);
plot(x_co,y_co,'rx');

a = 0;
b = 0;

alpha = 0.0001;

for i = 1 : 100000
    suma = 0;
    for j = 1 : size
        suma = suma + (a + b*x_co(j) - y_co(j));
    end
    suma = suma / size;
    suma = suma * alpha;
    
    sumb = 0;
    for j = 1 : size
        sumb = sumb + (a + b*x_co(j) - y_co(j))*x_co(j);
    end
    sumb = sumb / size;
    sumb = sumb * alpha;
    
    a = a - suma;
    b = b - sumb;
end

   
tempx = 1:100;
tempy = a + b*tempx;

figure(2);
plot(x_co,y_co,'rx');    
hold on;
plot(tempx,tempy);