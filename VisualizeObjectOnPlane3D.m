%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: The script file  which we used to visualized the
    translated object into the best fit plane generated.
    The plot will contain the mest of  the plane and the object placed upon
    the plane.
    1) We need to  have the coordinated of the translated object before
    running this code. i.e TranslateObject3D.m should be run before.
   
%}
%% CODE

% Plot mesh of the plane
mesh(X_best,Y_best,Z_best);colormap([.8 .8 .8]);
hold on
% PLotting each of the side of the object placed on the plane.

poly_rectangle(TranslatedObject(1,:),TranslatedObject(2,:),TranslatedObject(3,:),TranslatedObject(4,:))
poly_rectangle(TranslatedObject(5,:),TranslatedObject(6,:),TranslatedObject(7,:),TranslatedObject(8,:))
poly_rectangle(TranslatedObject(1,:),TranslatedObject(2,:),TranslatedObject(6,:),TranslatedObject(5,:))
poly_rectangle(TranslatedObject(2,:),TranslatedObject(3,:),TranslatedObject(7,:),TranslatedObject(6,:))
poly_rectangle(TranslatedObject(3,:),TranslatedObject(4,:),TranslatedObject(8,:),TranslatedObject(7,:))
poly_rectangle(TranslatedObject(4,:),TranslatedObject(1,:),TranslatedObject(5,:),TranslatedObject(8,:))

xlabel('X')
ylabel('Y')
zlabel('Z')

%% END
