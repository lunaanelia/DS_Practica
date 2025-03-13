#include <iostream>
#include "Filter.h"
#include "FiltroContraNum.h"
using namespace std;

//Tendra que tener al menos un caracter numérico para que de la contraseña como correcta
bool FiltroContraNum::comprueba(string texto){

       for(int i=0; i<texto.length(); i++){
            if( isdigit(texto[i]) )
                return true;
       }

        //Si ha llegado hasta aqui no contiene caracteres numéricos
        cout << "Debe contener al menos un caracter numérico" << endl;
        return false;
}
