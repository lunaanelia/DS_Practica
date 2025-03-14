import json
import requests
import time
# import cv2
# from google.colab.patches import cv2_imshow

import BasicLLM
import DecoratorLLM
import TranslationDecorator
import ExpansionDecorator

class Cliente:
    def __init__(self, token, config_file):
        self.token_access = self.read_token(token)
        self.headers = {"Authorization": f"Bearer {self.token_access}"}

        self.config = self.read_configuration_file(config_file)
        
        # Asignar los valores del JSON a atributos de la clase
        self.texto = self.config.get("texto")
        self.input_lang = self.config.get("input_lang")
        self.output_lang = self.config.get("output_lang")
        self.model_llm = self.config.get("model_llm", "")
        self.model_translation = self.config.get("model_translation")
        self.model_expansion = self.config.get("model_expansion")

        str.replace ("output", self.output_lang)



    @staticmethod
    def read_configuration_file(file):
        with open(file) as f:
            d = json.load(f)
        return d

    @staticmethod
    def read_token(file):
        c = Cliente(token_file, config_file)
    
        # Verifica que se han cargado los 
        with open(file) as f:
            d = f.read().strip() 
        return d

if __name__ == "__main__":
    token_file = "mi_token.txt" 
    c = Cliente(token_file, "config.json")
    # print(c.texto, c.input_lang, c.output_lang)
    # print(c.model_llm, c.model_translation, c.model_expansion)

    print("Texto:", c.texto)
    print("Input Lang:", c.input_lang)
    print("Output Lang:", c.output_lang)
    print("Model LLM:", c.model_llm)
    print("Model Translation:", c.model_translation)
    print("Model Expansion:", c.model_expansion)


