"
Esta clase esta relacionada con los prestamos que el usuario crea y los libros que este contiene.
	Esta clase contiene las siguientes:
    Instance Variables
	colLibro:		<Libro>
	colPrestamoActivo:		<Prestamo>
	colPrestamoInactivo:		<Prestamo>
	diasParaPrestar:		<int>
	direccion:		<string>
	identificador:		<string>
	nombre:		<string>
	nombre_Representante:		<string>
	telefono_Contacto:		<string>
cuando un usuario realiza un prestamo este pasa a una coleccion de prestamos activos y cuando lo devuelve este pasas a una coleccion de prestamo inactivos al pasar a esta coleccion se modifica la fecha del prestamo osea se modifica la fecha_entrega el cual tendra Date today. Y luego al usuario se  le enviara un mensaje para asignar un valor a fecha_multa el cual es utilizado con el Date today y sumando el diasParaPrestar.
"
Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'colPrestamoActivo',
		'direccion',
		'nombre',
		'telefono_Contacto',
		'nombre_Representante',
		'diasParaPrestar',
		'colLibro',
		'colPrestamoInactivo'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Biblioteca class >> crearBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
|biblioteca|.
biblioteca :=self new.
biblioteca inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar.
^biblioteca .
]

{ #category : #propios }
Biblioteca >> aTexto [ 
|texto|.
texto :=''.
texto:='Identificador: ',identificador asString,String cr,'Direccion: ',direccion asString ,String cr,'Nombre Establecimiento: ',nombre asString,String cr,'Num Contacto: ',telefono_Contacto asString,String cr, 'Nombre Representante: ',nombre_Representante asString,String cr, 'Cantidad de libros registrados: ', (colLibro size)asString,String cr, 'Prestamos activo: ', (colPrestamoActivo  size)asString,String cr,'Prestamos inactivo: ', (colPrestamoInactivo size)asString,String cr,'Dias para prestar: ', diasParaPrestar ,String cr. 
^texto.
]

{ #category : #propios }
Biblioteca >> agregarLibro: unLibro [

colLibro add: unLibro  .
self changed:colLibro.


]

{ #category : #propios }
Biblioteca >> agregarPrestamo: unPrestamo [

colPrestamoActivo add: unPrestamo .
self changed:colPrestamoActivo.
]

{ #category : #propios }
Biblioteca >> biblioteca_ID: unID [

^(unID = identificador).
]

{ #category : #propios }
Biblioteca >> devolverPrestamo:unUsuario [
"elimino un prestamo para pasarlo aun colPrestamoInactivo"

self eliminarPrestamo: (self retornarPrestamo_Usuario: unUsuario).
]

{ #category : #'as yet unclassified' }
Biblioteca >> devolverPrestamoAudioLibro:unUsuario [
|auxiliar|.
"elimino un prestamo para pasarlo aun colPrestamoInactivo"
auxiliar :=self retornarPrestamoAudioLibro_Usuario: unUsuario .
(auxiliar )ifNotNil: [
	self eliminarPrestamo: auxiliar .
].

]

{ #category : #propios }
Biblioteca >> eliminarLibro:unLibro [
colLibro remove:unLibro.
self changed: colLibro .
]

{ #category : #'as yet unclassified' }
Biblioteca >> eliminarPrestamo:unPres [


colPrestamoInactivo add:(unPres).
colPrestamoActivo remove:(unPres).

self changed:colPrestamoActivo.
self changed:colPrestamoInactivo.


]

{ #category : #observadores }
Biblioteca >> getColLibro [

^colLibro.
]

{ #category : #observadores }
Biblioteca >> getFechaDiasParaPrestar [
^diasParaPrestar.
]

{ #category : #observadores }
Biblioteca >> getId [
^identificador .
]

{ #category : #observadores }
Biblioteca >> getNombreEstablecimiento [
^nombre asString .
]

{ #category : #observadores }
Biblioteca >> getPrestamo [
^ colPrestamoActivo .
]

{ #category : #Inicializador }
Biblioteca >> inicializadorBiblioteca_id: ident yDireccion: dir yNombre: nomb yTelContacto: numC yRepresentante: nomR yDiasParaPrestar: dPrestar [
colLibro :=OrderedCollection new.
colPrestamoActivo :=OrderedCollection new.
colPrestamoInactivo :=OrderedCollection new.
identificador :=ident.
direccion := dir.
nombre := nomb.
telefono_Contacto := numC.
nombre_Representante := nomR .
diasParaPrestar :=dPrestar.

]

{ #category : #propios }
Biblioteca >> metodoAux_Crear: coleccionDeLibros yUsuario: unUsuario [

	| prestamo dias |
	dias := diasParaPrestar asNumber.
	(coleccionDeLibros notEmpty and: [ coleccionDeLibros size <= 5 ]) 
		ifFalse: [ ^ self ].
	prestamo := Prestamo
		            crearP_ColLibro: coleccionDeLibros
		            yFPrest: Date today
		            yUsuario: unUsuario.
	prestamo contieneAudioLibro ifTrue: [ dias := dias // 2 ].
	prestamo agregarFechaLimite: Date today + dias days.
	self agregarPrestamo: prestamo
]

{ #category : #propios }
Biblioteca >> moduloCrearPrestamo_Usuario: unUsuario yColLibro: unaColLibro [
|cLibro cAudioLibro|.
"separo los libros general y AudioLibro"
cLibro := unaColLibro select: [:libro | libro tipoLibro].
cAudioLibro:=unaColLibro reject:[:libro| libro tipoLibro].
""
self metodoAux_Crear: cLibro yUsuario: unUsuario .

(unUsuario tipoUsuario )ifFalse:[
	"es plus"
	self metodoAux_Crear: cAudioLibro yUsuario: unUsuario .
	].


]

{ #category : #propios }
Biblioteca >> registrarPrestamoUsuario: unUsuario clibros: cLibros [ 
|instancia |.
"si devuelve true puede hacer el prestamo"
(unUsuario verMulta)ifFalse:[
	"esto deveria devolver nulo para que pueda realizar la promo"
	(colPrestamoActivo)ifEmpty: [
		self moduloCrearPrestamo_Usuario: unUsuario  yColLibro: cLibros .
		unUsuario agregarFechaPosibleMulta: nil.
		]ifNotEmpty:  [
		"si noAptoParaPrestamo es true alguna vez no es apto para poder crear un prestamo"
	instancia :=((colPrestamoActivo)select:[:prest|(prest noAptoParaPrestamo: unUsuario)]).	
	(instancia)ifEmpty:  [
		self moduloCrearPrestamo_Usuario: unUsuario  yColLibro: cLibros .].	
		"si se puede crear el prestamo es porque cumplio las condiciones necesarias el usuario entonces la fechaMulta lo pongo nulo para que luego al devolver este prestamo sea rellenado nuevamente"
		unUsuario agregarFechaPosibleMulta: nil.
		]
	].	


]

{ #category : #'as yet unclassified' }
Biblioteca >> retornarPrestamoAudioLibro_Usuario: unUsuario [
     | prestamo |
    prestamo := colPrestamoActivo detect: [:p | (p mismoUsuarioPrestamo: unUsuario) and: [p contieneAudioLibro]] ifNone: [nil].
    ^prestamo
]

{ #category : #propios }
Biblioteca >> retornarPrestamo_Usuario: unUsuario [
    | prestamo |
    prestamo := colPrestamoActivo detect: [:p | (p mismoUsuarioPrestamo: unUsuario) and: [p noContieneAudioLibro]] ifNone: [nil].
    ^prestamo
]

{ #category : #'as yet unclassified' }
Biblioteca >> retornarTodosLosPrestamosDe_unUsuario:unUsuario [
"devuelve la instancia del prestamo que hizo el usuario.

select: y thenCollect: es un mensaje que se envía a una colección (como un Array) y retorna una nueva colección con los elementos que cumplen con el criterio especificado. En lugar de retornar una copia, retorna una instancia de la misma colección original
"
^(colPrestamoActivo) select: [:pres| pres mismoUsuarioPrestamo:  unUsuario] thenCollect: [:each | each].
]

{ #category : #'as yet unclassified' }
Biblioteca >> usuarios_con_prestamos_vencidos [
	| usuarios_retrasados |
	usuarios_retrasados := colPrestamoActivo select: [:prestamo | prestamo huboVencimiento] thenCollect: [:prestamo | prestamo getUsuarioP].
	^ usuarios_retrasados
]

{ #category : #propios }
Biblioteca >> verUsuarioRealizoPrestamo:unUsuario [
^colPrestamoActivo anySatisfy: [:prest | prest mismoUsuarioPrestamo: unUsuario]
]
