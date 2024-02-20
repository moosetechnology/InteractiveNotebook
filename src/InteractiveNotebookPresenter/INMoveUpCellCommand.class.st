Class {
	#name : #INMoveUpCellCommand,
	#superclass : #SpToolCommand,
	#category : #'InteractiveNotebookPresenter-Commands'
}

{ #category : #default }
INMoveUpCellCommand class >> defaultDescription [

	^ 'Move cell up'
]

{ #category : #defaults }
INMoveUpCellCommand class >> defaultIconName [

	^ #up
]

{ #category : #default }
INMoveUpCellCommand class >> defaultName [

	^ 'Move cell up'
]

{ #category : #executing }
INMoveUpCellCommand >> execute [

	self context moveUp
]
