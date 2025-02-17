Class {
	#name : 'INSaveCommand',
	#superclass : 'SpToolCommand',
	#category : 'InteractiveNotebookPresenter-Commands',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Commands'
}

{ #category : 'defaults' }
INSaveCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : 'default' }
INSaveCommand class >> defaultName [

	^ 'Save...'
]

{ #category : 'executing' }
INSaveCommand >> execute [

	self context exportDocument
]
