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

    print("Para introducir manualmente el token presione [m]")
    opcion=input("Para leer el token de un fichero txt presione cualquier otra tecla\n")
    if opcion=='m' or opcion=='M':
        token=input()
    else: 
        print("Se va a leer el token del archivo 'token.txt'")
        print("Para leer un archivo distinto a este, presione [a]")
        opcion = input()

        if opcion == 'a' or opcion == 'A':
            print("Introduzca el nombre del fichero donde se encuentra el token")
            token_file=input()
        else: 
            token_file="token.txt"
        token=read_token(token_file)

    # token_file = "token.txt" 
    # token_file = "./Practica1/Ej2/token.txt" 

    print("Se va a leer 'config.json' como archivo de configuración." )
    config_file = "config.json"
    # config_file = "./Practica1/Ej2/config.json"

    # token = read_token(token_file)
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


