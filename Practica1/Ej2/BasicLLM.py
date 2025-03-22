from LLM import *
import requests

class BasicLLM (LLM):

    def __init__(self, token, model):
        super().__init__(token, model)

    
    def generate_summary (self, text): 

        # para pasarle un diccionario a la petición
        payload = {
            "inputs": text,
        }

        # petición al modelo
        response = requests.post(self.model, headers=self.headers, json=payload)
        return response.json() 

        
        

