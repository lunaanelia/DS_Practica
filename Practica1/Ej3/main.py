from BeautilSoupStra import *
from SeleniumStra import *
from Context import *

def main():
    BS = BeaSoup()
    Sen = Selen()

    
    contexto = context(Sen)
    contexto.ejecutar("archivo.yaml", 2)

if __name__ == "__main__":
    main()