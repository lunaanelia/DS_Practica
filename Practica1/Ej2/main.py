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


    # opcion=input("Desea introducir el token manualmente o leer un archivo txt que lo contenga?")
    # if opcion=='m':
    #     token=input()
    # elif opcion == 'a':
    #     el 

    token_file = "mi_token.txt" 
    token_file = "./Practica1/Ej2/mi_token.txt" 
    config_file = "config.json"
    config_file = "./Practica1/Ej2/config.json"

    token = read_token(token_file)
    config = read_configuration_file(config_file)

    
    # Asignar los valores del JSON
    text = config.get("texto")
    input_lang = config.get("input_lang")
    output_lang = config.get("output_lang")
    model_llm = config.get("model_llm", "")
    model_translation = config.get("model_translation")
    model_expansion = config.get("model_expansion")


    # print("Texto:", text)
    # print("Input Lang:", input_lang)
    # print("Output Lang:", output_lang)
    # print("Model LLM:", model_llm)
    # print("Model Translation:", model_translation)
    # print("Model Expansion:", model_expansion)

    print(config)



    print("Aquí va el texto original")
    print(text)
    print("--------------------------------------------------------")

    

    print("Aquí va el texto resumido")
    texto_basico = BasicLLM(token, url+model_llm)
    print(texto_basico.generate_summary (text))

    print("--------------------------------------------------------")
    print("Aquí va el texto traducdido")
    #pasar todo esto al constructor en lugar de a generate summary
    texto_traducido = TranslationDecorator (texto_basico, token, url+model_translation, input_lang, output_lang)
    print(texto_traducido.generate_summary (text))

    print("--------------------------------------------------------")
    print("Aquí va el texto EXTENDIDO")

    
    texto_extendido = ExpansionDecorator (texto_basico, token, url+model_expansion)
    print(texto_extendido.generate_summary (text))


