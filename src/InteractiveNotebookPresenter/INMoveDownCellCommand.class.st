Class {
	#name : 'INMoveDownCellCommand',
	#superclass : 'SpToolCommand',
	#category : 'InteractiveNotebookPresenter-Commands',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Commands'
}

{ #category : 'default' }
INMoveDownCellCommand class >> defaultDescription [

	^ 'Move cell down'
]

{ #category : 'defaults' }
INMoveDownCellCommand class >> defaultIconName [

	^ #down
]

{ #category : 'default' }
INMoveDownCellCommand class >> defaultName [

	^ 'Move cell down'
]

{ #category : 'executing' }
INMoveDownCellCommand >> execute [

	self context moveDown
]
