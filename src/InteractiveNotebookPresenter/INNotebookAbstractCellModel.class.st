Class {
	#name : #INNotebookAbstractCellModel,
	#superclass : #Object,
	#instVars : [
		'text',
		'model',
		'needToUpdate'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #'as yet unclassified' }
INNotebookAbstractCellModel >> beCodeModel [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
INNotebookAbstractCellModel >> beTextModel [
	^ self subclassResponsibility 
]

{ #category : #printing }
INNotebookAbstractCellModel >> getContentwithContext: aContext [

	^ self subclassResponsibility 
]

{ #category : #initialization }
INNotebookAbstractCellModel >> initialize [

	super initialize.
	needToUpdate := true.
	text := String empty
]

{ #category : #accessing }
INNotebookAbstractCellModel >> model [
	^ model
]

{ #category : #accessing }
INNotebookAbstractCellModel >> model: aModel [
	model := aModel
]

{ #category : #accessing }
INNotebookAbstractCellModel >> needToUpdate [ 
	^ needToUpdate 
]

{ #category : #accessing }
INNotebookAbstractCellModel >> needToUpdate: aBoolean [ 
	needToUpdate := aBoolean
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

	(text equalsTo: anObject) ifFalse: [ self needToUpdate: true ].
	text := anObject
]
