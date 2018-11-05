# Probability-of-Obtuse-Triangle
This will contain files of the probability of getting an obtuse triangle in matlab based on the idea that the triangle is in a one-by-one square and the three points touch one edge of the box with no two points on the same edge.

The file "triangle.m" contains only one interation of the loop which outputs the three random coordinates along with the distnace between each side. Along with what theta is from the law of cosine.

The file "multiTriangle.m" contains an interation of "triangle.m" 10,000 times (without the displays of each iteration). If the triangle is obtuse (the theta is greater than 90 degrees) than it would be added to a counter. Then after the loop, the counter is divided by the number of iterations and displayed as the result.
