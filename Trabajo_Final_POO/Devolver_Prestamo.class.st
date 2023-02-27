Class {
	#name : #'Devolver_Prestamo',
	#superclass : #'Opciones_Usuario',
	#instVars : [
		'elegirBiblioteca',
		'botonDevolver1',
		'botonDevolver2'
	],
	#category : #'Trabajo_Final_POO-Vista'
}

{ #category : #initialization }
Devolver_Prestamo >> agregarBotones [ 
|dicBiblio listaBInteres|.
"un variable que se usara para tener el nombre de las bibliotecas que este marco como interes"
dicBiblio :=Dictionary new.
(UsuarioRecibido getBibliotecaInteres)do:[:bInteres| dicBiblio at:(bInteres getNombreEstablecimiento )put:bInteres].

listaBInteres:=SearchMorph new.
listaBInteres extent:400@60;searchList: (dicBiblio keys). 
listaBInteres position:50@50.
listaBInteres ghostText: 'SELECCIONE LA BIBLIOTECA A DEVOLVER PRESTAMO'.

elegirBiblioteca:=BotonAccion crearBoton_nomb: 'PRESTAMO' yDimension:100@20 yColor: Color pink.
elegirBiblioteca position: 385@415.
botonDevolver1 :=BotonAccion crearBoton_nomb: 'Devolver' yDimension:100@20 yColor: Color pink.
botonDevolver2 :=BotonAccion crearBoton_nomb: 'Devolver' yDimension:100@20 yColor: Color pink.
self addMorph:listaBInteres;addMorph:elegirBiblioteca.

(listaBInteres isNotNil)ifTrue:[
	
	elegirBiblioteca mouseAction: [  
		self devolverPrestamo_Biblioteca: (dicBiblio at:(listaBInteres  selectedItem)).
		self removeMorph: elegirBiblioteca;removeMorph: listaBInteres.
		]
	
	].
atras mouseAction: [ Acciones_Usuario crearVentana_titulo:(UsuarioRecibido  getNombre).self cerrar ].
]

{ #category : #propios }
Devolver_Prestamo >> devolverPrestamo_Biblioteca:unaBiblio [
|texto listaPrestamo listaPrestAudio auxiliar1 auxiliar2 sumar |.
sumar:=(MiSistema getMultaKDias)asNumber. 
""
""
listaPrestamo:= MostrarRegistro crearRegistro_Dimension: 220@250 yPosicion: (self position+(30@60)).
listaPrestamo borderWidth: 2.
listaPrestamo borderColor: Color pink.
listaPrestAudio:= MostrarRegistro crearRegistro_Dimension: 220@250 yPosicion: (self position+(255@60)).
listaPrestAudio borderColor: Color pink.
listaPrestAudio borderWidth: 2.
"self addMorph:listaPrestamo.
self addMorph:listaPrestAudio."
texto:=StringMorph new.
texto contents:''.
texto position:(self position+(100@60)).

botonDevolver1 position:self position+(15@340).
botonDevolver2 position:self position+(385@340).
self addMorph:texto.

(unaBiblio verUsuarioRealizoPrestamo:UsuarioRecibido)ifFalse:[
	texto contents:'EL USUARIO NO REALIZO EL PRESTAMO EN ESTA BIBLIOTECA'.
	self addMorph:texto.
	]ifTrue:[
	"veo si el usaurio realizo un prestamo en esta biblioteca"
auxiliar1 :=unaBiblio retornarPrestamo_Usuario: UsuarioRecibido.
auxiliar2 :=unaBiblio retornarPrestamoAudioLibro_Usuario: UsuarioRecibido.
auxiliar1 ifNotNil: [ listaPrestamo setText:auxiliar1 aTexto.
	self addMorph:listaPrestamo;addMorph:botonDevolver1.
	botonDevolver1 mouseAction: [unaBiblio devolverPrestamo:UsuarioRecibido.
		(auxiliar1 getFechaLimite<Date today)ifTrue:[
			
		"se pasaron del limite"
		UsuarioRecibido agregarFechaPosibleMulta: ((Date today) + (sumar days) )asDate.
		].
	self removeMorph: botonDevolver1 ; removeMorph:listaPrestamo.		
	
		].
	 ].
auxiliar2 ifNotNil: [listaPrestAudio setText:auxiliar2 aTexto.
		self addMorph:listaPrestAudio;addMorph:botonDevolver2.
	botonDevolver2 mouseAction: [ unaBiblio devolverPrestamoAudioLibro: UsuarioRecibido.
	(auxiliar2 getFechaLimite<Date today)ifTrue:[
			
		"se pasaron del limite"
		UsuarioRecibido agregarFechaPosibleMulta: ((Date today) + (sumar days) )asDate.
		].		
			self removeMorph: botonDevolver2 ; removeMorph:listaPrestAudio.	
		].

	].
	
].
 



]

{ #category : #initialization }
Devolver_Prestamo >> initialize [ 
super initialize.
self agregarBotones .
]
