Para conectarme con Hugging Face
https://medium.com/@aroman11/how-to-use-hugging-face-api-token-in-python-for-ai-application-step-by-step-be0ed00d315c




Modelos
https://huggingface.co/models


// https://huggingface.co/Helsinki-NLP/opus-mt-es-en


Aquí explica como usar los LLM de generación de texto
https://medium.com/@sharathhebbar24/text-generation-v-s-text2text-generation-3a2b235ac19b




El token se lee de un archivo de texto (llamado "mi_token.txt")

La configuración se lee de "config.json"

Instalar:

pip install huggingface_hub
pip install sacremoses

pip install transformers

// creo q esto d abajo no hay q instalarlo, cuando estemos todas, probamos a ejecutarlo en vuestros portátiles 
// y así comprobamos qué es lo que hay que instalar, que he estado probando cosas
// 

pip install torch torchvision torchaudio



ImportError: 
MarianTokenizer requires the SentencePiece library but it was not found in your environment. Checkout the instructions on the
installation page of its repo: https://github.com/google/sentencepiece#installation and follow the ones
that match your environment. Please note that you may need to restart your runtime after installation.
pip install sentencepiece

