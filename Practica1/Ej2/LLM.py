from abc import ABC, abstractmethod

class LLM (ABC):
    # def __init__ (self, model):
    #     self.model_llm = model

    def __init__(self):
        super().__init__()
        
    @abstractmethod
    def generate_summary (text, intup_lang, output_lang, model):
        pass



        