## Classifying Student Performance Using CNN and K-Means Clustering



This project uses Python to classify students into performance classes of High, Average, and Underperformers based on their academic scores, study habits, and personal characteristics. A standard CNN classifier was compared against a K-Means + CNN hybrid model to evaluate performance metrics such as Accuracy, Precision, Recall, F1-score, and AUC across performance classes.

**Full report available in attached pdf file.**

---

## **Dataset Source**: [Kaggle Student Scores Dataset](https://www.kaggle.com/datasets/markmedhat/student-scores)
## Dataset Info:
Below are all the features available in this dataset:

<img width="940" height="852" alt="image" src="https://github.com/user-attachments/assets/b2255db6-4ba2-443b-ae47-ff2bfc493a79" />


---

## Objectives
The main objective is to assess whether K-Means clustering as a pre-processing step can improve the performance of a CNN classification model.

---

## Key Findings

- CNN-only model accuracy: 86%

- **K-Means + CNN model accuracy: 96%**

- CNN underperformed in identifying borderline students. Adding cluster labels helped group students with similar behavioral patterns, which improved generalization.
  
- **All evaluation metrics improved with clustering**, including precision, recall, and F1-score for underperformers.

- **AUC Scores** for CNN+KMeans exceeded 0.99 for all classes.

- **Silhouette Score**: 0.1301 , indicates mild overlap in clusters yet sufficient for boosting CNN performance.

- Incorporating K-means clustering before model training **can significantly enhance performance** in education-related predictive tasks.

---

## Methods & Techniques
### Data Preprocessing
- Dropped irrelevant columns: name, email, career_aspiration.

- Calculated 'average_score' by averaging the scores of English, History, and STEM subjects (Math, Physics, Chemistry, Biology, Geography).

- Created performance_category labels using thresholds:

High Performer (average ≥ 90)

Average Performer (70 ≤ average < 90)

Underperformer (average < 70)  

- Used encoding to convert categorical variables (gender, part_time_job, extracurricular_activities) into numeric format.

---

### Exploratory Data Analysis

- Histogram of average scores
<img width="855" height="627" alt="image" src="https://github.com/user-attachments/assets/29a9aa9b-8050-4a27-8771-ac126e82d048" />

- Boxplot comparing performance categories
<img width="865" height="493" alt="image" src="https://github.com/user-attachments/assets/45936ee7-15da-47c3-8858-7d1493bf78ec" />

- Class Distribution Barplot (High vs Average vs Under)
<img width="1580" height="980" alt="output (3)" src="https://github.com/user-attachments/assets/6a540193-486a-4d42-b1fb-7f2fad30ca7b" />

---

## Machine Learning Models
### Model 1: CNN Only

### Model 2: K-Means + CNN

## Evaluation Metrics
- Accuracy, Precision, Recall, F1-Score.
- AUC/ROC for each class.
- Silhouette Score for K-Means clustering
<img width="767" height="356" alt="image" src="https://github.com/user-attachments/assets/1093c37e-fb9a-4e50-af00-cae4b5f96b3a" />

---
