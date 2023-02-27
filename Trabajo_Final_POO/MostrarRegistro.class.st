Class {
	#name : #MostrarRegistro,
	#superclass : #RubScrolledTextMorph,
	#category : #'Trabajo_Final_POO-Elementos'
}

{ #category : #'as yet unclassified' }
MostrarRegistro class >> crearRegistro_Dimension: unaDimension yPosicion:unaPos [

	| registro |
	registro := self new.
	registro setText:' '.
	registro extent: unaDimension;position:unaPos;
		"solo de lectura"
		beReadOnly.
		registro updateTextWith:''.
registro borderWidth: 2.
registro borderColor: Color pink.
	^ registro.
]

{ #category : #initialization }
MostrarRegistro >> initialize [ 
super initialize .
self setText: ''.
]
