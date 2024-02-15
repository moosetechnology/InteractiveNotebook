Class {
	#name : #INExportToTextCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #defaults }
INExportToTextCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : #default }
INExportToTextCommand class >> defaultName [

	^ 'Export to Text'
]

{ #category : #executing }
INExportToTextCommand >> execute [

	self context exportToText
]
