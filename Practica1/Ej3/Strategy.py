# Para crear la interfaz, como en python no hay la simulamos 
# con clases abstracta, por lo que la importamos
from abc import ABC, abstractmethod

class Strategy (ABC):
    @abstractmethod
    def extraer_datos(self, url, num):
        pass