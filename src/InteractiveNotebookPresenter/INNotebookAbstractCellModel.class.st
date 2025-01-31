Class {
	#name : 'INNotebookAbstractCellModel',
	#superclass : 'Object',
	#instVars : [
		'text'
	],
	#category : 'InteractiveNotebookPresenter-Cells',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Cells'
}

{ #category : 'printing' }
INNotebookAbstractCellModel >> contentAsStringInContext: aCompilationContext [

	self subclassResponsibility
]

{ #category : 'initialization' }
INNotebookAbstractCellModel >> initialize [

	super initialize.
	text := String empty
]

{ #category : 'helpers' }
INNotebookAbstractCellModel >> presenterClass [

	self subclassResponsibility
]

{ #category : 'accessing' }
INNotebookAbstractCellModel >> text [

	^ text
]

{ #category : 'accessing' }
INNotebookAbstractCellModel >> text: anObject [

	text := anObject
]
