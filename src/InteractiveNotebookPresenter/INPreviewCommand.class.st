Class {
	#name : #INPreviewCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #defaults }
INPreviewCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : #default }
INPreviewCommand class >> defaultName [

	^ 'Preview'
]

{ #category : #executing }
INPreviewCommand >> execute [

	self context openPreview
]
