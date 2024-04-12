## GradeX: AI-Powered Grading Assistant

GradeX is a hackathon prototype for an AI-powered grading assistant that uses Gemini AI API to automate the grading process and provide students with detailed feedback.

### Features (This repository)

**Automated Grading**: Leverage AI to automate grading tasks, and give back ratings on a scale of 1-10 for the answers.

**Detailed Feedback**: Generate comprehensive feedback reports for students on why such ratings are given.

### Features (Future Development)

**Generating Reports**: Create comprehensive reports for instructors to analyze student performance and identify learning trends.

**Personalized Analytics**: Provide students with personalized insights into their learning progress including strengths, weaknesses and areas to improve.

**Study Guidance**: Offer tailored study recommendations based on individual student needs.

**LMS Integration**: Integrate seamlessly with Learning Management Systems (LMS) for a streamlined workflow.

### Current Scope

This GitHub repository focuses on the core functionalities of automated grading and detailed feedback generation. The remaining features are prototypes envisioned for future development.

### Tech Stack

Frontend: Flutter

Backend: Python, Flask

AI Integration: Gemini AI API

### Getting Started

**Prerequisites**:

[Flutter Setup](https://docs.flutter.dev/get-started/install)

[Python installed](https://www.python.org/downloads/)

[Get Gemini AI API key](https://ai.google.dev/docs)

**Clone the Repository**:

```console
git clone https://github.com/Osbertt-19/gradeX-hackathon.git
```

**Set Up Backend**:

1. Install Python dependencies.

```console
cd backend
pip install -r requirements.txt
```

2. Create .env file in the backend folder and add the API key. [Get Gemini AI API key](https://ai.google.dev/tutorials/setup)

   `GEMINI_API_KEY = {insert your api key here}`

**Set Up Frontend**:

Install flutter packages (if necessary).

```console
flutter packages get
flutter packages upgrade
```

**Run the Application**:

1. Navigate to the root directory of the project.
2. Run the Flask server.

```console
cd backend
python server.py
```

3. Run the Flutter app.

```console
flutter run
```

### Challenges

There are currently some hurdles to overcome in making GradeX a robust grading assistant. Here's a key challenge we're facing:

**Inconsistent API Output**: The Gemini AI API output string lacks consistency, making it difficult to reliably parse and manipulate within the Python server and the Flutter app. This inconsistency creates challenges in accurately extracting ratings and feedbacks for display.

**Potential Solutions**:

One possible solution we're exploring is to develop a custom "compiler" to process the Gemini AI output word by word. This compiler could tokenize the response, identify relevant ratings and feedback sections, and structure the data in a format that the Flutter app can easily understand and display.

_We welcome your thoughts!_

If you have experience with natural language processing or ideas for alternative solutions, feel free to contribute to this project or open an issue to discuss your thoughts.

### Contributing

We welcome contributions to gradeX! We're excited to see your ideas and improvements to help this project reach its full potential.

**How to Contribute**:

1. Fork the repository: Create your own fork of this repository on GitHub.
2. Clone your fork: Clone your forked repository to your local machine.
3. Create a new branch: Create a new branch for your feature or bug fix.
4. Make changes and commit: Make your changes to the codebase and commit them to your branch with descriptive commit messages.
5. Test your changes: Thoroughly test your changes to ensure they don't break existing functionality.
6. Push your changes: Push your changes to your forked repository on GitHub.
7. Create a pull request: Open a pull request from your branch to the main branch of the upstream repository.

**What to Contribute**:

- Features aligned with the project roadmap: We encourage contributions that support the planned future development of GradeX, including features like report generation, personalized analytics, study guidance, LMS integration and the solution to the API output inconsistency. Refer to the "Future Development" section and "Challenges" section for details.
- Bug fixes and improvements: We appreciate contributions that fix bugs, improve existing code quality, or enhance documentation.
- New ideas: We're open to innovative ideas that extend the functionality of gradeX beyond the current roadmap. Feel free to discuss your ideas in an issue before submitting a pull request.

**Contribution Guidelines**:

- Please follow the code style conventions used in the project.
- Write clear and concise commit messages.
- Ensure your code is well-tested before submitting a pull request.

_We appreciate your contributions!_
