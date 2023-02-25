"
Esta clase permite elegir uan biblioteca el cual queremos realizar acciones como eliminar o agregar libros.
"
Class {
	#name : #'Elegir_Biblioteca',
	#superclass : #VentanaO,
	#instVars : [
		'botonSeleccionar'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #accessing }
Elegir_Biblioteca >> agregarBotones [
|lista listaBibliteca informacion botonDer botonIzq posItem dimCol|.
"creo un diccionario y va estar compuesto por el nombre de la biblioteca y la instancia de la biblioteca"
posItem :=1.
dimCol:=(MiSistema getBibliotecas)size.
lista:=Dictionary new.

(MiSistema getBibliotecas) do:[:biblioteca| lista at:(biblioteca getNombreEstablecimiento)put:biblioteca].

listaBibliteca:=SeleccionarOpcion new.
	listaBibliteca extent:400@60;list: (lista keys). 
	listaBibliteca position:50@50.
	listaBibliteca ghostText: 'SELECCIONA LA BIBLIOTECA A MODIFICAR'.
""
informacion:=MostrarRegistro 
							crearRegistro_Dimension: 400@220 
							yPosicion: listaBibliteca position +(0@100) .
botonDer:=BotonAccion 
							crearBoton_nomb: '->' 
							yDimension:25@20  
							yColor: Color pink.
botonIzq:=BotonAccion 
							crearBoton_nomb: '<-' 
							yDimension:25@20  
							yColor: Color pink.

botonSeleccionar :=BotonAccion 
							crearBoton_nomb: 'SELECCIONAR' 
							yDimension:100@20  
							yColor: Color pink.
							
botonSeleccionar position: 385@415.
botonDer position:informacion bottomRight-botonDer extent-(0@5)-(4@0).
botonIzq position:botonDer position - (375@0)+(8@0).

self addMorph:informacion.
self addMorph:listaBibliteca.
self addMorph: botonSeleccionar .
informacion addMorph:botonIzq;addMorph:botonDer.
"accion"
informacion setText:((MiSistema getBibliotecas)at:1)aTexto .
(listaBibliteca) ifNotNil:[
    botonSeleccionar mouseAction: [
	"lista es el diccionario y listaBiblitoca el seachMorph"
	(listaBibliteca selectedItem)ifNotNil: [ Opciones_Biblioteca asignarBiblioteca: (lista at:(listaBibliteca selectedItem)).
		Modificar_bibliteca crearVentana_titulo:(listaBibliteca  selectedItem).
      self cerrar. ].
		

        ].
    ].

atras mouseAction: [ IU_biblioteca  
							crearVentana_titulo: 'BIBLIOTECA'.self cerrar.  ].

botonDer mouseAction: [  posItem :=posItem + 1 .
										(posItem<=(dimCol) )ifTrue: [informacion setText:((MiSistema getBibliotecas)at:posItem)aTexto  ]ifFalse:[posItem :=posItem - 1 ]].
									
botonIzq mouseAction: [  posItem :=posItem - 1 .
										(posItem>=1)ifTrue: [informacion setText:((MiSistema getBibliotecas)at:posItem)aTexto  ]ifFalse:[posItem :=posItem + 1]    ].

]

{ #category : #initialization }
Elegir_Biblioteca >> initialize [ 
super initialize .
self agregarBotones .
]
