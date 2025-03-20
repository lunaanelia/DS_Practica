from DecoratorLLM import *
from transformers import pipeline

class ExpansionDecorator (DecoratorLLM):

    def __init__(self, llm, headers):
        super().__init__(llm, headers)
    
    def generate_summary (self, text, input_lang, output_lang, model):
        salida = self.llm.generate_summary (text, input_lang, output_lang, model)

        response = requests.post(model, headers=self.headers, json=salida)
        return response.json()
        