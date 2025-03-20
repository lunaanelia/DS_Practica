from DecoratorLLM import *
from transformers import MarianMTModel, MarianTokenizer

from transformers import pipeline

class TranslationDecorator (DecoratorLLM):

    def __init__(self):
        super().__init__()

    def generate_summary (self, text, intup_lang, output_lang, model):

        # tokenizer = MarianTokenizer.from_pretrained(model)

        # modelTranslation = MarianMTModel.from_pretrained(model)

        # translated = modelTranslation.generate(**tokenizer(text, return_tensors="pt", padding=True))

        # for t in translated:
        #     print( tokenizer.decode(t, skip_special_tokens=True) )
        


        pipe = pipeline("translation", model=model)
        print(pipe(text))


        # return translated
