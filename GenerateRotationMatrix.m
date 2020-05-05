%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description:This is the script file is used to generate the Rotation
    matrix using the plane which is in 3D space and we have to translate
    and rotate that to  XY plane for the project.
    R will be the rotation marix of size 3*3

%}
%% CODE

%Load the variable  of the line equation ax + by + cz + d = 0 form.....

% the variane n_best contains a,b,c values being returned from the fit
% plane function
a =n_best(1);
b=n_best(2);
c=n_best(3);
d=ro_best;

% a =1;
% b=1;
% c=1;
% d=-4000;
%TRANSLATE TO Z-d/c 


%% Rotation matrix construction below
sq = sqrt(a^2 + b^2 + c^2);

ct = c/sq;
st = sqrt(a^2 + b^2)/sq;
u1 = b/sq;
u2 = -a/sq;


%% Matrix
%{
for the same rotation matrix:

[cos?+u21(1?cos?)   u1u2(1?cos?)      ?u2sin? 
 u1u2(1?cos?)       cos?+u22(1?cos?)   -u1sin?
 -u2sin?              u1sin?              cos?]

%}

R1 = ct + u1^2*(1-ct);
R2 = u1*u2*(1-ct);
R3 = u2*st;
R4 = u1*u2*(1-ct);
R5 = ct + u2^2*(1-ct);
R6 = -u1*st;
R7 = -u2*st;
R8 = u1*st;
R9 = ct;

%%  R is the rotation matrix of size 3*3

R = [R1 R2 R3; R4 R5 R6; R7 R8 R9];
%% END