Class {
	#name : 'INAddCellAfterCommand',
	#superclass : 'SpToolCommand',
	#category : 'InteractiveNotebookPresenter-Commands',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Commands'
}

{ #category : 'default' }
INAddCellAfterCommand class >> defaultDescription [

	^ 'Add after'
]

{ #category : 'defaults' }
INAddCellAfterCommand class >> defaultIconName [

	^ #addBelow
]

{ #category : 'default' }
INAddCellAfterCommand class >> defaultName [

	^ 'AddCellAfter'
]

{ #category : 'executing' }
INAddCellAfterCommand >> execute [

	self context addTextCellAfter
]
