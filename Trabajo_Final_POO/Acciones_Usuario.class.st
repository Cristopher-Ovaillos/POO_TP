Class {
	#name : #'Acciones_Usuario',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'botonTipo',
		'botonDevolver',
		'botonAgregar',
		'botonPrestamo',
		'botonInformacion'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #propios }
Acciones_Usuario >> agregarBotones [ 
|nota|.

nota:=StringMorph new.
nota contents:'CUANDO SE CAMBIA DE USUARIO A USUARIO PLUS DEBE VOLVER A INICIAR SESION'.
botonTipo :=BotonAccion crearBoton_nomb: ('CAMBIAR EL TIPO DE USUARIO') yDimension:400@50  yColor: Color pink.
botonAgregar :=BotonAccion crearBoton_nomb: 'AGREGAR BIBLIOTECA' yDimension:400@50  yColor: Color pink.

botonPrestamo :=BotonAccion crearBoton_nomb: 'REALIZAR PRESTAMO' yDimension:400@50  yColor: Color pink.
botonDevolver :=BotonAccion crearBoton_nomb: 'DEVOLVER PRESTAMO' yDimension:400@50  yColor: Color pink.
botonInformacion :=BotonAccion crearBoton_nomb: 'INFORMACION SOBRE USUARIO' yDimension:400@50  yColor: Color pink.
botonAgregar position:50@40.
botonPrestamo position: botonAgregar position +(0@60).
botonDevolver  position: botonPrestamo position +(0@60).
botonTipo position: botonDevolver position +(0@60).
botonInformacion position: botonTipo position +(0@60).
nota position:botonInformacion position +(0@60)-(25@0).
    self addMorph:botonAgregar; addMorph:botonTipo;addMorph:botonPrestamo;addMorph:botonDevolver;addMorph:nota;addMorph: botonInformacion .

botonAgregar mouseAction: [  Agregar_BibliotecaInteres crearOpcion_titulo: ('Agregar biblioteca de interes a ',UsuarioRecibido getNombre)  yUsuario: UsuarioRecibido.

self cerrar.

    ].
"si quiero cambiar el tipo"
botonTipo mouseAction: [
    MiSistema cambiarTipoUsuario_Usuario: UsuarioRecibido .
	IU_usuario crearOpcion_titulo: 'USUARIO' ySistema: MiSistema   .self cerrar.
    self cerrar.
         ].
    botonPrestamo mouseAction: [
        Realizar_Prestamo crearOpcion_titulo: ('Prestamo')  yUsuario: UsuarioRecibido.self cerrar.

        ].
    botonInformacion mouseAction: [ 
        Informacion_Usuario crearOpcion_titulo: 'INFORMACION SOBRE USUARIO' yUsuario: UsuarioRecibido .self cerrar.
         ].
botonDevolver mouseAction: [  
	Devolver_Prestamo crearOpcion_titulo: 'PRESTAMO USUARIO' yUsuario:UsuarioRecibido. self cerrar.
	].
atras mouseAction: [ IU_usuario crearOpcion_titulo: 'USUARIO' ySistema: MiSistema   .self cerrar. ].

]

{ #category : #initialization }
Acciones_Usuario >> initialize [ 

super initialize.
self agregarBotones.

]
