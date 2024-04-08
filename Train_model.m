% clc
% clear
% warning('off','all')
% 
% % Define constants
% const.DATA_DIR = 'Emotions\Train_SIMPLE\';
% const.FEATURES_FILE = 'features_simp.mat';
% const.CLASSIFIER_FILE = 'classifier_simp.mat';
% const.NUM_CLASSES = 6;
% const.TRAINING_FRACTION = 0.7;
% 
% % Create an image datastore from the data directory
% imds = imageDatastore(const.DATA_DIR, 'IncludeSubFolders', true, 'LabelSource', 'foldernames');
% 
% % Split the image datastore into training and validation sets
% [trainImds, valImds] = splitEachLabel(imds, const.TRAINING_FRACTION, 'randomized');
% 
% % Extract LBP features from the training set
% trainingFeatures = zeros(numel(trainImds.Files), 59);
% for i = 1:numel(trainImds.Files)
%     img = readimage(trainImds, i);
%     trainingFeatures(i,:) = extractLBPFeatures(im2gray(img));
% end
% 
% % Train a multiclass SVM classifier using the training features and labels
% svm = fitcecoc(trainingFeatures, trainImds.Labels);
% 
% % Evaluate the classifier on the validation set
% validationFeatures = zeros(numel(valImds.Files), 59);
% for i = 1:numel(valImds.Files)
%     img = readimage(valImds, i);
%     validationFeatures(i,:) = extractLBPFeatures(im2gray(img));
% end
% predictedLabels = predict(svm, validationFeatures);
% accuracy = mean(predictedLabels == valImds.Labels);
% 
% % Save the trained classifier and features to disk
% save(const.CLASSIFIER_FILE, 'svm')
% save(const.FEATURES_FILE, 'trainingFeatures', 'trainImds', 'validationFeatures', 'valImds')
% 
% % Clean up
% clear imds svm trainImds valImds predictedLabels accuracy;



clc;
clear all;
close all;
warning off;
imds=imageDatastore('Second\MY_IMG\','IncludeSubFolders',true,'LabelSource','foldernames');
trainingFeatures=[];
trainingLabels=imds.Labels;       
for i = 1:numel(imds.Files)         % Read images using a for loop
    img = readimage(imds,i);
    trainingFeatures(i,:)=extractLBPFeatures(rgb2gray(img));
end
Classifier =fitcecoc(trainingFeatures,trainingLabels);
save Classifier Classifier
