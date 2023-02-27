Class {
	#name : #'Opciones_Biblioteca',
	#superclass : #VentanaO,
	#classVars : [
		'BiblioRe'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #'as yet unclassified' }
Opciones_Biblioteca class >> asignarBiblioteca:b [
|opcion|.
opcion:=self new.
opcion recibirBiblioteca: b.
]

{ #category : #propio }
Opciones_Biblioteca >> recibirBiblioteca:biblio [ 
BiblioRe :=biblio .
]
