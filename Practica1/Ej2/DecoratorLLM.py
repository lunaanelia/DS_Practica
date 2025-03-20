from LLM import *
from transformers import MarianMTModel, MarianTokenizer, pipeline

import json
import requests
import time



class DecoratorLLM (LLM):

    def __init__ (self, llm, headers):
        self.llm = llm
        self.headers = headers


    def generate_summary (self, text, intup_lang, output_lang, model):
        return self.llm.generate_summary (text, intup_lang, output_lang, model)
        