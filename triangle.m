%Author: Emily Justus

maxIt = 3;
count = 0;
clf;        %clear figures

%Preallocate arrays
p_x = zeros(1, maxIt);
p_y = zeros(1, maxIt);

%Reinitalize points
while p_x(1) == p_x(2) || p_x(1) == p_x(3) || p_x(3) == p_x(2) || p_y(1) == p_y(2) || p_y(1) == p_y(3) || p_y(3) == p_y(2)
    [p_x(1), p_y(1)] = random_num();    %Point A
    [p_x(2), p_y(2)] = random_num();    %Point B
    [p_x(3), p_y(3)] = random_num();    %Point C
    count = count + 1;
end

%Distance from each point
a = sqrt((p_x(2)-p_x(1))^2 + (p_y(2)-p_y(1))^2);    %Distance from point A to B
b = sqrt((p_x(3)-p_x(2))^2 + (p_y(3)-p_y(2))^2);    %Distance from point B to C
c = sqrt((p_x(1)-p_x(3))^2 + (p_y(1)-p_y(3))^2);    %Distance from point C to A

theta1 = lawCos(ab, bc, ca);    %Angle for p_x(3) or C in radians
theta2 = lawCos(ca, ab, bc);    %Angle for p_x(2) or B in radians
theta3 = lawCos(bc, ca, ab);    %Angle for p_x(1) or A in radians

%   This method (below) is an alternative because according to the law of cosine [cos(A) = ( a^2 - b^2 -c^2 ) / 2*b*c] if 
%   ( a^2 - b^2 -c^2 ) < 0 then that means cos(A) will be obtuse. However, I which to show display the obtuse angle.
%
%   if (bc^2 + ca^2 - ab^2) < 0 || (ab^2 + bc^2 - ca^2) < 0 || (ab^2 + ca^2 - bc^2) < 0
%       disp("This triangle is obtuse!");
%   end

%Create the triangle

%Finding the slope
m1 = slope(p_x(1), p_y(1), p_x(2), p_y(2)); %slope between points A and B
m2 = slope(p_x(2), p_y(2), p_x(3), p_y(3)); %slope between points B and C
m3 = slope(p_x(3), p_y(3), p_x(1), p_y(1)); %slope between points C and A

%Creating the lines
x = linspace(0, 10);
line1 = m1*(x - p_x(1)) + p_y(1);   %line from A to B
line2 = m2*(x - p_x(2)) + p_y(2);   %line from B to C
line3 = m3*(x - p_x(3)) + p_y(3);   %line from C to A

%Display
for i = 1:maxIt
    fprintf("(%f, %f)\n", p_x(i), p_y(i));
end
fprintf("\nNumber of times through the loop to get correct outputs: %d\n", count);
fprintf("\nDistances: \n");
fprintf("AB: %f\n", ab);
fprintf("BC: %f\n", bc);
fprintf("CA: %f\n", ca);

%Figure
hold on;
plot(x, line1, x, line2, x, line3); %Plots the lengths of the trianlge
xlim([0 1]);    %Makes the graph only show [0, 1] for the x-axis
ylim([0 1]);    %makes the graph only show [0, 1] for the y-axis

%Will print the obtuse angle in radians and will circle the obtuse angle on the graph
if theta1 > (pi/2) || theta2 > (pi/2) || theta3 > (pi/2)
    if theta1 > (pi/2)
        fprintf("\nTheta1: %f\n", theta1);
        scatter(p_x(3), p_y(3));
    elseif theta2 > (pi/2)
        fprintf("\nTheta2: %f\n", theta2);
        scatter(p_x(2), p_y(2));
    elseif theta3 > (pi/2)
        fprintf("\nTheta3: %f\n", theta3);
        scatter(p_x(1), p_y(1));
    end
    disp("This triangle is obtuse!");
else
    disp("The triangle is not obtuse.");
end
hold off;

function num = slope(x1, y1, x2, y2)
num = (y2 - y1)/(x2 - x1);
end

function theta = lawCos(a, b, c)
cosTheta = (b^2 + c^2 - a^2)/(2 * b * c);
theta = acos(cosTheta);
end

function [p_x, p_y] = random_num()
rand_int = randi([0, 1]);
if rand_int == 1
    p_x = rand();
else
    p_x = randi([0, 1]);
end
if p_x ~= 1 && p_x ~= 0
   p_y = randi([0, 1]);
else
   p_y = rand();
end
end
    
