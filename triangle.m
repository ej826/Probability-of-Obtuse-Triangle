maxIt = 3;
count = 0;

%Preallocate arrays
p_x = zeros(1, maxIt);
p_y = zeros(1, maxIt);

%Reinitalize points
while p_x(1) == p_x(2) || p_x(1) == p_x(3) || p_x(3) == p_x(2) || p_y(1) == p_y(2) || p_y(1) == p_y(3) || p_y(3) == p_y(2)
    [p_x(1), p_y(1)] = random();
    [p_x(2), p_y(2)] = random();
    [p_x(3), p_y(3)] = random();
    count = count + 1;
end

%Distance from each point
a = sqrt((p_x(2)-p_x(1))^2 + (p_y(2)-p_y(1))^2);
b = sqrt((p_x(3)-p_x(2))^2 + (p_y(3)-p_y(2))^2);
c = sqrt((p_x(1)-p_x(3))^2 + (p_y(1)-p_y(3))^2);

cosTheta = (b^2 + c^2 - a^2)/(2 * b * c);
theta = acosd(cosTheta);

if theta > 90
    disp("This triangle is obtuse!");
end

%Display
for i = 1:maxIt
    fprintf("(%f, %f)\n", p_x(i), p_y(i));
end
disp(count);    %Num of times through while loop
scatter(p_x, p_y);  %Points on graph
disp("Distances: ");
fprintf("a: %f\n", a);
fprintf("b: %f\n", b);
fprintf("c: %f\n", c);
fprintf("Theta: %f", theta)

function [p_x, p_y] = random()
rand_int = randi([0, 1]);
if rand_int == 1
    p_x = rand();
else
    p_x = randi([0, 1]);
end
if p_x ~= 1
   p_y = randi([0, 1]);
else
   p_y = random();
end
end
    