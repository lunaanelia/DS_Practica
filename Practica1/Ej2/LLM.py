from abc import ABC, abstractmethod

class LLM (ABC):

    def __init__(self):
        super().__init__()
        
    @abstractmethod
    def generate_summary (text):
        pass



        