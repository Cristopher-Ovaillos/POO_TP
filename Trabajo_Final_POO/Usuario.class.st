"
Esta clase esta compuesto por:
    Instance Variables
	apellido:		<string>
	colBibibliotecaInter:		<Biblitoca>
	contraseña:		<string>
	dni:		<string>
	fechaMulta:		<Date>
	nombre:		<string>
	tipoUsuario:		<boolean>
para los usuarios no plus el tipo usuario es true.


"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'colBibibliotecaInter',
		'nombre',
		'fechaMulta',
		'apellido',
		'dni',
		'contraseña'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Usuario class >> crearU_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
|usuario|.
usuario :=self new.
usuario inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass.
^usuario .
]

{ #category : #propios }
Usuario >> aTexto [
|texto tipo a b|.
tipo:='USUARIO PLUS'.
a:=self verMulta.

(a)ifTrue:[
	"tiene multa"
	b:='Fecha fin multa: ', fechaMulta asString ,String cr, 'tiene multa'. ]
ifFalse: [
	"no tiene multa"
	b:='no tiene multa'. 
	fechaMulta :=nil].


self tipoUsuario  ifTrue: [ tipo:='USUARIO NO PLUS' ].


texto:='Nombre: ',nombre asString,String cr,
		 'Apellido: ',apellido asString ,String cr,
		 'DNI: ',dni asString,String cr,
		 tipo ,String cr,
		'Cantidad de Bibliotecas Agregadas: ',(colBibibliotecaInter size)asString,String cr,
		 b,String cr. 



^texto . 
]

{ #category : #propios }
Usuario >> actualizarColBiblioteca: unaCol [
"esto lo hago para cuando hago un cambio de usuario este mantenga la misma coleccion de biblioteca que tuvo interes"
colBibibliotecaInter:=unaCol.

]

{ #category : #propios }
Usuario >> agregarBibliotecaInteres:unaBiblio [
colBibibliotecaInter add:unaBiblio.
self changed:colBibibliotecaInter.

]

{ #category : #propios }
Usuario >> agregarFechaPosibleMulta:unaFecha [
fechaMulta :=unaFecha.
]

{ #category : #propios }
Usuario >> buscarUsuario_Dni: num yContraseña: password [ 

^ (((dni)=num)&((contraseña)=password)). 
]

{ #category : #Visualizadores }
Usuario >> getApellido [
^apellido .
]

{ #category : #Visualizadores }
Usuario >> getBibliotecaInteres [
^colBibibliotecaInter .
]

{ #category : #Visualizadores }
Usuario >> getContraseña [
"lo implemente para cuando cree un nuevo usuario este mantenga la misma contraseña"
^contraseña .
]

{ #category : #Visualizadores }
Usuario >> getDni [
^dni.
]

{ #category : #Visualizadores }
Usuario >> getNombre [ 
^nombre .
]

{ #category : #Inicializador }
Usuario >> inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
colBibibliotecaInter :=OrderedCollection new.
nombre := nomb.
apellido :=ape.
dni :=numDni .
contraseña :=pass .

]

{ #category : #propios }
Usuario >> noCumpleCondiciones_DNI: numDni [
|realizoPrest|.
realizoPrest :=false.
"este metodo se usa para saber si el numDni que viene por parametro que se lo envia la clase prestamo es igual al dni del usuario... osea si es igual es porque ya realizo un prestamo"
(dni = numDni)ifTrue: [ realizoPrest:=true ].
^realizoPrest .

]

{ #category : #accessing }
Usuario >> tipoUsuario [ 
^true.
]

{ #category : #propios }
Usuario >> verMulta [
"fechaMulta es una variable que indica hasta que dia esta multado"
|estaMultado|.
estaMultado := false.
"si no es nulo entonces no esta multado"
fechaMulta ifNotNil: [
"si el dia de hoy no supera a la fecha de multa entonces esta multado"
  (fechaMulta > Date today) ifTrue: [
    estaMultado := true.
  ]
].
^ estaMultado.

]
