Class {
	#name : #'Opciones_Usuario',
	#superclass : #VentanaO,
	#classVars : [
		'UsuarioRecibido'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Opciones_Usuario class >> asignarUsuario:unUsuario [
|opcion|.
opcion:=self new.
opcion asignarUsuario: unUsuario.
]

{ #category : #'as yet unclassified' }
Opciones_Usuario >> asignarUsuario: usuario [
UsuarioRecibido :=usuario .
]
