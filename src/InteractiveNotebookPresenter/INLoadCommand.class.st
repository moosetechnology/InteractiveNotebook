Class {
	#name : 'INLoadCommand',
	#superclass : 'SpToolCommand',
	#category : 'InteractiveNotebookPresenter-Commands',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Commands'
}

{ #category : 'defaults' }
INLoadCommand class >> defaultIconName [

	^ #smallLoadProject
]

{ #category : 'default' }
INLoadCommand class >> defaultName [

	^ 'Load...'
]

{ #category : 'executing' }
INLoadCommand >> execute [

	self context importMicrodownFile
]
