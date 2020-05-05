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

[A, R_t]=parameters('frame6.jpg');
yy = zeros(length(p_best),1) + 1;
coludpoints = [p_best yy];

coludtrans = zeros(length(p_best),3);

for i = 1:length(p_best)
    coludtrans(i,:) = A*R_t*coludpoints(i,:)';
    coludtrans(i,1) =  coludtrans(i,1)/ coludtrans(i,3);
    coludtrans(i,2) =  coludtrans(i,2)/ coludtrans(i,3);
end

tt = imread('C:\Users\umarf\Downloads\Computer Vision\Project 2\final\extract_frames\frames\frame6.jpg');


coludtrans = coludtrans(:,1:2);
figure(1)
imshow(tt)
hold on
plot(coludtrans(:,1),coludtrans(:,2),'+r')
saveas(1,'finename.jpg')
%% END