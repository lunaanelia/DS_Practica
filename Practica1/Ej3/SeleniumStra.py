# pip install selenium
import Strategy
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
# from selenium.webdriver.firefox.options import Options

import yaml 

class Selen():
    def extraer_datos(self, nombre, num):
        # options = Options()
        # options.headless = True  # Activar el modo headless NO abra ventana
        
        service = FirefoxService(executable_path = "/snap/bin/geckodriver")
        driver = webdriver.Firefox(service=service)
        driver.get("https://quotes.toscrape.com/")
        
        # Aquí puedes hacer cualquier interacción con la página
        
        page_number = 2

        # Buscar el enlace con el número de la página
        try:
            page_link = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.LINK_TEXT, "2"))
            )
            page_link.click()  # Hacer clic en el enlace
            time.sleep(3)  # Esperar a que cargue la página
        except Exception as e:
            print(f"No se pudo encontrar el enlace para la página {page_number}")

        
        citas = driver.find_elements(By.CLASS_NAME, "quote")


        # Recorrer todas las citas y mostrar el texto
        for cita in citas:
            autor = cita.find_element(By.CLASS_NAME, "author").text
            texto_cita = cita.find_element(By.CLASS_NAME, "text").text
            etiquetas = cita.find_elements(By.CLASS_NAME, "tag")
            
            etiquetas_texto = [etiqueta.text for etiqueta in etiquetas]

            print(f"Autor: {autor}")
            print(f"Cita: {texto_cita}")
            print(f"Etiquetas: {', '.join(etiquetas_texto)}")
            print("-" * 50)
        driver.quit()


def main():
    Selen().extraer_datos("archivo.yaml", 5)

if __name__ == "__main__":
    main()        
