trainingSetDir   = fullfile(pwd, 'trainingDataset');
trainingSet = imageDatastore(trainingSetDir,   'IncludeSubfolders', true, 'LabelSource', 'foldernames');

testSetDir = fullfile(pwd, 'testDataset'); 
testSet = imageDatastore(testSetDir, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');


cellSize = [4 4];
img = readimage(trainingSet, 1);
[hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',cellSize);
hogFeatureSize = length(hog_4x4);


[trainingFeatures, trainingLabels] = helperExtractHOGFeaturesFromImageSet(trainingSet, hogFeatureSize, cellSize);
[testFeatures, testLabels] = helperExtractHOGFeaturesFromImageSet(testSet, hogFeatureSize, cellSize);


classifier = fitcecoc(trainingFeatures, trainingLabels);

predictedLabels = predict(classifier, testFeatures);

confMat = confusionmat(testLabels, predictedLabels);



