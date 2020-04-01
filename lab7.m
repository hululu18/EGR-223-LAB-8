%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: EGR223-02 Lab 7
% Filename: lab7.m
% Author: Dixit Gurung
% Date: 3/15/2020
% Instructor: Dr. Nicholas Baine
% Description: Exploring Joint CDF , PDF  and  3D plots
% note: diff and trapz functions were also explored for derivative and
% integration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc

%Question 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x,y] = meshgrid(0:1:50,0:1:50);
F_xy =  1 - exp(-x/3) - exp(-y/2) + exp(-((x/3)+(y/2)));

figure
mesh(F_xy);
title('Plot for joint CDF');
xlabel('x');
ylabel('y');
zlabel('CDF (F_x_y)');



%Question 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%empericl portion
x = 0:1:50;
y = inf;
F_x =  1 - exp(-x/3) - exp(-y/2) + exp(-((x/3)+(y/2)));

figure
subplot(2,1,1);
plot(x,F_x);

% for Fy(y)
x = inf;
y = 0:1:50;
F_x =  1 - exp(-x/3) - exp(-y/2) + exp(-((x/3)+(y/2)));

hold on
plot(y,F_x);
title('Emperical Plot of F_x(x) and F_y(y)');
xlabel('x or y');
ylabel('Marginal CDF F_x or F_y');
legend('F_x(x)','F_y(y)')
hold off


%Analytical solution calculation and plots
x = 0:1:50;
F_x = 1- exp(-x/3);

subplot(2,1,2);
plot(x,F_x);
hold on

y = 0:1:50;
F_y = 1- exp(-y/2);

plot(y,F_y);
title('Analytical plot of F_x(x) and F_y(y)');
xlabel('x or y');
ylabel('Marginal CDF F_x or F_y');
legend('F_x(x)','F_y(y)')
hold off



%Question 6%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%empericl portion
dx = 0.5;
dy = 0.5; 
[x,y] = meshgrid(0:dx:50,0:dy:50);
%diff function was used two times for partial derivative 
%diff(z,1,1) 1st derivative of z wrt x(1) and y(2) 
F_xy =  1 - exp(-x/3) - exp(-y/2) + exp(-((x/3)+(y/2)));
f_x = (diff(F_xy,1,1))/dx; %Partial derivative wrt x

f_xy_pdf = (diff(f_x,1,2))/dy; %Partial derivative wrt y

figure
subplot(2,1,1);
mesh(f_xy_pdf);
title('emperical plot of joint pdf');
xlabel('x');
ylabel('y');
zlabel('PDF (f_x_y)');
view(320,50)


%Analytical solution and plot
[x,y] = meshgrid(-2:1:50,-2:1:50);
fxy = (1/6) * exp(-((x/3)+(y/2)));

subplot(2,1,2);
mesh(fxy);
title('Analytical plot of joint pdf');
xlabel('x');
ylabel('y');
zlabel('PDF (f_x_y)');


%Question 7%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%empericl portion
dx = 0.5;
dy = 0.5;
x = 0:dx:49.5;
y = 0:dx:49.5;
%0-49.5 because of length of x and y should be equal to dimension of f_xy_pdf

%using trapz function to inegrate 
fx_pdf = dx * trapz(f_xy_pdf,1); %choosing 2 will integrate over x

fy_pdf = dy * trapz(f_xy_pdf,2); %choosing 2 will integrate over y

figure
subplot(2,1,1);
plot(fx_pdf);
title ('emperical  marginal pdf');
xlabel('x and y');
ylabel('PDF (f_x(x) and f_y(y))');
hold on
%mesh(fy_pdf);
plot(fy_pdf);
legend('f_x(x)','f_y(y)')
hold off

%Analyticall solution and plot
x = 0:1:50;
y = 0:1:50;
fx_pdf = (1/3) * exp( (-x/3) );

subplot(2,1,2);
plot(x,fx_pdf);
title(' Analytical marginal pdf');
xlabel('x and y');
ylabel('PDF (f_x(x) and f_y(y))');
hold on

fy_pdf = (1/2) * exp( (-y/2) );
plot(y,fy_pdf);
legend('f_x(x)','f_y(y)')
hold off


