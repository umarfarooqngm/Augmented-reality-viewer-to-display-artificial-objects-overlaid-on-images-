%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: The function file used to calculate the best fit plane,
    X,Y,Z mesh coordinates for the plane, and the plane equation also as
    output.
%}
%% CODE
function [points_plane,n_plane,d_plane,X_plane,Y_plane,Z_plane,error_plane] = Get_BestFit_Plane(points,samples,iters,thresh,d_nearby)

    iterations=0;
    
    %Running for 'iters' number of iterations have occurred
    while iterations < iters
        clear points_close distance points_new p_in pponts_out

        %Draw a sample of n points from the data
        perm=randperm(length(points));
        sample_in=perm(1:samples);
        points_in=points(sample_in,:);
        sample_out=perm(samples+1:end);
        points_out=points(sample_out,:);

        %Fitting to sampled the given points
        [n_est_vec_in ro_est_vec_in]=Least_Squared_error(points_in);
        points_new=points_in;

        %For each data point oustide the sample
        for i=sample_out
            distance=dot(n_est_vec_in,points(i,:))-ro_est_vec_in;
            abs(distance);
            if abs(distance) d_nearby
                %Refit the line using all these points
                [n_est_vec_new ro_est_vec_new X Y Z]=Least_Squared_error(points_new);
                for j=1:length(points_new)
                    distance(j)=dot(n_est_vec_new,points_new(j,:))-ro_est_vec_new;
                end
            %Error Criterion
                error(iterations+1)=sum(abs(distance));
            else
                error(iterations+1)=inf;
            end

            if iterations >1
  
            % Get the best fitting value among the collection points
                if error(iterations+1) <= min(error)
                    points_plane=points_new;
                    n_plane=n_est_vec_new;
                    d_plane=ro_est_vec_new;
                    X_plane=X;
                    Y_plane=Y;
                    Z_plane=Z;
                    error_plane=error(iterations+1);
                end
            end
            iterations=iterations+1;
        end
    end

 %% END