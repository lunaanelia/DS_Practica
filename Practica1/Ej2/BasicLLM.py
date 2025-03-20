from LLM import *
from transformers import pipeline
from transformers import AutoModel

import json
import requests
import time




class BasicLLM (LLM):
    def __init__(self,  headers):
        # self.llm = llm
        self.headers=headers

    
    def generate_summary (self, text, intup_lang, output_lang, model): 
        payload = {
            "inputs": text,
        }
        response = requests.post(model, headers=self.headers, json=payload)
        return response.json()

        
        

