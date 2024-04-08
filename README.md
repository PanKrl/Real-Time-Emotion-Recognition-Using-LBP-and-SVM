# Real-Time-Emotion-Recognition-Using-LBP-and-SVM
This project delves into the domain of computer vision and ML to achieve real-time emotion recognition, utilizing Local Binary Patterns (LBP) and Support Vector Machine (SVM) algorithms. The goal is to accurately identify and classify five key emotions: Anger, Happiness, Neutral, Fear, and Sadness from real-time facial expressions captured through a webcam.

# Project Overview
Feature Extraction: Uses Local Binary Patterns (LBP) to detail facial textures.
Emotion Classification: Employs Support Vector Machine (SVM) for efficient and precise emotion categorization.

# Dataset
The custom dataset comprises self-captured images labeled with the corresponding emotions, providing a foundation for training and testing the classifier.

# Technologies
• MATLAB and Computer Vision System Toolbox
• Image Processing Toolbox
• MATLAB Support Package for USB Webcams

# Usage
Run the provided scripts in sequential order to set up the database, train the model, and execute real-time emotion recognition.

## Test Results

The model was trained and tested using a self-created dataset with images labeled for five emotional states. After training over 20 epochs, we achieved the following results:

| Epoch | Iteration | Time Elapsed | Mini-batch Accuracy | Mini-batch Loss | Base Learning Rate |
|-------|-----------|--------------|---------------------|-----------------|--------------------|
| 1     | 1         | 00:00:13     | 39.06%              | 1.0794          | 0.001              |
| 13    | 50        | 00:01:35     | 100.00%             | 0.0001          | 0.001              |
| 20    | 80        | 00:02:26     | 100.00%             | 5.7165e-05      | 0.001              |

*Table 1: Training results showing the progression over epochs, demonstrating the model's increasing accuracy and decreasing loss, indicating successful learning.*

![Training Results Chart](path-to-training-results-chart.png "Training Results Over Epochs")

*Figure 1: The graph illustrates the model's accuracy and loss metrics over the training period.*

## Usage

To test the model with your webcam, follow these steps:

1. Ensure the `Classifier.mat` file is in your working directory.
2. Run the `TestModel.m` script to start the webcam and face detection.
3. The live feed will display the recognized emotion as well as a label if a face is not detected.

## Conclusion

The project successfully researched and recognized five types of emotions with a significant degree of accuracy. The use of LBP and SVM for feature extraction and classification has proven effective, even when differentiating between similar emotional expressions.

For more information on the methodologies used, visit the [wiki](#) or view the [project documentation](#).

---

Remember to upload the actual chart image of the training results to your repository and link it properly in the markdown. Replace `path-to-training-results-chart.png` with the actual path to your image file, and `#` with the URLs to your wiki or documentation if you have them.

# License
This project is released under the MIT License.
