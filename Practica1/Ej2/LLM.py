from abc import ABC, abstractmethod

class LLM (ABC):

    # url de los modelos disponibles en Hugging Face
    url = "https://api-inference.huggingface.co/models/" 

    def __init__(self, token, model):
        super().__init__()
        # para trabajar con la cabecera que necesitan las peticiones (utilizando el token)
        self.headers={"Authorization": f"Bearer {token}"} 

        # para trabajar con la url del modelo
        self.model = LLM.url+model 
        
    @abstractmethod
    def generate_summary (self, text):
        pass



        