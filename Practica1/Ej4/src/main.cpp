//Ej 4
#include <iostream>
#include "Cliente.h"
#include "FilterManager.h"
#include "ChatTarget.h"
#include "FilterChain.h"
#include "FiltroCorreo.h"
#include "FiltroContraCarac.cpp"
#include "FiltroContraNum.h"
#include "FiltroContraMayus.h"
using namespace std;

int main(int argc, char *argv[] ){

    ChatTarget chatTarget= new ChatTarget();
    FilterManager filtermanager= new FilterManager();
    filtermanager.addFilter(new FiltroCorreo());
    filtermanager.addFilter(new FiltroContraCarac());
    filtermanager.addFilter(new FiltroContraMayus());
    filtermanager.addFilter(new FiltroContraNum());
    
    Cliente client= new Cliente(filtermanager);


    string correo, contraseña;

    cout << "Introduzca una dirección de correo: " << endl;
    cin >> correo;
    cout << "Introduzca una contraseña: " << endl;
    cin >> contraseña;

}