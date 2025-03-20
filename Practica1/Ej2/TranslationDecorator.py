from DecoratorLLM import *
from LLM import *
import json

import requests
class TranslationDecorator (DecoratorLLM):

    def __init__(self, llm, headers):
        super().__init__(llm, headers)

    def generate_summary (self, text, intup_lang, output_lang, model):
        salida = self.llm.generate_summary (text, intup_lang, output_lang, model)

        response = requests.post(model, headers=self.headers, json=salida)
        return response.json()

