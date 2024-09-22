

# # Install necessary libraries

# pip install transformers sklearn pandas
# pip install pipenv
# pipenv shell
# pip install --upgrade pip setuptools wheel
# pip install transformers
# pip install -U scikit-learn
# pip install torch torchvision torchaudio
# pip install tensorflow
# pip install flax
# pip install pandas openpyxl
# pip install tf-keras

# Python code starts here


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
if 'category' in df.columns:
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
else:
    print("column 'category' does not exist in dataframe")

# ... continue with Few-Shot Prompting for Text Classification and Zero-Shot Prompting for Text Summarization ...

# Setting up the Summarizer 
try:
    summarizer = pipeline("summarization")
except Exception as e:
    print(f"An error occurred while loading the Summarizer: {e}")
    exit()

# Generate summaries
try:
    # df['summary'] = df['narrative'].apply(lambda x: summarizer(x[:1024], max_length=50, min_length=25)[0]['summary_text'])
    df['summary'] = df['narrative'].apply(lambda x: summarizer(x[:1024], max_length=int(len(x)*0.5), min_length=25)[0]['summary_text'])
    
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()

# ... continue with rest of your code ...

# ... Your existing code ...
































# Install necessary libraries

# pip install pipenv
# pipenv shell
# pip install --upgrade pip setuptools wheel
# pip install --pre -U spacy
# pip install transformers
# pip install -U scikit-learn
# pip install pandas openpyxl
# pip install transformers sklearn pandas

# Python code starts here

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
if 'category' in df.columns:
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
else:
    print("column 'category' does not exist in dataframe")


# Setting up the Summarizer 
try:
    summarizer = pipeline("summarization")
except Exception as e:
    print(f"An error occurred while loading the Summarizer: {e}")
    exit()

# Generate summaries
try:
    df['summary'] = df['narrative'].apply(lambda x: summarizer(x[:1024], max_length=int(len(x)*0.5), min_length=25)[0]['summary_text'])
except KeyError as e:
    print(f"The Key '{e}' does not exist in DataFrame.")
    exit()


# Define system_message - You'll need content for this.
system_message = "Hello"

# Few-Shot Prompting for Text Classification
first_turn_template = "..."
example_template = "..."
prediction_template = "..."

def generate_few_shot_prompt(narrative, category):
    # code to generate few shot prompt goes here
    return "..."

df['few_shot_prompt'] = df.apply(lambda x: generate_few_shot_prompt(x['narrative'], x['category']), axis=1)

# Create mistral_response and mistral_response_cleaned columns for this
df['few_shot_mistral_response'] = df['few_shot_prompt'].apply(classify_text)

# Calculate F1 score
f1_few_shot = f1_score(df['category'], df['few_shot_mistral_response'], average='weighted')
print(f"The F1 score for few-shot prompting is {f1_few_shot}")

# Share your observations on the few-shot and zero-shot prompt techniques.
print("Observations:...") # Add your observations here.

# Zero-Shot Prompting for Text Summarization

system_message_summarization = "..."

# Generate mistral_response column containing LLM-generated summaries 

df['mistral_summary'] = df['narrative'].apply(lambda x: summarizer(x[:1024], max_length=int(len(x)*0.5), min_length=25)[0]['summary_text'])

# Evaluate bert score 
# You'll have to import and instantiate the appropriate BERT model, then calculate the BERT score.

# Write your observation
print("Observations on summarization:...") # Add your observations here.