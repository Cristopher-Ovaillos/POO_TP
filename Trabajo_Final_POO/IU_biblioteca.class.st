"
Esta clase permite acceder a las opciones relacionadas con bibliotecas.
"
Class {
	#name : #'IU_biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'bibliotecaSistema',
		'registrarBibliteca'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #propios }
IU_biblioteca >> agregarBotones [ 

bibliotecaSistema:=BotonAccion crearBoton_nomb: 'ACCEDER A BIBLIOTECA' yDimension:400@50  yColor: Color pink.
registrarBibliteca:=BotonAccion crearBoton_nomb: 'REGISTRAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.
"POSICION Y AÑADIR AL MORPH"

self addMorph: bibliotecaSistema ; addMorph: registrarBibliteca. 
registrarBibliteca position:50@155.
bibliotecaSistema position: registrarBibliteca position + (0@80).

"ACCION BOTON"

registrarBibliteca mouseAction: [ Registrar_Biblioteca crearVentana_titulo:  'REGISTRAR BIBLIOTECA'.
	self cerrar.  ].
bibliotecaSistema mouseAction: [ Elegir_Biblioteca crearVentana_titulo: 'MODIFICAR BIBLIOTECA' .
	self cerrar. ].
atras mouseAction: [  MenuPrincipal crearMenu_sistema:MiSistema. self cerrar].
]

{ #category : #initialization }
IU_biblioteca >> initialize [ 
super initialize .
self agregarBotones .

]
