Class {
	#name : #BaselineOfAdministrador,
	#superclass : #BaselineOf,
	#category : #BaselineOfAdministrador
}

{ #category : #baselines }
BaselineOfAdministrador >> baseLine: spec [

	<baseline>
	spec
		for: #pharo
		do: [ "Packages" spec package: 'Trabajo_Final_POO' ]
]

{ #category : #accessing }
BaselineOfAdministrador >> projectClass [
^ MetacelloCypressBaselineProject
]
