from DecoratorLLM import *
from LLM import *

import requests
class TranslationDecorator (DecoratorLLM):

    def __init__(self, llm, token, model, input_lang, output_lang):
        super().__init__(llm, token, model)

        # a partir del idioma de entrada y de salida que deseemos en la traducción, 
        # cambiamos el enlace del modelo con los idiomas correspondiente
        self.model=self.model.replace ("input", input_lang).replace ("output", output_lang)

    def generate_summary (self, text):
        # primero obtiene la salida de su llm asociado
        salida = self.llm.generate_summary (text)
        
        if "summary_text" in salida[0]:
            salida = salida[0]["summary_text"] 
        elif "translation_text" in salida[0]:
            salida = salida[0]["translation_text"] 
        elif "generated_text" in salida[0]:
            salida = salida[0]["generated_text"] 


        # luego, decora esta salida traduciendo el texto
        response = requests.post(self.model, headers=self.headers, json=salida)
        return response.json()

