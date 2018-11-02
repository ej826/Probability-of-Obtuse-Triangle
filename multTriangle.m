maxIt = 10000;
sum = 0;

for j = 1:maxIt
    %Initalizing
    leng = 3;
    p_x = zeros(1, leng);
    p_y = zeros(1, leng);
    
    %Reinitalize points
    while p_x(1) == p_x(2) || p_x(1) == p_x(3) || p_x(3) == p_x(2) || p_y(1) == p_y(2) || p_y(1) == p_y(3) || p_y(3) == p_y(2)
        [p_x(1), p_y(1)] = random();
        [p_x(2), p_y(2)] = random();
        [p_x(3), p_y(3)] = random();
    end
    
    %Distance from each point
    a = sqrt((p_x(2)-p_x(1))^2 + (p_y(2)-p_y(1))^2);
    b = sqrt((p_x(3)-p_x(2))^2 + (p_y(3)-p_y(2))^2);
    c = sqrt((p_x(1)-p_x(3))^2 + (p_y(1)-p_y(3))^2);

    cosTheta = (b^2 + c^2 - a^2)/(2 * b * c);
    theta = acosd(cosTheta);

    if theta > 90
        sum = sum + 1;
    end
end

result = sum/maxIt;
disp(result)

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