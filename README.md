# PALA: Personalized Assessment and Learning Assistant

## Project Overview

PALA is a hackathon project developed for a university setting. It aims to automate the grading process for short and long answer exam questions, reducing the workload on teachers while providing students with valuable feedback and personalized learning insights.

## Key Features

**Automated Grading**: Leverages the power of Google's generative AI models to analyze student responses and assign grades.
**Personalized Feedback**: Provides students with tailored feedback specific to their answers, helping them identify areas for improvement.
**Strength and Weakness Analysis**: Analyzes student performance to pinpoint strengths and weaknesses, enabling them to focus on personalized learning goals.
**Knowledge Gap Identification**: Aims to identify knowledge gaps in student understanding, guiding them towards targeted learning resources. (This feature is under development)

## Getting Started (Prototype)

1. Clone the Repository: Use Git to clone this repository to your local machine.

2. Install Dependencies: Install the required Python libraries using pip:
   `Bash
pip install python-dotenv google-generativeai`
   Use code with caution.
3. Obtain API Key: Create a project in Google AI Platform Studio and enable the Google Generative AI API. Generate an API key for your project.

4. Create an Environment File: Within the project directory, create a file named .env. This file will store your API key securely (avoid committing it to version control).

5. Set API Key: Inside the .env file, add the following line, replacing <YOUR_API_KEY> with your actual API key:
   `GEMINI_API_KEY=<YOUR_API_KEY>`
6. Run the Prototype: Execute the main script using the following command:
   `Bash
python pala.py`
   Use code with caution.

## Disclaimer

This is a prototype under development. Functionality and features may change in future versions.
The use of Google's generative AI models for automated grading is subject to Google's AI Principles and Terms of Service.

## Future Development

We plan to enhance PALA by:

Refining the automated grading process for increased accuracy.
Expanding personalized feedback to cover a wider range of answer formats.
Integrating knowledge gap identification for more targeted learning recommendations.

## Contributions

We welcome contributions to the project! Feel free to fork the repository, propose improvements, and submit pull requests.

## Team Members

1. Min Htet Naing
2. Pai Zay Oo
3. Lin Thit Aung
