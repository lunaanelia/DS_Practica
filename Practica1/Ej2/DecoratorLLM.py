from abc import ABC, abstractmethod
from transformers import MarianMTModel, MarianTokenizer, pipeline


class DecoratorLLM (ABC):

    @abstractmethod
    def generate_summary (text, intup_lang, output_lang, model):
        pass