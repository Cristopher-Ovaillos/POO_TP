Class {
	#name : #'Modificar_bibliteca',
	#superclass : #'Opciones_Biblioteca',
	#instVars : [
		'botonAgregar',
		'botonEliminar',
		'datosBiblioteca',
		'botonInfo',
		'botonPrestamos',
		'botonUsuarioRetrasados'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #propios }
Modificar_bibliteca >> agregarBotones [
|titulo|.
titulo:=StringMorph new.
titulo contents:'INFORMACION/PRESTAMOS/USUARIOS ATRASADOS '.
	botonAgregar := BotonAccion
		                crearBoton_nomb: 'AGREGAR LIBROS A LA BIBLIOTECA'
		                yDimension: 400 @ 50
		                yColor: Color pink.
	botonEliminar := BotonAccion
		                 crearBoton_nomb: 'ELIMINAR LIBROS DE LA BIBLIOTECA'
		                 yDimension: 400 @ 50
		                 yColor: Color pink.
	datosBiblioteca :=MostrarRegistro 
							crearRegistro_Dimension: 400@200 
							yPosicion: 50 @ 200.
	botonInfo :=BotonAccion 
							crearBoton_nomb: 'INFORMACION BIBLIOTECA' 
							yDimension:150@30  
							yColor: Color pink.
	botonPrestamos  :=BotonAccion 
							crearBoton_nomb: 'PRESTAMOS BIBLIOTECA' 
							yDimension:150@30   
							yColor: Color pink.
   botonUsuarioRetrasados  :=BotonAccion 
							crearBoton_nomb: 'USUARIOS RETRASADOS' 
							yDimension:150@30   
							yColor: Color pink.
	"POSICION Y AÑADIR AL MORPH"
	self
		addMorph: botonAgregar;
		addMorph: botonEliminar;
		addMorph: datosBiblioteca;
		addMorph: botonPrestamos;
		addMorph: botonInfo;
		addMorph: botonUsuarioRetrasados;
		addMorph:titulo.
	botonAgregar position: 50 @ 50.
	botonEliminar position: botonAgregar position + (0 @ 55).
	titulo position:datosBiblioteca position- (0@20).
	botonPrestamos position:atras position +(330@0).
	botonInfo position: botonPrestamos position.
	botonUsuarioRetrasados position: botonPrestamos position.
	""

	botonAgregar mouseAction: [ 
		AgregarLibro
			crearVentana_titulo:BiblioRe getNombreEstablecimiento.
			self cerrar.
			].
	botonEliminar mouseAction: [ 
		EliminarLibro
			crearVentana_titulo:  BiblioRe getNombreEstablecimiento.
			self cerrar ].
	atras mouseAction: [
		IU_biblioteca   
			crearVentana_titulo: 'BIBLIOTECA'.
			self cerrar.  ].
	"datos"
	datosBiblioteca setText:(BiblioRe aTexto).
			botonInfo hide.botonPrestamos show.botonUsuarioRetrasados hide.
	
	botonInfo mouseAction: [datosBiblioteca setText:(BiblioRe aTexto). 
										botonInfo hide.botonPrestamos show.botonUsuarioRetrasados hide. ].
	
	botonPrestamos mouseAction:[datosBiblioteca setText:(MiSistema colATexto:(BiblioRe 												getPrestamo)),'___________________________________________________',String cr.
													botonInfo hide.botonPrestamos hide.botonUsuarioRetrasados show].
	botonUsuarioRetrasados mouseAction: [  
		datosBiblioteca setText:(MiSistema colATexto:(BiblioRe usuarios_con_prestamos_vencidos) ).
			botonInfo show.botonPrestamos hide.botonUsuarioRetrasados hide.
		].
	
]

{ #category : #initialization }
Modificar_bibliteca >> initialize [ 
super initialize .
self agregarBotones .
]
