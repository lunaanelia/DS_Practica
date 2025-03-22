# Hemos tenido que descargar: (probarlo creo qu eno es necesario)
#       pip install selenium
#       pip install webdriver-manager

from Strategy import *

from selenium import webdriver  # Para poder controlar el componente el navegador wed
from selenium.webdriver.common.by import By     # Para localizar elemtos en una pagina wed
from selenium.webdriver.support.ui import WebDriverWait     # Para espera hasta que se cupla una condicon antes de pasra a la siguiente accion (carge el boton)
from selenium.webdriver.support import expected_conditions as EC    # Para esperar eventos concretos de la pagina (boton)

from selenium.webdriver.firefox.service import Service as FirefoxService    # Para poder usar Firefox 

from selenium.webdriver.chrome.service import Service       # Para gestionar el servicio de Chorme
from webdriver_manager.chrome import ChromeDriverManager    # Para descargarel driver de chorme (si poniamos el de firefox daba error)

import subprocess   # Para poder ejercutar comandos del sistema
import time         # tiempo (sleep)


class Selen(Strategy):
    
    def __init__(self, navegador):
        super().__init__()
        self.navegador = navegador

    def extraer_datos(self, url, num):
               
        datos = []

        if(self.navegador=="firefox"):
        
            # Buscamos la ruta del geckodriver
            ruta = subprocess.run(["which", "geckodriver"], capture_output=True, text=True) # sofia
            
            # Comproamos que lo tengamos
            if not ruta:
                raise FileNotFoundError("No se encontró 'geckodriver'. Asegúrate de que este instalado")

            # Pasamos la ruta y crearmos el driver
            service = FirefoxService(executable_path = ruta.stdout.strip())
            driver = webdriver.Firefox(service=service)
        
        elif(self.navegador=="chrome"):
            # nos aseguramos de que tengamos el contrlador y creamso un servicio para controlarlo
            service = Service(ChromeDriverManager().install())
            # Creamos el driver
            driver = webdriver.Chrome(service=service)
        
        else:
            raise FileNotFoundError("Navegador no disponible")
            
        driver.get(url) # Abrimos la url en el navegador
        
        for pag in range(num):
            
            # Buscamos todas las citas. (estan en un div, clase quote)
            citas = driver.find_elements(By.CLASS_NAME, "quote")

            # Recorrer todas las citas y obtener el texto, autor y etiquetas
            for cita in citas:
                autor = cita.find_element(By.CLASS_NAME, "author").text
                texto_cita = cita.find_element(By.CLASS_NAME, "text").text
                etiquetas = cita.find_elements(By.CLASS_NAME, "tag")
                
                enlacesTexto = [etiqueta.text for etiqueta in etiquetas]
                
                # Vemos si el autor exixte o no
                autor_existente = next((item for item in datos if item['autor'] == autor), None)

                if autor_existente:
                   # Si el autor ya está, añadimos la nueva cita
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

            # Buscar el enlace de la siguiente pagina
            try:
                # Hcemos que se esperar hasta que el Next este visible
                boton = WebDriverWait(driver, 10).until(
                    EC.visibility_of_element_located((By.XPATH, "//a[contains(text(), 'Next')]")) # Busca un en lace (a) que contenga el tecto Next
                )
                boton.click()  # Hacer clic en el enlace
                time.sleep(3)  # Para esperar a que cargue la página
            except Exception as e: # Por si hay algun porblema y no podamos pasar a la siguiente pagina
                print(f"Hubo un problema para pasar a la siguiente pagina")  
                exit() # Nos salimos si ha dado problema
        driver.quit()

        return datos