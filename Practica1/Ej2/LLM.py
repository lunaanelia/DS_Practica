from abc import ABC, abstractmethod

class LLM (ABC):

    def __init__(self, token, model):
        super().__init__()
        self.headers={"Authorization": f"Bearer {token}"}
        self.model = model
        
    @abstractmethod
    def generate_summary (text):
        pass



        