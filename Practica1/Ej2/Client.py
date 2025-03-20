import json
import requests
import time

from BasicLLM import BasicLLM  # Importar la clase en lugar del módulo

from TranslationDecorator import TranslationDecorator
from ExpansionDecorator import ExpansionDecorator

class Cliente:
    def __init__(self, token, config_file):

        # 
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
    


if __name__ == "__main__":
    token_file = "mi_token.txt" 
    config_file = "config.json"
    c = Cliente(token_file, config_file)

    # print(c.texto, c.input_lang, c.output_lang)
    # print(c.model_llm, c.model_translation, c.model_expansion)

    print("Texto:", c.text)
    print("Input Lang:", c.input_lang)
    print("Output Lang:", c.output_lang)
    print("Model LLM:", c.model_llm)
    print("Model Translation:", c.model_translation)
    print("Model Expansion:", c.model_expansion)



    print("Aquí va el texto original")
    print(c.text)
    print("--------------------------------------------------------")

    #Funciona
    # print("Aquí va el texto resumido")
    # texto_basico = BasicLLM()
    # texto_basico.generate_summary (c.text, c.input_lang, c.output_lang, c.model_llm)

    print("--------------------------------------------------------")
    # print("Aquí va el texto traducdido")
    # texto_traducido = TranslationDecorator ()
    # texto_traducido.generate_summary (c.text, c.input_lang, c.output_lang, c.model_translation)

    print("--------------------------------------------------------")
    print("Aquí va el texto EXTENDIDO")
    # Esto está rarete
    texto_extendido = ExpansionDecorator ()
    texto_extendido.generate_summary ("tengo un portatil", c.input_lang, c.output_lang, c.model_expansion)


