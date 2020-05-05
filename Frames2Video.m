
%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: he script file to create a video form the generated
    frames.
    ** the input will be list of framed images in the directory.
    ** the video will be saved in the current path folder
   
%}
%% CODE

folder = "C:\Users\umarf\Downloads\Computer Vision\Project 2\project\extract_frames\run";

for_dir = folder + "\*.jpg";
contents = dir(for_dir);

video = VideoWriter('yoyovideo.avi'); %create the video object
open(video); %open the file for writing
for ii=1:numel(contents) %where N is the number of images
    image_location  =  folder + "\" + contents(ii).name; 
  I = imread(image_location); %read the next image
  writeVideo(video,I); %write the image to file
end
close(video);

%% END

