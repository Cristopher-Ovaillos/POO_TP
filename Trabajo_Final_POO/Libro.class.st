"
La clase libro esta compuesto por:

    Instance Variables
	anio_Edicion:		<string>
	editorial:		<string>
	nombre:		<string>
	tipo:		<boolean>
			
Esta variable esta compuesto por 3 subclases y esta superclase corresponde a un libro fisico original osea no es lo mismo que un libro impreso. Pero cuando el usuario realiza un prestamo dependiendo del tipo de usuario que sea plus o no plus la variable de instancia cambia en AudioLibro debido a que al realizar el prestamo los libros fisico, impreso y electronico cuantan para un prestamo en cambio el AudioLibro cuenta para otro prestamo.


"
Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'editorial',
		'anio_Edicion',
		'tipo',
		'colAutores'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro class >> crearLibro_nombre:n yEditorial:ed yAnio_Edicion:aEd [
|libro|.
libro:=self new.
libro inicializadorLibro_nombre: n yEditorial:ed  yAnio_Edicion:aEd.
^libro. 
]

{ #category : #propios }
Libro >> aTexto [ 
|text nombres |.
nombres:=''.
(colAutores)ifNil:[
text:='Nombre: ', nombre asString, String cr, 'Editorial: ',editorial asString, String cr, 'Año edicion: ',(anio_Edicion asString), String cr.
	]ifNotNil:[
	"no esta vacio"
	text:='Nombre: ', nombre asString, String cr, 'Editorial: ',editorial asString, String cr, 'Año edicion: ',(anio_Edicion asString), String cr,'Cant autores: ',(colAutores size)asString, String cr.
	].

^text.

]

{ #category : #propios }
Libro >> agregarAutores:autor [
colAutores :=autor.
self changed:colAutores.

]

{ #category : #modificadores }
Libro >> getTipo [
^tipo .
]

{ #category : #Inicializador }
Libro >> inicializadorLibro_nombre:name yEditorial:editor yAnio_Edicion:anioEd [
nombre:=name.
editorial:=editor.
anio_Edicion:=anioEd.   
tipo :=true.
]

{ #category : #modificadores }
Libro >> setTipo: cambioTipo [ 
tipo:=cambioTipo .

]
