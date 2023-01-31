Class {
	#name : #AgregarLibro,
	#superclass : #'Opciones_Biblioteca',
	#instVars : [
		'datoNombre',
		'datoEditorial',
		'datoAnioEd',
		'botonAgregar',
		'tipoLibro',
		'datoNombreA',
		'datoApellido',
		'botonTipo',
		'datoExtra',
		'colAutores',
		'nombreAutor',
		'apellidoAutor',
		'registroAutor',
		'agregarAutor'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #accessing }
AgregarLibro >> agregarBotones [
|advertencia colA string libro exito|.
exito:=false.
string:=''.
colA:=OrderedCollection new.
advertencia :=StringMorph new.
advertencia contents:''.
""
botonTipo:=BotonAccion crearBoton_nomb: '→' yDimension:20@15  yColor: Color pink.
botonTipo position: tipoLibro position +(150@2).
agregarAutor :=BotonAccion crearBoton_nomb: 'AgregarAutor' yDimension:100@20   yColor: Color pink.
agregarAutor position: registroAutor position +(120@110).
advertencia position:tipoLibro position +(0@220).
botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR' yDimension:100@20  yColor: Color pink.
botonAgregar position: 385@415.
self addMorph:botonAgregar.
self addMorph:botonTipo.
self addMorph:advertencia.
self addMorph:agregarAutor.
"ACCION BOTON AGREGAR AUTOR"

	agregarAutor mouseAction: [  
	(nombreAutor isNotEmpty & apellidoAutor isNotEmpty )ifTrue:[
		|autor|.
		autor:=( Autor crearAutor_nombre: (nombreAutor input ) yApellido:(apellidoAutor input)).
		(MiSistema existeAutor: autor)ifFalse:[
			"no existe el autor"
			MiSistema agregarAutor: autor.
			].
		colA add:autor.
		string:=string,(autor aTexto).
		registroAutor setText:string.
		nombreAutor clear.
		apellidoAutor clear.
		].
	].
"ACCION BOTON TIPO"

	botonTipo mouseAction: [ 
	
	tipoLibro selectedItem = 'Libro electronico' 
    ifTrue: [      datoExtra clear.      datoExtra ghostText: 'Formato'.      self addMorph: datoExtra.    ].
  tipoLibro selectedItem = 'Libro impreso' 
    ifTrue: [      datoExtra clear.      datoExtra ghostText: 'Cantidad de paginas'.      self addMorph: datoExtra.    ].
  tipoLibro selectedItem = 'Audio Libro' 
    ifTrue: [      datoExtra clear.      datoExtra ghostText: 'Duracion'.      self addMorph: datoExtra.    ].
  datoExtra position: tipoLibro position + (0@40).
	
	 ].

"ACCION BOTON AGREGAR"

botonAgregar mouseAction:[
	(datoNombre isNotEmpty  & datoEditorial isNotEmpty & datoAnioEd isNotEmpty & ((tipoLibro selectedItem)isNotNil)& (colA isNotEmpty) )ifTrue:[
		
		(MiSistema verSiEsFecha:(datoAnioEd input))ifTrue:[
			 "es una fecha"
			self removeMorph: advertencia.
			
	((tipoLibro selectedItem)='Libro fisico')ifTrue:[
		libro:=Libro crearLibro_nombre: (datoNombre input) yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input).
		exito:=true.
		]ifFalse:[
		(datoExtra isNotEmpty)ifTrue:[
			"se introdujo el dato"
			exito:=true.
		((tipoLibro selectedItem)= 'Libro electronico')ifTrue:[
		libro:=(Libro_Electronico crearLibroElectronico_nombre:(datoNombre input)  yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input)yFormato:(datoExtra input)).
		]. 
	((tipoLibro selectedItem)= 'Libro impreso')ifTrue:[
		libro:=(Libro_Impreso crearLibroImpreso_nombre:(datoNombre input)  yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input)yCantidad:(datoExtra input)).
		]. 
	((tipoLibro selectedItem)= 'Audio Libro')ifTrue:[
		libro:=(Audio_Libro crearAudioLibro_nombre:(datoNombre input)  yEditorial:(datoEditorial input)  yAnio_Edicion:(datoAnioEd input)yDuracion:(datoExtra input)) .	
		]. 	
		"fin"	
			].
		"fin ifFalse:"
		].
	"si se completo todos los datos exito es true"
	exito ifTrue:[
		"elimino todo los componentes en comun o sentencias"
			exito:=false.
			libro agregarAutores: colA.
	 		BiblioRe agregarLibro:libro.	
			"limpio"
			self removeMorph: datoExtra.
			registroAutor setText:''.
			colA removeAll.
			string :=''.
			datoExtra clear.
			datoNombre clear.
			datoEditorial clear.
			datoAnioEd clear.		
		].
		
		
	 ]ifFalse:[
		"no es una fecha"
		advertencia contents:'No es una fecha'.
		self addMorph:advertencia.
		].	
	"FIN DEL MENSAJE MiSistema verSiEsFecha:(datoAnioEd input)"	
	].
].
"FIN "
atras mouseAction: [ Modificar_bibliteca crearOpcion_titulo:(BiblioRe getNombreEstablecimiento)  yBiblioteca:BiblioRe.self cerrar ].


]

