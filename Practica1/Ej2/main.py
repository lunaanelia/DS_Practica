import json
import requests
import time


from LLM import *

from BasicLLM import BasicLLM 
from TranslationDecorator import TranslationDecorator
from ExpansionDecorator import ExpansionDecorator

   
def read_configuration_file(file):
    with open(file) as f:
        d = json.load(f)

    return d

def read_token(file):    

    with open(file) as f:
        d = f.read().strip() 
    return d



if __name__ == "__main__":

    url = "https://api-inference.huggingface.co/models/"

    token_file = "mi_token.txt" 
    config_file = "config.json"

    token_access = read_token(token_file)
    headers = {"Authorization": f"Bearer {token_access}"}


    config = read_configuration_file(config_file)
    
    # Asignar los valores del JSON
    text = config.get("texto")
    input_lang = config.get("input_lang")
    output_lang = config.get("output_lang")
    model_llm = config.get("model_llm", "")
    model_translation = config.get("model_translation")
    model_expansion = config.get("model_expansion")

    model_translation=model_translation.replace ("input", input_lang)
    model_translation=model_translation.replace ("output", output_lang)

    print("Texto:", text)
    print("Input Lang:", input_lang)
    print("Output Lang:", output_lang)
    print("Model LLM:", model_llm)
    print("Model Translation:", model_translation)
    print("Model Expansion:", model_expansion)



    print("Aquí va el texto original")
    print(text)
    print("--------------------------------------------------------")

    

    print("Aquí va el texto resumido")
    texto_basico = BasicLLM(headers)
    print(texto_basico.generate_summary (text, input_lang, output_lang, url+model_llm))

    print("--------------------------------------------------------")
    print("Aquí va el texto traducdido")
    #pasar todo esto al constructor en lugar de a generate summary
    texto_traducido = TranslationDecorator (texto_basico, headers, , input_lang, output_lang, url+model_translation)
    print(texto_traducido.generate_summary (text))

    print("--------------------------------------------------------")
    print("Aquí va el texto EXTENDIDO")
    
    texto_extendido = ExpansionDecorator (texto_basico, headers)
    print(texto_extendido.generate_summary (text, input_lang, output_lang, url+model_expansion))


