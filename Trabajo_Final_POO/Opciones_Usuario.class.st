Class {
	#name : #'Opciones_Usuario',
	#superclass : #VentanaO,
	#classVars : [
		'UsuarioRecibido'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Opciones_Usuario class >> crearOpcion_titulo: tit yUsuario: us [ 
|opcion|.
opcion:=self new.
opcion recibirUsuario: us.

opcion agregarTitulo: tit.
opcion openCenteredInWorld.
]

{ #category : #'as yet unclassified' }
Opciones_Usuario >> recibirUsuario: usuario [
UsuarioRecibido :=usuario .
]
