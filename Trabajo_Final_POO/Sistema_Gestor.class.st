"
Esta clase esta compuesto por las siguientes variables:
    Instance Variables
	colAutor:		<Autor>
	colBiblioteca:		<Biblioteca>
	colUsuario:		<Usuario>
			
las instancias de autor solo puede ser creada cuando se quiera ingresar un libro, cuando se añada un libro podremos añadir al autor pero no se podra crear desde el sistema_gestor si no que desde libro y al crearla desde libro se añadira a la colAutor.
"
Class {
	#name : #'Sistema_Gestor',
	#superclass : #Object,
	#instVars : [
		'colAutor',
		'colBiblioteca',
		'colUsuario',
		'multaKDias'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
Sistema_Gestor class >> crearSistemaAUsar [
|sis usuario1 usuario2 usuario3 usuario4 usuario5 biblioteca1 biblioteca2 biblioteca3 autor1 autor2 autor3 autor4 libro2 libro1 libro3 libro4 libro5 libro6 libro7 libro8 libro9 libro10 libro11 libro12 libro13 libro14 usuarioPlus1  colLibroPrestamo1 colLibroPrestamo2 colLibroPrestamo3 colLibroPrestamo4|.
sis:= self new.
sis inicializadorSistema_Gestor.
colLibroPrestamo1 :=OrderedCollection new.
colLibroPrestamo2 :=OrderedCollection new.
colLibroPrestamo3 :=OrderedCollection new.
colLibroPrestamo4 :=OrderedCollection new.
"creo usuarios plus y no plus"

""
usuarioPlus1  :=UsuarioPlus crearUPlus_nombre: 'U.PLUS ' yApellido:'P.AUDIOLIBRO vencido'  yDni:'1'  yContraseña:'1' .

usuario1:=UsuarioPlus crearUPlus_nombre: 'Messi' yApellido:'Cuccittini'  yDni:'10000000'  yContraseña:'12345' .

usuario2:=UsuarioPlus crearUPlus_nombre: 'Facu' yApellido:'Munos'  yDni:'10000001'  yContraseña:'12345' .

usuario3:=Usuario crearU_nombre: 'Seba' yApellido:'Iovaldo'  yDni:'10000002'  yContraseña:'12345' .

usuario4:=Usuario crearU_nombre: 'Guillermo' yApellido:'Diaz'  yDni:'10000003'  yContraseña:'12345' .

usuario5:=Usuario crearU_nombre: 'Joaquin' yApellido:'Medel'  yDni:'10000004'  yContraseña:'12345' .

"creo bibliotecas"
biblioteca1 := Biblioteca crearBiblioteca_id: '001' yDireccion:'Calle 123' yNombre: 'Biblioteca Central' yTelContacto: '555-555-5555' yRepresentante: 'Juan Pérez' yDiasParaPrestar: '4'.
biblioteca2 := Biblioteca crearBiblioteca_id: '002' yDireccion:'Calle 123' yNombre: 'Biblioteca Nacional' yTelContacto: '555-555-5556' yRepresentante: 'Juan Pérez' yDiasParaPrestar: '10'.
biblioteca3 := Biblioteca crearBiblioteca_id: '003' yDireccion:'Calle 123' yNombre: 'Biblioteca SanPedro' yTelContacto: '555-555-5557' yRepresentante: 'Juan Pérez' yDiasParaPrestar: '5'.
"creo autores"
autor1 := Autor crearAutor_nombre: 'Juan' yApellido: 'Pérez'.
sis agregarAutor: autor1 .
autor2 := Autor crearAutor_nombre: 'Celina' yApellido: 'Gramajo'.
sis agregarAutor: autor2 .
autor3 := Autor crearAutor_nombre: 'Cristopher' yApellido: 'Ovaillos'.
sis agregarAutor: autor3 .
autor4 := Autor crearAutor_nombre: 'Leonardo' yApellido: 'Pérez'.
sis agregarAutor: autor4 .
"libro"
libro1 :=(Libro crearLibro_nombre: 'La odisea' yEditorial:'Librería y Casa Editorial Hernando'  yAnio_Edicion:'1906').
libro2 :=(Libro crearLibro_nombre:'La Ilíada'  yEditorial:'Librería y Casa Editorial Hernando'  yAnio_Edicion:'1906' ).
libro3 :=(Libro crearLibro_nombre:'El Quijote'  yEditorial:'Editorial Planeta'  yAnio_Edicion:'1922' ).
libro4:=(Audio_Libro crearAudioLibro_nombre: 'Cien años de soledad' yEditorial:'Anagrama'  yAnio_Edicion: '1851' yDuracion:'2 hs'). 
libro5:=(Audio_Libro crearAudioLibro_nombre: 'Don Quijote de la Mancha' yEditorial:'Tusquets Editores'  yAnio_Edicion: '1890' yDuracion:'3 hs'). 
libro6:=(Audio_Libro crearAudioLibro_nombre: 'El gran Gatsby' yEditorial:'Anagrama'  yAnio_Edicion: '1925' yDuracion:'6 hs').
libro7:=(Audio_Libro crearAudioLibro_nombre: 'Los miserables' yEditorial:' Porrúa'  yAnio_Edicion: '1948' yDuracion:'6 hs').
libro8:=(Audio_Libro crearAudioLibro_nombre: 'La Metamorfosis' yEditorial:'B'  yAnio_Edicion: '1960' yDuracion:'4 hs').
libro9:=(Audio_Libro crearAudioLibro_nombre: 'El extraño caso del Dr. Jekyll y Mr. Hyde' yEditorial:'Océano'  yAnio_Edicion: '1975' yDuracion:'4 hs').
libro10:=(Audio_Libro crearAudioLibro_nombre: 'La isla del tesoro' yEditorial:'Penguin Random House'  yAnio_Edicion: '1989' yDuracion:'3 hs').


libro11:=Libro_Electronico crearLibroElectronico_nombre: '1984' yEditorial:'2001'  yAnio_Edicion:'2001'  yFormato:'pdf'.
libro12:=Libro_Electronico crearLibroElectronico_nombre:'Rebelión en la granja'  yEditorial:'Planeta de Libros'  yAnio_Edicion:'2010'  yFormato: 'pdf' .
libro13:=Libro_Electronico crearLibroElectronico_nombre:'Hamlet'  yEditorial:'Alianza Editorial'  yAnio_Edicion:'2005'  yFormato: 'pdf' .

libro14:=Libro_Impreso crearLibroImpreso_nombre:'La divina comedia'  yEditorial:'Roca Editorial'  yAnio_Edicion: '2021' yCantidad:'332' .

biblioteca1 agregarLibro:  (libro1); agregarLibro:  (libro2);agregarLibro:  (libro3);agregarLibro:  (libro4); agregarLibro:  (libro5); agregarLibro:  (libro6); agregarLibro:  (libro7); agregarLibro:  (libro8); agregarLibro:  (libro9); agregarLibro:  (libro10); agregarLibro:  (libro11); agregarLibro:  (libro12); agregarLibro:  (libro13); agregarLibro:  (libro14).

biblioteca2 agregarLibro:  (libro1); agregarLibro:  (libro2);agregarLibro:  (libro3);agregarLibro:  (libro4); agregarLibro:  (libro5); agregarLibro:  (libro6); agregarLibro:  (libro7); agregarLibro:  (libro8); agregarLibro:  (libro9); agregarLibro:  (libro10); agregarLibro:  (libro11); agregarLibro:  (libro12); agregarLibro:  (libro13); agregarLibro:  (libro14).

biblioteca3 agregarLibro:  (libro1); agregarLibro:  (libro2);agregarLibro:  (libro3);agregarLibro:  (libro4); agregarLibro:  (libro5); agregarLibro:  (libro6); agregarLibro:  (libro7); agregarLibro:  (libro8); agregarLibro:  (libro9); agregarLibro:  (libro10); agregarLibro:  (libro11); agregarLibro:  (libro12); agregarLibro:  (libro13); agregarLibro:  (libro14).
"creo prestamos: este contiene 2 audioLibros y un libro fisico"
colLibroPrestamo1 add:libro6.
colLibroPrestamo1 add:libro7.
colLibroPrestamo1 add:libro1.
usuarioPlus1 agregarBibliotecaInteres: biblioteca1 .
biblioteca1 registrarPrestamoUsuario: usuarioPlus1 clibros: colLibroPrestamo1.
"
fecha_original := Date today. ""fecha actual""
duracion := Duration days: 3.
nueva_fecha := fecha_original - duracion.
"
(biblioteca1 retornarTodosLosPrestamosDe_unUsuario: usuarioPlus1)do:[:prestamo| prestamo diasARestar:4 asNumber ].

sis agregarUsuario: usuarioPlus1.
sis agregarUsuario: usuario1 .
sis agregarUsuario: usuario2 .
sis agregarUsuario: usuario3 .
sis agregarUsuario: usuario4 .
sis agregarUsuario: usuario5.
"creo bibliotecas"
sis agregarUsuario: usuarioPlus1.
sis agregarBiblioteca: biblioteca1.
sis agregarBiblioteca: biblioteca2.
sis agregarBiblioteca: biblioteca3.
"GIT"
^ sis.

]

{ #category : #'as yet unclassified' }
Sistema_Gestor class >> crearSistemaGestor_colAutor:cAutor colBiblioteca:cBiblioteca colUsuario:cUsuario [
|sistema|.
sistema:=self new.
sistema inicializadorSistemaGestor_colAutor:cAutor colBiblioteca:cBiblioteca colUsuario:cUsuario.
^sistema .
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> agregarAutor: unAutor [
colAutor add: unAutor. 
self changed:colAutor.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> agregarBiblioteca: unaBiblioteca [
colBiblioteca add:unaBiblioteca.
self changed:colBiblioteca.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> agregarUsuario: unUsuario [
colUsuario add:unUsuario.
"AVISO QUE ACTUALICE"
self changed: colUsuario.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> bibliotecaDondeRealizoPrestamo:unUsuario [

^colBiblioteca select:[:biblioteca|biblioteca verUsuarioRealizoPrestamo: unUsuario].


]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> cambiarTipoUsuario_Usuario:usuarioViejo [ 
|usuarioNuevo|.
(usuarioViejo tipoUsuario)ifTrue:[
    "NO ES USUARIO PLUS entonces pasamos a usuario no plus"
    usuarioNuevo :=UsuarioPlus crearUPlus_nombre: (usuarioViejo getNombre )  yApellido: (usuarioViejo getApellido  ) yDni:(usuarioViejo getDni  )  yContraseña:(usuarioViejo getContraseña).
    ]ifFalse:[
    "ES USUARIO PLUS"
    usuarioNuevo :=Usuario crearU_nombre: (usuarioViejo getNombre)  yApellido: (usuarioViejo getApellido  ) yDni:(usuarioViejo getDni)  yContraseña:(usuarioViejo getContraseña).
    ].
usuarioNuevo actualizarColBiblioteca: (usuarioViejo getBibliotecaInteres).
colUsuario remove:usuarioViejo .
self agregarUsuario: usuarioNuevo.

]

{ #category : #auxiliares }
Sistema_Gestor >> colATexto: unaColeccion [
	^ String streamContents: [:s | 
		unaColeccion do: [:each | 
			s nextPutAll: each aTexto.
			s nextPut: Character cr]].
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> existeAutor: unAutor [

^(colAutor anySatisfy:[:autor| autor compararNombre:(unAutor getNombre )  yApellido:(unAutor getApellido ) ]).
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> existeDni:unDni [
"El mensaje anySatisfy: retorna true si al menos un objeto en la colección cumple con la condición especificada, o false si ninguno de los objetos en la colección cumple con la condición."
^colUsuario anySatisfy: [:usuario|((usuario getDni)asString)=unDni].



]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> generarListadoUsuariosRetrasados [
	| bibliotecas_con_usuarios_retrasados |
	bibliotecas_con_usuarios_retrasados := colBiblioteca select: [:biblioteca | biblioteca usuarios_con_prestamos_vencidos notEmpty].
	bibliotecas_con_usuarios_retrasados := bibliotecas_con_usuarios_retrasados collect: [:biblioteca |
		| usuarios |
		usuarios := biblioteca usuarios_con_prestamos_vencidos.
		usuarios notEmpty ifTrue: [
			"es una sintaxis en Smalltalk para crear una tupla que contiene dos elementos: la variable usuarios y la variable biblioteca. En otras palabras, es una forma de agrupar dos valores relacionados en un solo objeto."
			{usuarios. biblioteca}
		]
	].
	^ bibliotecas_con_usuarios_retrasados
	

]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> getBibliotecas [
^colBiblioteca .
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> getColUsuario [
^colUsuario.

]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> getMultaKDias [
^multaKDias 
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> inicializadorSistemaGestor_colAutor:cAutor colBiblioteca:cBiblioteca colUsuario:cUsuario [

colAutor :=cAutor .
colBiblioteca := cBiblioteca .
colUsuario  :=cUsuario .

]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> inicializadorSistema_Gestor [
colBiblioteca:=OrderedCollection new.
colAutor:=OrderedCollection new.
colUsuario:=OrderedCollection new.
multaKDias :=7.

]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> iniciarSesion_Dni: numDni yContraseña:password [
| exito |.
exito:=false.
colUsuario do:[:i| (i buscarUsuario_Dni: ((numDni)asString) yContraseña: ((password)asString)) ifTrue:  [exito:=true]].
^exito.
"el metodo detect devuelve una referencia no una copia"
"^ (colUsuario detect:[:usuario| (usuario buscarUsuario_Dni:((numDni)asString)  yContraseña:((password)asString))]). "
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> retornarUsuario_dni: numDni [
^ (colUsuario detect:[:usuario| ((usuario getDni))=numDni])
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> sistemaGestorAUsar [
colBiblioteca:=OrderedCollection new.
colAutor:=OrderedCollection new.
colUsuario:=OrderedCollection new.
multaKDias :=7.
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> verSiEsFecha: unaFecha [
"$ se utiliza para especificar caracteres especiales."
^(unaFecha allSatisfy: [:c | c isDigit or: [c = $-]])
    ifTrue: [
        (unaFecha size = 10)
            and: [
                (unaFecha at: 5) = $-
                and: [
                    (unaFecha at: 8) = $-
                ]
            ]
    ]ifFalse: [false].
]

{ #category : #'as yet unclassified' }
Sistema_Gestor >> verSiEsNumero:num [
^((num) allSatisfy: [:c | c isDigit]).
]
