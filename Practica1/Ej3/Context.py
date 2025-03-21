from Strategy import *



class context:
    def __init__(self, estrategia:Strategy):
        self.estrategia = estrategia

    def ejecutar(self, nombre, num):
        return self.estrategia.extraer_datos(nombre, num)


# def main():
#     BS = BeaSoup()
#     Sen = Selen()

    
#     contexto = context(Sen)
#     contexto.ejecutar("archivo.yaml", 2)

# if __name__ == "__main__":
#     main()