Class {
	#name : #INNewTabCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #default }
INNewTabCommand class >> defaultIconName [

	^ #add
]

{ #category : #default }
INNewTabCommand class >> defaultName [

	^ 'New Tab'
]

{ #category : #executing }
INNewTabCommand >> execute [

	self context addNewTab
]
