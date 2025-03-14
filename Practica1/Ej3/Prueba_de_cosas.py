import requests
from bs4 import BeautifulSoup

def main():
    url = 'https://quotes.toscrape.com/'
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')

    cita = soup.find_all(class_='text')    # busca el texto que contiene
    #for i in cita:
    #    print(f"Citas: {i.text}")

    autor = soup.find_all(class_ = 'author')
    #for i in autor:
    #   print(f"Autor: {i.text}")

    divtags = soup.find_all('div', class_='tags')
    for i in divtags:
        enlace = i.find_all('a', class_ = 'tag')

        for j in enlace:
            print(f"Etiquetas: {j.text}")

if __name__ == "__main__":
    main()

# requests.get(url) Obtiene el contenido de la url especificada --> response
# BeautifulSoup(response.text, 'html.parse') --> Analiza el contenido html con el analizador 
# soup.prettify() --> Muestra HTML de forma ordenad y legible

# fiechero yalm debe ser :
#  Autor:
#   nombre del autor
# Cita:
#   cita de texto:
# Tags:
#   - etiqueta1
#   - etiqueta2
#   - ...                       Se pone conguiones para indicar lista