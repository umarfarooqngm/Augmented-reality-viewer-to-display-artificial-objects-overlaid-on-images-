%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description:This is the script file which reads the 3D points obtainned
    by the Colmap and does RANSAC implementation in order to get the best
    fit plane.
%}
%% CODE
ptCloud = pcread('points3D.ply')

data = ptCloud.Location;   %% loading data
a = size(data);
no = floor(0.50 * a(1))
%% Fitting the best plane below
[p_best,n_best,ro_best,X_best,Y_best,Z_best,error_best] = Get_BestFit_Plane(data, no, 300, 4, 100);
%% plots for the best plane and the extracted feature points in 3D.
figure(1);
pause(.5)
plot3(p_best(:,1),p_best(:,2),p_best(:,3),'ok')
hold on;
mesh(X_best,Y_best,Z_best);colormap([.8 .8 .8]);
beep;

%% plot for visualizing all the features in 3D
pause(0.5);
figure(2);plot3(p_best(:,1),p_best(:,2),p_best(:,3))
figure(3);pcshow(ptCloud);hold on;pcshow(p_best);
figure(4);pcshow(p_best);
%% END

