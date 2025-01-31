Class {
	#name : 'INRemoveCellCommand',
	#superclass : 'SpToolCommand',
	#category : 'InteractiveNotebookPresenter-Commands',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Commands'
}

{ #category : 'default' }
INRemoveCellCommand class >> defaultDescription [

	^ 'Remove'
]

{ #category : 'defaults' }
INRemoveCellCommand class >> defaultIconName [

	^ #trash
]

{ #category : 'default' }
INRemoveCellCommand class >> defaultName [

	^ 'Remove'
]

{ #category : 'testing' }
INRemoveCellCommand >> canBeExecuted [

	^ self context owner cellList isNotEmpty
]

{ #category : 'executing' }
INRemoveCellCommand >> execute [

	self context remove
]
