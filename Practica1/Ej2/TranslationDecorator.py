from DecoratorLLM import *
from LLM import *

import requests
class TranslationDecorator (DecoratorLLM):

    def __init__(self, llm, token, model, input_lang, output_lang):
        super().__init__(llm, token, model)
        self.model=model.replace ("input", input_lang).replace ("output", output_lang)

    def generate_summary (self, text):
        salida = self.llm.generate_summary (text)
        if "summary_text" in salida[0]:
            salida = salida[0]["summary_text"] 
        elif "translation_text" in salida[0]:
            salida = salida[0]["translation_text"] 
        elif "generated_text" in salida[0]:
            salida = salida[0]["generated_text"] 

        response = requests.post(self.model, headers=self.headers, json=salida)
        return response.json()

