Class {
	#name : #INPreviewCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #default }
INPreviewCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : #default }
INPreviewCommand class >> defaultName [

	^ 'Preview'
]

{ #category : #executing }
INPreviewCommand >> execute [

	self context preview
]
