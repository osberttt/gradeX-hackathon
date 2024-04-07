import google.generativeai as genai
import os
from dotenv import load_dotenv, find_dotenv

import database


class Results:
    def __init__(self, questions, answers, ratings, feedbacks):
        self.questions = questions
        self.answers = answers
        self.ratings = ratings
        self.feedbacks = feedbacks


def get_results(test=False):
    find_dotenv()
    load_dotenv()

    answers = database.answers
    if test:
        answers = database.sample_answers

    api_key = os.getenv("GEMINI_API_KEY")
    genai.configure(api_key=api_key)
    model = genai.GenerativeModel("gemini-pro")
    chat = model.start_chat()

    req = """Assess and rate in a scale of 1-10 to following answers. 
    The return output MUST seperate the ratings with commas so that I can later process the ratings in 
    a python file.Example output is 6,5,7. Another example is 2,5,10. Another is 6,8,1.
    """
    for i in range(len(database.answers)):
        req = req + f"{i + 1}. Q: {database.questions[i]} A: {answers[i]} \n"
    ratings = chat.send_message(req)
    ratings = ratings.text.split(",")

    req = """Provide feedbacks to each of them. The return output MUST follow the following exact format.
    1.<Question>
    <Answer>
    <Feedback>"""
    feedbacks = chat.send_message(req).text

    results = Results(database.questions, answers, ratings, feedbacks)
    return results.__dict__


if __name__ == "__main__":
    print(get_results(test=True))
