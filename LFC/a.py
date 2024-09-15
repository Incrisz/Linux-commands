# Import required libraries
from transformers import pipeline
from sklearn.metrics import f1_score
import pandas as pd

try:
    # Load the dataset
    df = pd.read_csv("Complains_classification.csv")
except FileNotFoundError:
    print("The file 'Complains_classification.csv' was not found.")
    exit()


# Setting up the Mistral model (Load zero-shot classification pipeline)
classifier = pipeline("zero-shot-classification")

# Define the categories
categories = df["category"].unique().tolist()

# Zero-Shot Prompting for Text Classification
def classify_text(text):
    result = classifier(text, categories)
    return result["labels"][0]  # get the most likely category

try:
    df['mistral_response'] = df['narrative'].apply(classify_text)
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()

try:
    # Calculate the F1 score
    f1 = f1_score(df['category'], df['mistral_response'], average='weighted')
    print(f"The F1 score is {f1}")
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()

# Setting up the Summarizer 
try:
    summarizer = pipeline("summarization")
except Exception as e:
    print(f"An error occurred while loading the Summarizer: {e}")
    exit()
    
# Generate summaries
try:
    df['summary'] = df['narrative'].apply(lambda x: summarizer(x, max_length=50, min_length=25)[0]['summary_text'])
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()

















































































# Import required libraries
from transformers import pipeline
from sklearn.metrics import f1_score
import pandas as pd

try:
    # Load the dataset
    df = pd.read_csv("Complains_classification.csv")
except FileNotFoundError:
    print("The file 'Complains_classification.csv' was not found.")
    exit()

# Setting up the Mistral model (Load zero-shot classification pipeline)
classifier = pipeline("zero-shot-classification")

# Define the categories
categories = df["category"].unique().tolist()

# Zero-Shot Prompting for Text Classification
def classify_text(text):
    result = classifier(text, categories)
    return result["labels"][0]  # get the most likely category

try:
    df['mistral_response'] = df['narrative'].apply(classify_text)
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()

try:
    # Calculate the F1 score
    f1 = f1_score(df['category'], df['mistral_response'], average='weighted')
    print(f"The F1 score is {f1}")
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()

# Setting up the Summarizer 
try:
    summarizer = pipeline("summarization")
except Exception as e:
    print(f"An error occurred while loading the Summarizer: {e}")
    exit()

# Generate summaries
try:
    df['summary'] = df['narrative'].apply(lambda x: summarizer(x, max_length=50, min_length=25)[0]['summary_text'])
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()
