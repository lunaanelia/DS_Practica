# Hemos tenido que descargar: (probarlo creo qu eno es necesario)
#       pip install selenium
from Strategy import *
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.firefox.options import Options as FirefoxOptions

from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager

import time
# from selenium.webdriver.firefox.options import Options





class Selen(Strategy):
    def __init__(self, navegador):
        super().__init__()
        self.navegador = navegador

    def extraer_datos(self, url, num):
               
        datos = []
        
        # Esto es lo que no se puede hacer asi
        service = FirefoxService(executable_path = "/snap/bin/geckodriver")
        driver = webdriver.Firefox(service=service)
        
        # driver.get("https://quotes.toscrape.com/")
        driver.get(url)
        # Aquí puedes hacer cualquier interacción con la página

        for pag in range(num):
            citas = driver.find_elements(By.CLASS_NAME, "quote")

            # Recorrer todas las citas y mostrar el texto
            for cita in citas:
                autor = cita.find_element(By.CLASS_NAME, "author").text
                texto_cita = cita.find_element(By.CLASS_NAME, "text").text
                etiquetas = cita.find_elements(By.CLASS_NAME, "tag")
                
                enlacesTexto = [etiqueta.text for etiqueta in etiquetas]
                
                autor_existente = next((item for item in datos if item['autor'] == autor), None)

                if autor_existente:
                   # Si el autor ya está, simplemente añadimos la nueva cita a su lista de citas
                    autor_existente['citas'].append({
                        'cita': texto_cita,
                        'etiquetas': enlacesTexto
                    })
                else:
                    # Si el autor no existe, lo agregamos con su primera cita
                    datos.append({
                        'autor': autor,
                        'citas': [{
                            'cita': texto_cita,
                            'etiquetas': enlacesTexto
                        }]
                    })

            # Buscar el enlace con el número de la página
            try:
                boton = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, "//a[contains(text(), 'Next')]")) # Busca un en lace (a) que contenga el tecto Next
                )
                boton.click()  # Hacer clic en el enlace
                time.sleep(3)  # Esperar a que cargue la página
            except Exception as e:
                print(f"Hubo un problema para pasar a la siguiente pagina")  
        
        driver.quit()

        return datos