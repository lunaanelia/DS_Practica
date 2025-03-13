# Esto es la interface
# metodo extraerInfo()
from abc import ABC, abstractmethod

class Strategy (ABC):
    @abstractmethod
    def extraerInformacion(self):
        pass