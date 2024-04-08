% clc
% clear
% warning('off','all')
% 
% % Set up the webcam and face detector
% cam = webcam;
% faceDetector = vision.CascadeObjectDetector;
% 
% % Load the test dataset
% testDataDir = 'Emotions\Test_SIMPLE\';
% folders = dir(testDataDir);
% folders = folders([folders.isdir]);
% folders = folders(3:end); % Exclude "." and ".." folders
% 
% % Initialize variables for accuracy calculation
% numFolders = numel(folders);
% accuracies = zeros(numFolders, 1);
% 
% % Load the trained classifier
% classifierFile = fullfile('features_simp.mat');
% load(classifierFile, 'svm');
% 
% % Process each folder in the test dataset
% for folderIdx = 1:numFolders
%     folderName = folders(folderIdx).name;
%     folderPath = fullfile(testDataDir, folderName);
%     
%     % Create an image datastore for the current folder
%     imdsTest = imageDatastore(folderPath, 'IncludeSubFolders', true, 'LabelSource', 'foldernames');
%     
%     % Initialize variables for accuracy calculation
%     numTestImages = numel(imdsTest.Files);
%     correctPredictions = 0;
%     
%     % Process each image in the current folder
%     for i = 1:numTestImages
%         % Read the test image
%         img = readimage(imdsTest, i);
%         
%         % Detect faces in the image
%         bboxes = step(faceDetector, img);
%         
%         % If faces are detected, classify them and check for accuracy
%         if ~isempty(bboxes)
%             es = imcrop(img, bboxes);
%             es = imresize(es, [128 128]);
%             features = extractLBPFeatures(es);
%             predictedClass = predict(svm, features);
%             groundTruth = imdsTest.Labels(i);
%             
%             % Check if the prediction matches the ground truth
%             if strcmp(predictedClass, groundTruth)
%                 correctPredictions = correctPredictions + 1;
%             end
%         end
%     end
%     
%     % Calculate accuracy for the current folder
%     accuracy = correctPredictions / numTestImages * 100;
%     accuracies(folderIdx) = accuracy;
%     
%     fprintf('Accuracy for folder %s: %.2f%%\n', folderName, accuracy);
% end
% 
% % Overall accuracy across all folders
% overallAccuracy = mean(accuracies);
% fprintf('Overall Accuracy on the test dataset: %.2f%%\n', overallAccuracy);
% 
% % Clean up
% clear cam faceDetector bboxes es img features predictedClass groundTruth svm;
% 

% clc
% clear
% warning('off','all')
% 
% % Load the trained classifier
% load('classifier_simp.mat');
% 
% % Set up the webcam and face detector
% cam = webcam;
% faceDetector = vision.CascadeObjectDetector;
% 
% % Load the test dataset
% imdsTest = imageDatastore('Emotions\Test_SIMPLE\', 'IncludeSubFolders', true, 'LabelSource', 'foldernames');
% 
% % Initialize variables for accuracy calculation
% numTestImages = numel(imdsTest.Files);
% correctPredictions = 0;
% 
% % Process each image in the test dataset
% for i = 1:numTestImages
%     % Read the test image
%     img = readimage(imdsTest, i);
%     
%     % Detect faces in the image
%     bboxes = step(faceDetector, img);
%     
%     % If faces are detected, classify them and check for accuracy
%     if ~isempty(bboxes)
%         es = imcrop(img, bboxes);
%         es = imresize(es, [128 128]);
% %         es = rgb2gray(es);
%         features = extractLBPFeatures(es);
%         predictedClass = predict(svm, features);
%         groundTruth = imdsTest.Labels(i);
%         
%         % Check if the prediction matches the ground truth
%         if strcmp(predictedClass, groundTruth)
%             correctPredictions = correctPredictions + 1;
%         end
%     end
% end
% 
% % Calculate accuracy
% accuracy = correctPredictions / numTestImages * 100;
% fprintf('Accuracy on the test dataset: %.2f%%\n', accuracy);
% 
% % Clean up
% clear cam faceDetector bboxes es img features predictedClass groundTruth;
% 

clc;
clear;
warning('off','all');

% Load the trained classifier
load('Classifier.mat');

% Set up the webcam and face detector
cam = webcam;
faceDetector = vision.CascadeObjectDetector;

while true
    % Take a snapshot from the webcam
    try
        img = snapshot(cam);
    catch
        warning('Unable to capture image from webcam');
        continue;
    end

    % Detect faces in the snapshot
    bboxes = step(faceDetector, img);

    % If faces are detected, classify them and show the result
    if ~isempty(bboxes)
        es = imcrop(img, bboxes(1, :));
        es = imresize(es, [128, 128]);
        es = rgb2gray(es);
        features = extractLBPFeatures(es);
        predictedClass = predict(Classifier, features);
        predictedClass = char(predictedClass);
        imshow(img), title(predictedClass);
        ax = gca;
        ax.TitleFontSizeMultiplier = 1.5;
        pause(0.1);
    else
        % If no faces are detected, show a message on the screen
        imshow(img);
        ax = gca;
        title('Face Not Detected');
        ax.TitleFontSizeMultiplier = 2;
        pause(0.1);
    end
end

% Clean up
clear cam faceDetector bboxes es img features predictedClass;

