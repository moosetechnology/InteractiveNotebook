Class {
	#name : #BaselineOfInteractiveNotebook,
	#superclass : #BaselineOf,
	#category : #BaselineOfInteractiveNotebook
}

{ #category : #baselines }
BaselineOfInteractiveNotebook >> baseline: spec [

	spec
		for: #common
		do: [ spec package: 'InteractiveNotebookPresenter' ]
]
