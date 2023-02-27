Class {
	#name : #'BaselineOfTrabajo_Final_POO',
	#superclass : #BaselineOf,
	#category : #'BaselineOfTrabajo_Final_POO'
}

{ #category : #baselines }
BaselineOfTrabajo_Final_POO >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
    spec
        package: 'Trabajo_Final_POO'
	.
].

spec for: #common do: [
    spec
        package: 'PetitParser'.
].
]

{ #category : #accessing }
BaselineOfTrabajo_Final_POO >> projectClass [
^ MetacelloCypressBaselineProject
]
