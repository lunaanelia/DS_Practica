from LLM import *
import requests

class BasicLLM (LLM):
    def __init__(self, token, model):
        super(self, token, model).__init__()
        

    
    def generate_summary (self, text): 
        payload = {
            "inputs": text,
        }
        response = requests.post(self.model, headers=self.headers, json=payload)
        return response.json()

        
        

