import json

from BasicLLM import BasicLLM 
from TranslationDecorator import TranslationDecorator
from ExpansionDecorator import ExpansionDecorator

# Función que lee archivo json   
def read_configuration_file(file):
    with open(file) as f:
        d = json.load(f) # Para cargar el archivo en un diccionario

    return d # Devuelve el diccionario para poder trabajar con él

def read_token(file):    
    with open(file) as f:
        d = f.read() # Lee el contenido del archivo
    return d # devuelve el token



if __name__ == "__main__":

    # Menú interactivo para pedir el token al usuario
    print("Es necesario introducir un token para conectarse con Hugging Face")
    print("\tPara introducir manualmente el token presione [m]")
    opcion=input("\tPara leer el token de un fichero .txt presione cualquier otra tecla\n")
    if opcion=='m' or opcion=='M':
        token=input()
    else: 
        print("\tPara introducir manualmente el nombre del archivo presione [a]")
        print("\tPara leer el token del fichero 'token.txt' presione cualquier otra tecla")
        opcion = input()

        encontrado = True
        if opcion == 'a' or opcion == 'A':
            print("Introduzca el nombre del fichero donde se encuentra el token")
            token_file=input()
            try: 
                token=read_token(token_file)
            except FileNotFoundError:
                print(f"No se encontró el archivo '{token_file}'")
                print("Se leerá el archivo 'token.txt\n")
                encontrado=False
        
        
        if not (opcion == 'a' or opcion == 'A') or not encontrado:
            token_file="token.txt"

            try: 
                token=read_token(token_file)
            except FileNotFoundError:
                print(f"No se encontró el archivo {token_file}, asegúrese de tenerlo o de introducir manualmente el token")
                exit(1)

        

    print("\nSe va a leer 'config.json' como archivo de configuración.\n" )
    config_file = "config.json"

    # La información que se extrae del archivo de configuración se guarda en un diccionario
    config = read_configuration_file(config_file)

    
    # Asignar los valores del JSON
    text = config.get("texto")
    input_lang = config.get("input_lang")
    output_lang = config.get("output_lang")
    model_llm = config.get("model_llm", "")
    model_translation = config.get("model_translation")
    model_expansion = config.get("model_expansion")

    print("--------------------------------------------------------")
    print("\nEl archivo de configuración es el siguiente:")
    print(config)

    print("\nTexto original:")
    print("'"+text+"'")
    print("--------------------------------------------------------")

    

    print("Texto resumido")
    texto_basico = BasicLLM(token, model_llm)
    print(texto_basico.generate_summary (text))

    print("--------------------------------------------------------")
    print("Texto traducido:")
    # pasar todo esto al constructor en lugar de a generate summary
    texto_traducido = TranslationDecorator (texto_basico, token, model_translation, input_lang, output_lang)
    print(texto_traducido.generate_summary (text)) 

    print("--------------------------------------------------------")
    print("Texto extendido:")

    
    texto_extendido = ExpansionDecorator (texto_basico, token, model_expansion)
    print(texto_extendido.generate_summary (text))


