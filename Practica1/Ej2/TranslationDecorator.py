from DecoratorLLM import *
from transformers import MarianMTModel, MarianTokenizer

class TranslationDecorator (DecoratorLLM):
    def generate_summary (text, intup_lang, output_lang, model):

        tokenizer = MarianTokenizer.from_pretrained(model)

        modelTranslation = MarianMTModel.from_pretrained(model)

        translated = modelTranslation.generate(**tokenizer(text, return_tensors="pt", padding=True))

        for t in translated:
            print( tokenizer.decode(t, skip_special_tokens=True) )

        # return translated
