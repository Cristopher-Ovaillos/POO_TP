"
Esta clase cuando se crea se le tiene que pasar como parametro al contructor el titulo de esta venta y el sistema
"
Class {
	#name : #VentanaO,
	#superclass : #BorderedMorph,
	#instVars : [
		'cerrar',
		'registro',
		'atras'
	],
	#classVars : [
		'MiSistema'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
VentanaO class >> crearOpcion_titulo: tit ySistema: sistem [
|opcion|.
opcion:=self new.
opcion agregarSistema: sistem.
opcion agregarTitulo: tit.
opcion openCenteredInWorld.

]

{ #category : #'as yet unclassified' }
VentanaO class >> crearVentana_titulo: tit [ 
|opcion|.
opcion:=self new.
opcion agregarTitulo: tit.

opcion openInWorld .
]

{ #category : #propios }
VentanaO >> agregarSistema: sis [
MiSistema :=sis.
]

{ #category : #propios }
VentanaO >> agregarTitulo: tit [

	| titulo |
	titulo := tit asMorph.
	self addMorph: titulo.
	titulo position: 200@15.
	
]

{ #category : #propios }
VentanaO >> cerrar [ 
self delete.
]

{ #category : #propios }
VentanaO >> fondoParaMiVentana [
	|a b|.
a:=Morph new.
a extent:500@450.
a color:Color pink.
b:=Morph new.
b extent:485@435.
b color:Color white.
a addMorph:b.
b position: a position +(7.5@8) .
self extent: a extent .
	self addMorphBack: a.
]

{ #category : #propios }
VentanaO >> fondoParaMiVentana:ruta [
|fondo|.
fondo:=(Form fromFileNamed: ruta) asMorph.
self extent: fondo extent.
	self addMorphBack: fondo.
]

{ #category : #initialization }
VentanaO >> initialize [ 
super initialize .
self fondoParaMiVentana .
"botones"
cerrar := BotonAccion crearBoton_nomb: ' X' yDimension: 25@25 yColor: Color white .
cerrar position: 450@13.
atras:=BotonAccion crearBoton_nomb: 'ATRAS' yDimension:100@30  yColor: Color pink.
atras position:self position +(10@410).

"registro de una coleccion"
registro := MostrarRegistro crearRegistro_Dimension: 220@200 yPosicion: (self position +(260@40)).
self addMorph: cerrar;addMorph:atras.
cerrar mouseAction: [ self cerrar ].
]

{ #category : #updating }
VentanaO >> update: unObjeto [
"en Smalltalk Pharo significa que un objeto se hace de solo lectura, lo que significa que su estado no se puede modificar. Una vez que un objeto se hace de solo lectura, cualquier intento de cambiar su estado generará una excepción."
(unObjeto isEmpty)ifTrue: [
	registro setText: 'Esperando datos'.]
ifFalse:[
		registro setText:(MiSistema colATexto: unObjeto)asString.
].
self addMorph:registro.

]
