% Bayesian Data Analysis
% Fall 2017
% HW1p: Programming Homework #1
% Instructor:    Dr. Kevin H. Knuth
% Student:     Deven Swiergiel
% Date : 11 Sep 2017

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) Write a SCRIPT to verify that computers do indeed make mistakes
%    - Create a loop that adds 0.1 to a variable 10 times
%    - Display the result
%    - Does this give you the correct answer of 0.1 * 10 = 1?
%    - ARE YOU SURE ITS CORRECT?  Try subtracting 1.0 to see the difference
%    - How large is the error in the calculation?
%
% b) Write a SCRIPT where you vectorize the above code:
%    - Create a 1x10 vector of values equal to 0.1
%    - Use the sum function to sum them
%    - What is the error in this case?
%    - Use the functions 'tic' and 'toc' to determine how much faster
%      the vectorized code is compared to the above code.  Note that 
%      you may have to loop through the calculation many times to get 
%      a good estimate.  Make sure you get a good estimate!
%
% c) Write a FUNCTION called myCOSINE to be used as such:  y = myCOSINE(x)
%    to compute the values of cos(x) correct to three decimal places.
%    Use the Taylor series below to do this.  How many terms will you need
%    to make sure that the result is accurate to three decimal places?
%       cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + ...
%    - Prepend the function header below to your function and fill in the
%      details as instructed.  USE THIS FOR ALL FUNCTIONS!
%
% d) Write a SCRIPT that compares myCOSINE() to cos()
%    - On a SINGLE plot display the cosine from 0 to 2pi using each function
%      Color MATLAB's cos() function using RED
%      Color your myCOSINE() function using BLUE
%    - Create a second plot showing the difference between the two functions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% adding loop
% A script that loops 10 times adding .1 each time. This is to demonstrate that computers are not 100% perfect at computing accurate results
%
% Usage:
%           Just run it
%           
% Where:
%           x = the sum of .1 10 times.
% 
% Created By: 
%           Deven Swiergiel
%           9/11/17
disp(' ');
disp('Function a)');

tic
x = 0;
for i = 1 : 10
    x = x + .1;
end;
toc

disp('Result: ');
disp(x);

disp('Error: ');
disp(x-1);

% adding vector
% A script that creates a 1X10 vector and uses the sum function to get a result
%
% Usage:
%           Just run it
%           
% Where:
%           A = 1X10 vector who's values equal .01
%           s = the sum of vector A's entries
%
% Created By: 
%           Deven Swiergiel
%           9/11/17


disp('Function b)');

tic
A(1:10) = .1;
s = sum(A);
toc

disp('Result: ');
disp(s);

disp('Error: ');
disp(s-1);

% Comparing cos(x) with myCOSINE(x)
% 
% Usage:
%           Just run it
%           
% Where:
%           A = 1X10 vector who's values equal .01
%           s = the sum of vector A's entries
%
% Created By: 
%           Deven Swiergiel
%           9/11/17

x = input('Please enter a angle x in radians: ');

y = myCOSINE(x);

disp('myCOSINE(x): ');
disp(y);


z = cos(x);

disp('cos(x): ');
disp(z);

% Plot showing both matlab's cos(x) as well as myCOSINE(x)

x = 0:pi/100:2*pi;
y1 = myCOSINE(x);
y2 = cos(x);

figure
plot(x,y2,'r',x,y1,'b');

text(0,0, 'Start');
text(2*pi,0, 'End');
title ('Plot of Cosine of anlgle \theta in radians');

ylabel ('Cosine of angle \theta');

% Plot showing the differences between myCOSINE(x) and matlab's cos(x)

x = 0:pi/100:2*pi;
y1 = cos(x) - myCOSINE(x);
y2 = cos(x) - cos(x);

figure
% plot(x,y2,'r',x,y1,'b');

plot(x, y1, x, y2);
text(0,0, 'Start');
text(2*pi,0, 'End');
title ('Plot of cos(x) - cos(x) and cos(x) - myCOSINE(x)');

ylabel ('Value difference between cos(x) and myCOSINE(x)');





