Class {
	#name : #INNotebookAbstractCellModel,
	#superclass : #Object,
	#instVars : [
		'text',
		'model'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #initialization }
INNotebookAbstractCellModel >> initialize [

	super initialize.
	text := String empty
]

{ #category : #helpers }
INNotebookAbstractCellModel >> presenterClass [

	self subclassResponsibility
]

{ #category : #printing }
INNotebookAbstractCellModel >> printContentIn: aStream withContext: aContext [

	self subclassResponsibility
]

{ #category : #accessing }
INNotebookAbstractCellModel >> text [

	^ text
]

{ #category : #accessing }
INNotebookAbstractCellModel >> text: anObject [

	text := anObject
]
