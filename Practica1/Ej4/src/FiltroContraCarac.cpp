#include <iostream>
#include "Filter.h"
#include "FiltroContraCarac.h"
using namespace std;

//Tendra que tener un mínimo de 8 caracteres para que de la contraseña como correcta
bool FiltroContraCarac::comprueba(string texto){

        const int TAM_MIN=8;

        if(texto.length()<TAM_MIN){    //No tiene el tamaño mínimo
            cout << "Debe contener al menos 8 caracteres" << endl;
            return false;
        }
        else{
            return true;
        }
       
}