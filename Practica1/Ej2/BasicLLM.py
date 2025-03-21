from LLM import *

import json
import requests
import time




class BasicLLM (LLM):
    def __init__(self, token, model):
        super().__init__()
        self.headers={"Authorization": f"Bearer {token}"}
        self.model = model

    
    def generate_summary (self, text): 
        payload = {
            "inputs": text,
        }
        response = requests.post(self.model, headers=self.headers, json=payload)
        return response.json()

        
        

