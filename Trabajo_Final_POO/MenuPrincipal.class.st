Class {
	#name : #MenuPrincipal,
	#superclass : #BorderedMorph,
	#instVars : [
		'botonUsuario',
		'botonBiblioteca',
		'botonCerrar',
		'miSistema'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
MenuPrincipal class >> crear [
|menu|.
menu:=self new.
menu agregarSistema: Sistema_Gestor crearSistemaAUsar.
menu openCenteredInWorld.
]

{ #category : #'as yet unclassified' }
MenuPrincipal class >> crearMenu_sistema:sis [
|menu|.
menu:=self new.
menu agregarSistema: sis.
menu openCenteredInWorld.
]

{ #category : #propios }
MenuPrincipal >> agregarSistema: unSistema [
miSistema  :=unSistema.
VentanaO asignarSistema: miSistema.
]

{ #category : #propios }
MenuPrincipal >> cerrar [ 
self delete.
]

{ #category : #propios }
MenuPrincipal >> fondoParaMiVentana [
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

"|fondo|.
fondo:=(Form fromFileNamed: 'C:\Users\asdf\Downloads\marcos\marco1.png') asMorph.
self extent: fondo extent .
	self addMorphBack: fondo."

]

{ #category : #initialization }
MenuPrincipal >> initialize [ 

super initialize .
self fondoParaMiVentana.
self mostrarBotonesyTitulos .
]

{ #category : #propios }
MenuPrincipal >> mostrarBotonesyTitulos [
|titulo a|
a:=StringMorph new.
a contents:'nulo'.
"titulo"
titulo:=StringMorph new.
titulo contents:'Sistema Gestor'.
"botones"
botonUsuario:=BotonAccion crearBoton_nomb: 'USUARIO' yDimension:400@50  yColor: Color pink .
botonBiblioteca:=BotonAccion crearBoton_nomb: 'BIBLIOTECA' yDimension:400@50  yColor: Color pink .
botonCerrar  := BotonAccion crearBoton_nomb: ' X' yDimension: 25@25 yColor: Color white .
"agrego al morf"
self addMorph:botonUsuario.
self addMorph: botonBiblioteca .
self addMorph: botonCerrar .
self addMorph: titulo.
"elijo una posicion"
botonCerrar position: 450@13.
botonUsuario position: 50@155.
botonBiblioteca  position: botonUsuario position + (0@80).
titulo position: 200@15.
"acciones"
botonBiblioteca mouseAction: [ IU_biblioteca crearVentana_titulo: 'BIBLIOTECA'.self cerrar.].
botonUsuario mouseAction: [IU_usuario  crearVentana_titulo: 'USUARIO' .self cerrar.].
botonCerrar mouseAction: [ self cerrar.].

]
