from LLM import *

import json
import requests
import time



class DecoratorLLM (LLM):

    def __init__ (self, llm, token, model):
        self.llm = llm
        self.headers = {"Authorization": f"Bearer {token}"}
        self.model=model


    def generate_summary (self, text):
        return self.llm.generate_summary (text)
        