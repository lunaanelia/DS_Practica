from DecoratorLLM import *
from LLM import *
import json

import requests
class TranslationDecorator (DecoratorLLM):

    def __init__(self, llm):
        super().__init__()
        self.llm = llm

    def generate_summary (self, text, intup_lang, output_lang, model):
        salida = llm.generate_summary (text, intup_lang, output_lang, model)

        response = requests.post(model, headers=headers, json=payload)
        response.json()

        # salida =  request.post(..., salida).load() #profe

        salida = response


        # return translated
