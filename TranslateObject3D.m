%% START
%{
    Name: Soumitra Mehrotra , Shreyas Hervatte, Vikram Poddar, Umar Farooq
    Computer Vision II - Project 2 implementation
    Description: The script file  used to translate the object planed in
    the local xyz plane to XYZ best fit plane.
    1) Before running this code we have to generate find the best fit plane
     equation & Rotation matrix .
    2) The code will return the coordinates of the object in the 3D
    translates plane.
%}
%% CODE
% Definind a sample cube of distinct size to be placed such that the centre
% is the base is  at the origin of 3D.

ObjectPlaced = 0.8.*[2 2 0; 2 -2 0; -2 -2 0; -2 2 0; 2 2 4; 2 -2 4; -2 -2 4; -2 2 4];

 
 
InverseRot = inv(R); % finding inverse of Rot matrix to reverse translate the object to 
                        % our plane

                        
OB = zeros(length(ObjectPlaced),3);
for i = 1:length(ObjectPlaced)
    DummyVariable = InverseRot*ObjectPlaced(i,:)';
    OB(i,:) = DummyVariable';
end

% after rotation we have to translate the object to d/c in z direction
% which we have done in order to move the best fit plane to the origin
% before rotation.

translation = [0 0 d/c];

% the coordinates of the object translated and rotated is looaded below for
% the use of projection in further steps...


TranslatedObject = OB + translation;


%% END