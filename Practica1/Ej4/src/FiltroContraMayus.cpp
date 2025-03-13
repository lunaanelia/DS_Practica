#include <iostream>
#include "Filter.h"
#include "FiltroContraMayus.h"
using namespace std;


//Tendra que tener al menos una mayúscula para que de la contraseña como correcta
bool FiltroContraMayus::comprueba(string texto){

       for(int i=0; i<texto.length(); i++){
            if( isupper(texto[i]) )
                return true;
       }

        //Si ha llegado hasta aqui no contiene mayúsculas
        cout << "Debe contener al menos un caracter en mayúscula" << endl;
        return false;
}