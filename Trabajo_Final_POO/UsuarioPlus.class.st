"
Esta clase esta compuesto por:
    Instance Variables
	apellido:		<string>
	colBibibliotecaInter:		<Biblitoca>
	contraseña:		<string>
	dni:		<string>
	fechaMulta:		<Date>
	nombre:		<string>
	tipoUsuario:		<boolean>
para los usuarios plus el tipo usuario es false.

Esta variable sirve para ver cuando este tiene que volver a pagar y este es cada 30 dias despues de haber creado un usuario plus.
    Instance Variables
	fechaVencimientoCuota:		<Date>


"
Class {
	#name : #UsuarioPlus,
	#superclass : #Usuario,
	#instVars : [
		'fechaVencimientoCuota'
	],
	#classInstVars : [
		'fechaVencimientoCuota'
	],
	#category : #'Trabajo_Final_POO-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioPlus class >> crearUPlus_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass [
|usuarioP|.
usuarioP :=self new.
usuarioP inicializadorUsuario_nombre: nomb yApellido:ape yDni:numDni yContraseña:pass.
usuarioP iniciarFechaVencimientoCuota.
^usuarioP.
]

{ #category : #propios }
UsuarioPlus >> iniciarFechaVencimientoCuota [
"cuando se crea una instancia de usuarioPlus la fechaVencimientoCuota es la fecha actual 
donde se crea mas 30 dias"
fechaVencimientoCuota := Date today + 30 days.
]

{ #category : #propios }
UsuarioPlus >> noCumpleCondiciones_DNI: numDni [
|realizoPrest|.
"polimorfismo por refinamiento"
realizoPrest:=super noCumpleCondiciones_DNI: numDni.
"da falso porque no hizo prestamo"
(realizoPrest)ifFalse:[
	(self vencioCuota)ifTrue:[
		"vencio la cuota entonces no puede realizar el prestamo ya que no esta al dia entonces no es apto por eso el true"
		realizoPrest :=true.
		]. 
	].
^realizoPrest .
]

{ #category : #propios }
UsuarioPlus >> realizoPrestamo_DNI: numDni [
|realizoPrest|.
"polimorfismo por refinamiento"
realizoPrest:=super noCumpleCondiciones_DNI: numDni.

(realizoPrest)ifTrue:[
	(self vencioCuota)ifTrue:[
		"vencio la cuota entonces no puede realizar el prestamo ya que no esta al dia"
		realizoPrest :=false.
		]. 
	].
^realizoPrest .
]

{ #category : #accessing }
UsuarioPlus >> tipoUsuario [ 
^false.
]

{ #category : #propios }
UsuarioPlus >> vencioCuota [
"vencio"
^ (Date today>fechaVencimientoCuota) .
]
