%Author: Emily Justus

maxIt = 10000;
sum = 0;        %This will find the sum of all the triangles that are obtuse to later result in the probability
counter = 0;    %This will find the estimated number of times it will go through the while loop

for j = 1:maxIt
    %Initalizing
    leng = 3;
    p_x = zeros(1, leng);
    p_y = zeros(1, leng);
    
    %Reinitalize points
    while p_x(1) == p_x(2) || p_x(1) == p_x(3) || p_x(3) == p_x(2) || p_y(1) == p_y(2) || p_y(1) == p_y(3) || p_y(3) == p_y(2)
        [p_x(1), p_y(1)] = random_num();    %Point A
        [p_x(2), p_y(2)] = random_num();    %Point B
        [p_x(3), p_y(3)] = random_num();    %Point C
        counter = counter + 1;
    end
    
    %Distance from each point
    ab = sqrt((p_x(2)-p_x(1))^2 + (p_y(2)-p_y(1))^2);   %Distance from point A to B
    bc = sqrt((p_x(3)-p_x(2))^2 + (p_y(3)-p_y(2))^2);   %Distance from point B to C
    ca = sqrt((p_x(1)-p_x(3))^2 + (p_y(1)-p_y(3))^2);   %Distance from point C to A

%    According to the law of cosine [cos(A) = ( a^2 - b^2 -c^2 ) / 2*b*c] if ( a^2 - b^2 -c^2 ) < 0 then that means
%    cos(A) will be obtuse.
    if (bc^2 + ca^2 - ab^2) < 0 || (ab^2 + bc^2 - ca^2) < 0 || (ab^2 + ca^2 - bc^2) < 0
        sum = sum + 1;
    end

end

result = sum/maxIt;
count = counter/maxIt;
fprintf("\nNumber of times through the inner loop on average: %f\n", count);
fprintf("The probability: %f\n", result);

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
