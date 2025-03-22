from LLM import *

class DecoratorLLM (LLM):

    def __init__ (self, llm, token, model):
        super().__init__(token, model)
        # guarda el modelo a decorar
        self.llm=llm


    def generate_summary (self, text):
        pass
        