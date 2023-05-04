"
I am an abstract editor cell model. 

I have an instance variable `needToUpdate` that is set to true if a preview cell was never created for me (i.e. if I was never compiled) or if I was modified after having created a preview cell.
It is set to false otherwise, this way I don't have to be recompiled or to create a new preview cell.

I am responsible for the compilation of the content in my presenter's text input.
"
Class {
	#name : #INNotebookAbstractCellModel,
	#superclass : #Object,
	#instVars : [
		'text',
		'needToUpdate',
		'previewCell'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #ston }
INNotebookAbstractCellModel class >> stonAllInstVarNames [ 
	^ super stonAllInstVarNames \ { #needToUpdate. #previewCell }
]

{ #category : #converting }
INNotebookAbstractCellModel >> beCodeModel [
	^ self subclassResponsibility 
]

{ #category : #converting }
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

{ #category : #accessing }
INNotebookAbstractCellModel >> previewCell [

	^ previewCell
]

{ #category : #accessing }
INNotebookAbstractCellModel >> previewCell: anObject [

	previewCell := anObject
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

	(text = anObject) ifFalse: [ self needToUpdate: true ].
	text := anObject
]
