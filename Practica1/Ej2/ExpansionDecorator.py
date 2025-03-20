from DecoratorLLM import *
from transformers import pipeline

class ExpansionDecorator (DecoratorLLM):

    def __init__(self):
        super().__init__()

    # def generate_summary (self, text, intup_lang, output_lang, model):

    #     # response = requests.requests("POST", model, )
    #     pipe = pipeline("text-generation", model=model)

    #     print (pipe(text))


    #     # return text

    # def generate_summary(self, text, input_lang, output_lang, model):
    #     # Inicializa el pipeline para la tarea de generación de texto
    #     generator = pipeline("text-generation", model=model)

    #     # Expande el texto, estableciendo un límite para los nuevos tokens generados
    #     expanded_text = generator(text, max_new_tokens=300, num_return_sequences=1)

    #     # Mostrar el texto expandido
    #     print("Texto expandido:", expanded_text)

    #     # Devuelve el texto expandido
    #     return expanded_text[0]['generated_text']  # Asegúrate de que el modelo devuelva 'generated_text'
    
    def generate_summary (self, text, input_lang, output_lang, model):
        task = "text2text-generation"
        text2text_generator = pipeline(
            task,
            model = model)

        print(text2text_generator(text))
        