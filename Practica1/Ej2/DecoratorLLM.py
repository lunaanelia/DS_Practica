from LLM import *

class DecoratorLLM (LLM):

    def __init__ (self, llm, token, model):
        self.llm = llm
        self.headers = {"Authorization": f"Bearer {token}"}
        self.model=model


    def generate_summary (self, text):
        pass
        