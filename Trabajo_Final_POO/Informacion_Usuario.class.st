Class {
	#name : #'Informacion_Usuario',
	#superclass : #'Opciones_Usuario',
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Informacion_Usuario >> agregarBoton [
atras mouseAction: [ Acciones_Usuario crearVentana_titulo:(UsuarioRecibido  getNombre).self cerrar ].
]

{ #category : #initialization }
Informacion_Usuario >> initialize [ 
super initialize .
self mostrarInformacion;agregarBoton  .
]

{ #category : #propios }
Informacion_Usuario >> mostrarInformacion [
|listaInformacion listaPrestamo auxiliar botonDer botonIzq posItem dimCol titulo|.
titulo:=StringMorph new.
titulo contents: 'PRESTAMOS QUE EL USUARIO REALIZO'.
auxiliar:=MiSistema bibliotecaDondeRealizoPrestamo: UsuarioRecibido .
posItem :=1.
dimCol := auxiliar size.

"botones"
botonDer:=BotonAccion 
							crearBoton_nomb: '->' 
							yDimension:25@20  
							yColor: Color pink.
botonIzq:=BotonAccion 
							crearBoton_nomb: '<-' 
							yDimension:25@20  
							yColor: Color pink.
"registros"
listaInformacion := MostrarRegistro 
							crearRegistro_Dimension: 305@140 
							yPosicion: (20@30).
listaPrestamo := MostrarRegistro 
							crearRegistro_Dimension: 400@200 
							yPosicion: (listaInformacion bottomLeft  + (0@35) ).					
"agregarMorph"

self addMorph:listaInformacion;
	  addMorph:listaPrestamo;
	  addMorph:titulo.
listaPrestamo addMorph:botonIzq;addMorph:botonDer.
botonDer position:listaPrestamo  bottomRight-botonDer extent-(13@5)-(4@0).
botonIzq position:botonDer position - (40@0)+(8@0).
titulo position:listaPrestamo topLeft -(0@20).
""
listaInformacion setText:(UsuarioRecibido aTexto).
auxiliar ifEmpty: [listaPrestamo setText:'NO REALIZO PRESTAMOS EN NINGUNA BIBLIOTECA'  ] ifNotEmpty: [ 
listaPrestamo setText:((auxiliar at:posItem)getNombreEstablecimiento,String cr ,(MiSistema colATexto:((auxiliar at:posItem)retornarTodosLosPrestamosDe_unUsuario: UsuarioRecibido ))).
botonDer mouseAction: [  posItem :=posItem + 1.
										(posItem<=(dimCol))ifTrue:[listaPrestamo setText:((auxiliar at:posItem)getNombreEstablecimiento,String cr ,(MiSistema colATexto:((auxiliar at:posItem)retornarTodosLosPrestamosDe_unUsuario: UsuarioRecibido ))).]ifFalse:[posItem :=posItem - 1 ]].
									
botonIzq mouseAction: [  posItem :=posItem - 1 .
										(posItem>=1)ifTrue: [listaPrestamo setText:((auxiliar at:posItem)getNombreEstablecimiento,String cr ,(MiSistema colATexto:((auxiliar at:posItem)retornarTodosLosPrestamosDe_unUsuario: UsuarioRecibido ))).]ifFalse:[posItem :=posItem + 1]].
	 ].

									
]
