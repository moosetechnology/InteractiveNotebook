Class {
	#name : #INAddCellBeforeCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #default }
INAddCellBeforeCommand class >> defaultDescription [

	^ 'Add before'
]

{ #category : #defaults }
INAddCellBeforeCommand class >> defaultIconName [

	^ #addAbove
]

{ #category : #default }
INAddCellBeforeCommand class >> defaultName [

	^ 'Add before'
]

{ #category : #executing }
INAddCellBeforeCommand >> execute [

	self context addTextCellBefore
]
