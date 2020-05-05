%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: The function file for getting the camera parameters.
    ** Input will be the name of the frame being loaded into the path.
    ** The output will the Camera parameters for the image being calculated
    from the camera.txt and images.txt files using the respective formulas.
    ** A , [R t] matrices will be the output.
   
%}
%% CODE
function [A, R_t]=camera_parameters(image_name)
%camera params

    fid = fopen('cameras.txt');
    tline = fgetl(fid);
    while ischar(tline)
        if startsWith(tline, '1')
%             disp(tline);
            splits = string(split(tline, ' '));

            cam_w = str2double(splits(3));
            cam_h = str2double(splits(4));
            cam_f = str2double(splits(5));

            prin_x = str2double(splits(6));
            prin_y = str2double(splits(7))
        end
        tline = fgetl(fid);
    end
    fclose(fid);     

    A = [cam_f, 0, prin_x;...
        0, 1*cam_f, prin_y;...
        0, 0, 1];

    fid = fopen('images.txt');
    tline = fgetl(fid);
    while ischar(tline)
        if endsWith(tline, '.jpg')
            %disp(tline);
            splits = string(split(tline, ' '));
            id = splits(1);
            name = splits(end);
            name
            image_name
            if name == image_name
                Qw = str2double(splits(2));
                Qx = str2double(splits(3));
                Qy = str2double(splits(4));
                Qz = str2double(splits(5));
                Tx = str2double(splits(6));
                Ty = str2double(splits(7));
                Tz = str2double(splits(8));

                rotm = quat2rotm([Qw Qx Qy Qz]);
                T = [Tx;...
                    Ty;...
                    Tz];
                R_t = [rotm T];
                break
            end

    %         external_params = [id name Qw Qx Qy Qz Tx Ty Tz]
        end
        tline = fgetl(fid);

    end
    fclose(fid);
    
end
%% END