
from abc import ABC, abstractmethod

class Strategy (ABC):
    @abstractmethod
    def extraerInformacion(self, url, numpag):
        pass