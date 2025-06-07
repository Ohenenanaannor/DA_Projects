# 🏦 Loan Approval Prediction

This project aims to predict whether a loan application will be approved based on historical applicant data using Machine Learning techniques.

---

## 📂 Project Structure
- `loan_Prediction.ipynb` : Jupyter Notebook containing full analysis, preprocessing, model building, evaluation, and insights.

---

## 📋 Problem Statement
The goal is to automate the loan approval process for a financial institution, by predicting loan approval (`Y` or `N`) based on applicants' demographics, income details, credit history, and loan information.

---

## 📊 Dataset
- **Source:** [Kaggle - Loan Prediction Dataset](r'/kaggle/input/finance-loan-approval-prediction-data/train.csv')
- **Files:**
  - `train.csv` - Training data
  - `test.csv` - Testing data

**Key Features:**
- **Categorical:** Gender, Married, Dependents, Education, Self_Employed, Credit_History, Property_Area
- **Numerical:** ApplicantIncome, CoapplicantIncome, LoanAmount, Loan_Amount_Term
- **Target Variable:** Loan_Status (Y/N)

---

## 🔥 Exploratory Data Analysis (EDA)
- **Univariate Analysis:** Distribution of each feature individually.
- **Multivariate Analysis:** Relationship between features and Loan_Status.
- **Missing Values Handling:** 
  - Numerical features filled with median.
  - Categorical features filled with mode.
- **Outlier Treatment:** Identified and addressed using boxplots.

---

## 🏗️ Data Preprocessing
- **Encoding:** One-Hot Encoding for categorical features.
- **Scaling:** StandardScaler for numerical features.
- **Pipeline:** Clean preprocessing pipeline using `Pipeline` and `ColumnTransformer` from Scikit-Learn.

---

## 🧠 Model Building
- **Algorithm Used:** Logistic Regression
- **Data Split:** 80% Training, 20% Validation (Stratified split)
- **Threshold Tuning:** Adjusted decision threshold to improve recall for minority class (Loan_Status = 'N').

---

## 📈 Model Evaluation

### Validation Results:
- **Validation Accuracy:** `86.18%`

### Classification Report:

| Class | Precision | Recall | F1-Score | Support |
|:-----:|:---------:|:------:|:--------:|:-------:|
|   0   |   0.96    |  0.58  |   0.72   |   38    |
|   1   |   0.84    |  0.99  |   0.91   |   85    |

- **Macro Average F1-Score:** `0.81`
- **Weighted Average F1-Score:** `0.85`

### Confusion Matrix:

|        | Predicted: 0 | Predicted: 1 |
|--------|--------------|--------------|
| Actual: 0 |     22       |     16       |
| Actual: 1 |      1       |     84       |

---

## 📌 Key Findings
- Good Credit History significantly increases loan approval chances.
- Higher ApplicantIncome correlates with higher loan approval rates.
- Logistic Regression provided a solid baseline performance.
- Adjusting threshold helped improve recall without severely impacting precision.

---

## 🚀 Future Work
- Try more advanced models like Random Forest, XGBoost, or Gradient Boosting.
- Perform hyperparameter tuning (GridSearchCV, RandomizedSearchCV).
- Engineer new features like Debt-to-Income Ratio for better predictions.
- Cross-validation to enhance model generalization.

---

## ✨ Technologies Used
- Python
- Pandas, NumPy
- Matplotlib, Seaborn
- Scikit-Learn

---

## 📬 Contact
For feedback, questions, or collaborations, feel free to reach out!

---

> _This project is part of my Data Science learning journey! 🚀_
