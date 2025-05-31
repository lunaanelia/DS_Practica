import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/contexto.dart';
import 'package:libros_pelis/estrategia_titulo.dart';
import 'package:libros_pelis/estrategia_autor.dart';
import 'package:libros_pelis/estrategia_fecha.dart';
import 'package:libros_pelis/factoria.dart';

void main(){

  group("BD", (){

    test("Eliminar", ()async{
      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      await gestor.cargarTodosProductos();

      var num=gestor.getProductos().length;

      Producto peli=Producto(null,true,"test","test","12-4-2000","test");
      await gestor.agregar(peli);
      List<Producto> tmp= await contexto.buscar(true,"test");

      await gestor.eliminar(tmp[0]);

      await gestor.cargarTodosProductos();

      expect(gestor.getProductos().length, equals(num));  //Tiene el mismo numero de productos que tenia antes
    });

    test("Que no se puedan crear productos duplicados", ()async{
      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      Producto peli=Producto(null,true,"test","test","12-4-2000","test");
      await gestor.agregar(peli);

      expect(() async => await gestor.agregar(peli), throwsA(isA<Exception>()));

      List<Producto> tmp= await contexto.buscar(true,"test"); //Lo borra al acabar el test

      await gestor.eliminar(tmp[0]);

    });

    test("conexion",() async{
      Gestor g = Gestor();
      bool s = await g.cargarTodosProductos();
      expect(s, true);
    });

    test("Aniadir producto a la base de datos", ()  async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());

      //Primero  busca si existe el libro que voy a añadir y si lo encuentra lo borra
      //Esto se hace para que pase el test y no de error al agregar un libro que ya esta
      //Busca si ya existe el libro
      List<Producto> tmp= await contexto.buscar(false,"Peter Pan");

      if(tmp.isNotEmpty){
        await g.eliminar(tmp[0]);
      }


      Producto libro = Producto(null, false, "Peter Pan", " J. M. Barrie", "27-12-1904", "Peter Pan y Wendy, Peter Pan, o el niño que no quería crecer, es una obra teatral y una novela para niños escrita por el escritor escocés James M. Barrie.");
      await g.agregar(libro);

      List<Producto> resultado = await contexto.buscar(false, "Peter Pan");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("Peter Pan"));

    });

    test("Modificar un producto de la base de datos", ()  async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());

      List<Producto> tmp2= await contexto.buscar(true, "Las crónicas de Narnia: la travesía del Viajero del Alba");
      if(tmp2.isNotEmpty){
        await g.eliminar(tmp2[0]);
      }

      //Añade el producto
      Producto l = Producto(null, true, "Las crónicas de Narnia", "Test", "03-12-2010", "Los hermanos Edmund y Lucy Pevensie, junto a su primo Eustace, se embarcan en la nave El Viajero del Alba en busca de los siete caballeros expulsados del reino por Miraz, tío de Caspian y usurpador del trono de Narnia.");
      await g.agregar(l);

      List<Producto> tmp= await contexto.buscar(true, "Las crónicas de Narnia");

      Producto libro= tmp[0];

      await g.modificarTitulo(libro, "Las crónicas de Narnia: la travesía del Viajero del Alba");

      List<Producto> resultado = await contexto.buscar(true, "Las crónicas de Narnia: la travesía del Viajero del Alba");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("Las crónicas de Narnia: la travesía del Viajero del Alba"));

    });

  });


  group("Busqueda",(){

    test("Busqueda por autor",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      //Busca si ya existe la peli
      List<Producto> tmp= await contexto.buscar(true,"Bella");

      if(tmp.isNotEmpty){
        await gestor.eliminar(tmp[0]);
      }


      Producto peli=Producto(null,true,"Crepusculo","Bella","12-4-2000","Bella, where the hell have you been loca?");
      await gestor.agregar(peli);
      List<Producto> res= await contexto.buscar(true,"Bella");

      expect(res.length, equals(1));
      expect(res[0].autor, equals("Bella"));
    });

    test("Busqueda por fecha",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaFecha());

      //Busca si ya existe la peli
      List<Producto> tmp= await contexto.buscar(true,"12-4-2000");

      if(tmp.isNotEmpty){
        await gestor.eliminar(tmp[0]);
      }


      Producto peli=Producto(null,true,"Crepusculo","Bella","12-4-2000","Bella, where the hell have you been loca?");
      await gestor.agregar(peli);
      List<Producto> res= await contexto.buscar(true,"12-4-2000");

      expect(res.length, equals(1));
      expect(res[0].autor, equals("Bella"));
    });

    test("Busqueda sin coincidencias devuelve vacio",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      List<Producto> res= await contexto.buscar(true,"Test_busqueda");

      expect(res.length, equals(0));
    });

    test("Busqueda por titulo", () async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());

      //Busca si ya existe el libro
      List<Producto> tmp= await contexto.buscar(false,"La casa de Bernarda Alba");

      if(tmp.isNotEmpty){
        await g.eliminar(tmp[0]);
      }

      Producto libro = Producto(null, false, "La casa de Bernarda Alba", "Federico Garcia Lorca", "12-4-2000", "La obra refleja la situación social y política en España antes de la Guerra Civil.");
      await g.agregar(libro);
      List<Producto> resultado = await contexto.buscar(false, "La casa de Bernarda Alba");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("La casa de Bernarda Alba"));
    });

    test("Busqueda sin filtros",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      await gestor.cargarTodosProductos();

      List<Producto> res= await contexto.buscar(false, "");

      expect(res.length, gestor.getProductos().where((p)=> p.esPeli==false).length);  //Comprueba solo el numero con los libros
    });

  });

  group("Factoria", (){

    test("Crear una pelicula con factoria", ()  async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());
      Factoria fact = Factoria(g);

      await g.cargarTodosProductos();



      //Primero  busca si existe el libro que voy a buscar y si lo encuentra lo borra
      //Esto se hace para que pase el test y no de error al agregar un libro que ya esta
      //Busca si ya existe el libro
     List<Producto> tmp= await contexto.buscar(true,"Jurassic World");

      if(tmp.isNotEmpty){
        await g.eliminar(tmp[0]);
      }

      await g.cargarTodosProductos();


      await fact.crearProducto("pelicula", "Jurassic World", "Colin Trevorrow", "10-06-2015", "Han pasado 22 años desde que el millonario John Hammond clonara el primer dinosaurio. Con tecnologías mejoradas y nuevas medidas de seguridad, el parque temático Jurassic World abre sus puertas.");

      List<Producto> resultado = await contexto.buscar(true, "Jurassic World");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("Jurassic World"));

    });

    test("Factoria incorrecta da error",(){
      Gestor gestor= Gestor();

      Factoria factoria= Factoria(gestor);

      expect( () => factoria.crearProducto("coche", "brum brum", "paco", "12-4-2020", "kachau"),throwsA(isA<ArgumentError>()));
    });

  });

}