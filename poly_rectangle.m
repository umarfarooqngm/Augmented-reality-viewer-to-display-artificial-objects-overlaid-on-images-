%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: The funnction file to plot the plane in 3D space.
    ** the input will be the coordinates of the 4 corners.
   
    ** the function will plot the plane in 3D with color and hold for
    further sides of object
   
%}
%% CODE
function poly_rectangle(p1, p2, p3, p4)
% The points must be in the correct sequence.
% The coordinates must consider x, y and z-axes.
x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];
fill3(x, y, z, rand(size(p1)));

hold on
end
%% END