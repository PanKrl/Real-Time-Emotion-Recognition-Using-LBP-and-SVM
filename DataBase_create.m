clc
clear cao
warning('off','all')

% Define constants
const.C = 200;
const.TEMP = 0;

% Initialize webcam and cascade object detector
cao = webcam;
faceDetector = vision.CascadeObjectDetector;

while true
    % Take a snapshot
    e = cao.snapshot;
    
    % Detect faces in the image
    bboxes = step(faceDetector, e);
    
    % Check if any faces are detected
    if ~isempty(bboxes)
        % Check if we have reached the maximum number of images
        if const.TEMP >= const.C
            break;
        else
            % Crop the face and save it as an image
            es = imcrop(e, bboxes(1,:));
            es = imresize(es, [128 128]);
            filename = fullfile('Second\My_IMG\Fear\', sprintf('%d.jpg', const.TEMP));
%           filename = sprintf('%d.jpg', const.TEMP);
            imwrite(es, filename);
            const.TEMP = const.TEMP + 1;
        end
    end
    
    % Show the image
    imshow(e);
end

% Clean up
clear cao faceDetector bboxes es filename const;


% clc
% clear all
% close all
% warning off;
% cao=webcam;
% faceDetector=vision.CascadeObjectDetector;
% c=1000;
% temp=0;
% while true
%     e=cao.snapshot;
%     bboxes =step(faceDetector,e);
%     if(sum(sum(bboxes))~=0)
%     if(temp>=c)
%         break;
%     else
%     es=imcrop(e,bboxes(1,:));
%     es=imresize(es,[48 48]);
%     filename=strcat(num2str(temp),'.jpg');
%     imwrite(es,filename);
%     temp=temp+1;
%     imshow(es);
%     drawnow;
%     end
%     else
%         imshow(e);
%         drawnow;
%     end
% end
