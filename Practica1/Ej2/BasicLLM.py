from LLM import *
from transformers import pipeline


class BasicLLM (LLM):
    def __init__(self):
        super().__init__()
    
    def generate_summary (self, text, intup_lang, output_lang, model):    
        #llamar al modelo
        summarizer = pipeline("summarization", model=model)


        print(summarizer(text, max_length=130, min_length=1, do_sample=False))

        # return summary


