from LLM import *
from transformers import pipeline
from transformers import AutoModel

import json
import requests
import time




class BasicLLM (LLM):
    def __init__(self, token, config_file):
        super().__init__()
        self.token_access = self.read_token(token)
        self.headers = {"Authorization": f"Bearer {self.token_access}"}


        self.config = self.read_configuration_file(config_file)
        
        # Asignar los valores del JSON
        self.text = self.config.get("texto")
        self.input_lang = self.config.get("input_lang")
        self.output_lang = self.config.get("output_lang")
        self.model_llm = self.config.get("model_llm", "")
        self.model_translation = self.config.get("model_translation")
        self.model_expansion = self.config.get("model_expansion")

        #-> hacer esto en el main mejor para pa poder pasarle los argumentos al modelo de traducción
        self.model_translation=self.model_translation.replace ("input", self.input_lang)
        self.model_translation=self.model_translation.replace ("output", self.output_lang)

    
    @staticmethod
    def read_configuration_file(file):
        with open(file) as f:
            d = json.load(f)

        return d

    @staticmethod
    def read_token(file):    

        with open(file) as f:
            d = f.read().strip() 
        return d
    

    
    def generate_summary (self, text, intup_lang, output_lang, model):    
        #llamar al modelo
        summarizer = pipeline("summarization", model=model)


        print(summarizer(text, max_length=130, min_length=1, do_sample=False))

        # return summary

    


