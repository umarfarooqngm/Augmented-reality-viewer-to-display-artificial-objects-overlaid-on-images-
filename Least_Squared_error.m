%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: function file to calculate the Lease squared error of the
    points with respect to the plane being matched as best fit. inorder to
    get the best fitting plane.
%}
%% CODE
function [n_est_vec ro_est_vec X Y Z]=Least_Squared_error(points)

    % Calculate mean of all points
    p_all_mean=mean(points);

    for i=1:length(points)
        A_mat(:,:,i)=(points(i,:)-p_all_mean)'*(points(i,:)-p_all_mean);
    end

    % Sum up all entries in A
    A_mat_sum=sum(A_mat,3);
    [V ~]=eig(A_mat_sum);

    % Calculate new normal vector
    n_est_vec=V(:,1);

    % Calculate new ro
    ro_est_vec=dot(n_est_vec,p_all_mean);

    % getting the meshgrid of the points
    
    [X,Y]=meshgrid(min(points(:,1)):max(points(:,1)),min(points(:,2)):max(points(:,2)));
    Z=(ro_est_vec-n_est_vec(1)*X-n_est_vec(2).*Y)/n_est_vec(3);
end
%% END