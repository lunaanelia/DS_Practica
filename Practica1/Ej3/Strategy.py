
from abc import ABC, abstractmethod

class Strategy (ABC):
    @abstractmethod
    def extraer_datos(self, nombre, num):
        pass