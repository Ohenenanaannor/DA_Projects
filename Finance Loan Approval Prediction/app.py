import streamlit as st
import joblib
import pandas as pd

# Load model and threshold
model_bundle = joblib.load('loan_eligibility_model.pkl')
model = model_bundle["pipeline"]
threshold = model_bundle["threshold"]

st.title("Loan Eligibility Predictor")

# Categorical inputs
gender = st.selectbox("Gender", ["Male", "Female"])
married = st.selectbox("Married", ["Yes", "No"])
dependents = st.selectbox("Dependents", ["0", "1", "2", "3+"])
education = st.selectbox("Education", ["Graduate", "Not Graduate"])
self_employed = st.selectbox("Self Employed", ["Yes", "No"])
property_area = st.selectbox("Property Area", ["Urban", "Semiurban", "Rural"])
credit_history = st.selectbox("Credit History", [1, 0])

# Numerical inputs
applicant_income = st.number_input("Applicant Income", min_value=0)
coapplicant_income = st.number_input("Coapplicant Income", min_value=0)
loan_amount = st.number_input("Loan Amount", min_value=0)
loan_term = st.number_input("Loan Amount Term", min_value=0)

if st.button("Check Eligibility"):
    input_dict = {
        "Gender": [gender],
        "Married": [married],
        "Dependents": [dependents],
        "Education": [education],
        "Self_Employed": [self_employed],
        "Credit_History": [credit_history],
        "Property_Area": [property_area],
        "ApplicantIncome": [applicant_income],
        "CoapplicantIncome": [coapplicant_income],
        "LoanAmount": [loan_amount],
        "Loan_Amount_Term": [loan_term],
    }

    input_df = pd.DataFrame(input_dict)

    # Predict probability
    prob = model.predict_proba(input_df)[0][1]
    prediction = int(prob >= threshold)

    if prediction == 1:
        st.success(f"✅ Eligible for Loan")
    else:
        st.markdown(
            f'<p style="color: white; background-color: red; padding: 10px; border-radius: 5px;">'
            f'❌ Not Eligible for Loan',
            unsafe_allow_html=True
        )
