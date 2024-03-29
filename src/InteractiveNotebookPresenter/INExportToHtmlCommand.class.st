Class {
	#name : #INExportToHtmlCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #defaults }
INExportToHtmlCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : #default }
INExportToHtmlCommand class >> defaultName [

	^ 'Export to HTML'
]

{ #category : #executing }
INExportToHtmlCommand >> execute [

	self context exportToHTML
]
