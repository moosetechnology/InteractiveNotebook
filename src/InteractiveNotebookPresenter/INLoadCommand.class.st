Class {
	#name : #INLoadCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #default }
INLoadCommand class >> defaultIconName [

	^ #smallLoadProject
]

{ #category : #default }
INLoadCommand class >> defaultName [

	^ 'Load...'
]

{ #category : #executing }
INLoadCommand >> execute [

	self context importMicrodownFile
]
