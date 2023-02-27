Class {
	#name : #'BaselineOfTrabajo_Final_POO',
	#superclass : #BaselineOf,
	#category : #'BaselineOfTrabajo_Final_POO'
}

{ #category : #baselines }
BaselineOfTrabajo_Final_POO >> baseLine: spec [

	<baseline>
	spec
		for: #pharo
		do: [ "Packages" spec package: 'Trabajo_Final_POO' ]
]

{ #category : #accessing }
BaselineOfTrabajo_Final_POO >> projectClass [
^ MetacelloCypressBaselineProject
]
