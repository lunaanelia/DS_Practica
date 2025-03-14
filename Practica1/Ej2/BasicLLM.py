from LLM import *
from transformers import pipeline


class BasicLLM (LLM):
    def __init__(self, model):
        super(self, model)
    
    def generate_summary (text, intup_lang, output_lang, model):    
        #llamar al modelo
        summarizer = pipeline("summarization", model=model)


        print(summarizer(text, max_length=130, min_length=30, do_sample=False))

        # return summary


    
    