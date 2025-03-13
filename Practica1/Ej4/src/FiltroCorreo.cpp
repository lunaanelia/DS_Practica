#include <iostream>
#include "Filter.h"
#include <string>
using namespace std;

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo : public Filter{

    private:

    bool Dominio(string cad, string dominio){

        for(int i=0; i<cad.length(); i++){
            if(cad[i]!=dominio[i])
                return false;
        }

        return true;    //Si ha llegado hasta aqui el dominio es correcto

    }

    public:

    bool comprueba(string texto){

        bool enc=false; //true cuando encuentra el @

        for(int i=0; i<texto.length() && !enc; i++){
            if(texto[i]=='@'){
                enc=true;
                if(i==0){
                    cout << "Debes incluir texto antes del @" << endl; //Informa del error
                    return false;
                }
                else{   //Comprueba el numero de caracteres que le quedan y dependiendo de eso ve si el dominio es gmail, hotmail o esta mal

                    int num_car= texto.length() - i - 1;
                    string dominio= texto.substr(i);
                    const string gmail="gmail.com";
                    const string hotmail="hotmail.com";

                    if( num_car==9 ){
                       if ( Dominio(dominio,gmail) )
                            return true;
                    }
                    else if( num_car==11 ){    
                        if ( Dominio(dominio,hotmail) )  
                        return true;
                    }
        
                    //Si ha llegado hasta aqui el dominio está mal
                    cout << "No es un dominio válido" << endl;
                    return false;
                }
                
            }
        }
        
        //Si ha llegado hasta aqui es que no contiene un @
        cout << "No es un formato válido de texto" << endl;
        cout << "Debe ser: <nombre>@<dominio> " << endl;
        cout << "Siendo el dominio: gmail.com o hotmail.com" << endl;
        return false;
    }

};