{ #category : #accessing }
AgregarLibro >> agregarCampos [ 
|tipos|.
tipos:=OrderedCollection new.
tipos add:'Libro fisico'.
tipos add:'Libro electronico'.
tipos add:'Libro impreso'.
tipos add:'Audio Libro'.

"declaro el tipo a los campos"
datoNombre:=IntroducirDato crearDialogo_tamanio: 150@10.
datoEditorial:=IntroducirDato crearDialogo_tamanio: 150@10.
datoAnioEd :=IntroducirDato crearDialogo_tamanio: 150@10.
nombreAutor :=IntroducirDato crearDialogo_tamanio: 200@10.
registroAutor:=MostrarRegistro crearRegistro_Dimension:220@100 yPosicion:(registro position  +(0@210)).
datoExtra :=IntroducirDato crearDialogo_tamanio: 200@10.
apellidoAutor :=IntroducirDato crearDialogo_tamanio: 200@10.
nombreAutor ghostText: 'Ingrese el Nombre del autor'.
apellidoAutor ghostText: 'Ingrese el Apellido del autor'.
tipoLibro :=SearchMorph new.
tipoLibro extent:140@20;searchList: tipos;ghostText: 'Seleccione el tipo'.
"agrego a la ventana"
self addMorph: datoNombre  ;addMorph: datoEditorial ; addMorph: datoAnioEd;addMorph: tipoLibro;addMorph:registroAutor;addMorph: apellidoAutor ;addMorph: nombreAutor  .
"posicion"
datoNombre position: self position + (50@50).
datoEditorial position: datoNombre position + (0@50).
datoAnioEd position: datoEditorial position + (0@50).
tipoLibro position: datoAnioEd position + (0@50).
nombreAutor position:tipoLibro position + (0@80).
apellidoAutor position: nombreAutor position + (0@30).

datoExtra position: self position +tipoLibro position + (0@50).

]

{ #category : #accessing }
AgregarLibro >> agregarTitulo [
|titulo1 titulo2 titulo3 titulo4|.
titulo1 :='Ingrese el nombre' asMorph .
titulo2:='Ingrese la editorial' asMorph .
titulo3:='ingrese el Año de edicion |YYYY-MM-DD' asMorph.
titulo4 :='Seleccione el tipo del libro' asMorph.

self addMorph:titulo1;addMorph:titulo2;addMorph:titulo3; addMorph: titulo4.

titulo1 position: datoNombre position-(0@20).
titulo2 position: datoEditorial position-(0@20).
titulo3 position: datoAnioEd  position-(0@20).
titulo4 position: tipoLibro position-(0@20).

]

{ #category : #initialization }
AgregarLibro >> initialize [ 
super initialize.
BiblioRe addDependent: self.
self update: (BiblioRe getColLibro).
self agregarCampos ;agregarTitulo;agregarBotones.

]
