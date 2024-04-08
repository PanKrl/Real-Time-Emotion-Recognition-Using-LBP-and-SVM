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

## Test Results

The model was trained and tested using a self-created dataset with images labeled for five emotional states. After training over 20 epochs, we achieved the following results:

| Epoch | Iteration | Time Elapsed | Mini-batch Accuracy | Mini-batch Loss | Base Learning Rate |
|-------|-----------|--------------|---------------------|-----------------|--------------------|
| 1     | 1         | 00:00:13     | 39.06%              | 1.0794          | 0.001              |
| 13    | 50        | 00:01:35     | 100.00%             | 0.0001          | 0.001              |
| 20    | 80        | 00:02:26     | 100.00%             | 5.7165e-05      | 0.001              |

*Table 1: Training results showing the progression over epochs, demonstrating the model's increasing accuracy and decreasing loss, indicating successful learning.*

## Usage

To test the model with your webcam, follow these steps:

1. Ensure the `Classifier.mat` file is in your working directory.
2. Run the `TestModel.m` script to start the webcam and face detection.
3. The live feed will display the recognized emotion as well as a label if a face is not detected.

## Special Consideration

During testing, we encountered challenges in distinguishing between sad and neutral emotions, leading to some similar results in these categories. This similarity suggests that these emotional states share subtle facial expressions, making them harder to differentiate purely through algorithmic means. Users should be aware of this limitation when interpreting the system's classifications.

## My Experience

Embarking on this project has been a pivotal moment in my journey through computer vision and machine learning landscapes. The process of developing an emotion recognition system that navigates the intricacies of human facial expressions has profoundly deepened my expertise in several key areas: feature extraction, classification algorithms, and practical application of machine learning models.

A standout challenge was the nuanced distinction between sad and neutral emotions. This issue is encapsulated in the following visualization, which shows how similar expressions were tagged differently based on subtle emotional cues.

![Special Case of Emotion Recognition](specialCase.png "Challenges in Distinguishing Emotions")

*Figure 1: Demonstrating the challenge in distinguishing between sad and neutral expressions.*

This particular challenge not only tested the model's capabilities but also enriched my understanding of the limitations and potentials within emotion recognition technology. It has inspired me to think critically about model refinement, dataset diversity, and the ethical implications of AI in interpreting human emotions.

Through this project, I've gained invaluable insights into the dynamic field of AI, fortifying my skills in data analysis, programming, and critical problem solving. The journey has underscored the importance of perseverance, innovation, and ethical responsibility in the development of technology that interacts closely with human emotions.

## Conclusion

The emotion recognition project achieved its goal of identifying five types of emotions with high accuracy. However, the observed similarities between sad and neutral emotional expressions highlight the need for further refinement and possibly more granular emotion categorization in future work. This system lays the groundwork for more empathetic human-computer interactions and opens the door to myriad applications in sectors requiring nuanced emotional understanding.

# License
This project is released under the MIT License.
