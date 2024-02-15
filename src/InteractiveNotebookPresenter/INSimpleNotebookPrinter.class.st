Class {
	#name : #INSimpleNotebookPrinter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'InteractiveNotebookPresenter-Printers'
}

{ #category : #printing }
INSimpleNotebookPrinter >> print: anObject [

	self print: anObject with: [ :e | self stringForObject: e ]
]

{ #category : #printing }
INSimpleNotebookPrinter >> print: anObject with: aBlock [

	(anObject isCollection and: [ anObject isString not ])
		ifTrue: [ self printCollection: anObject with: aBlock ]
		ifFalse: [ self printObject: anObject with: aBlock ]
]

{ #category : #printing }
INSimpleNotebookPrinter >> printCollection: aCollection [

	self
		printCollection: aCollection
		with: [ :e | self stringForObject: e ]
]

{ #category : #printing }
INSimpleNotebookPrinter >> printCollection: aCollection with: aBlock [

	aCollection do: [ :e | self printCollectionItem: e with: aBlock ]
]

{ #category : #printing }
INSimpleNotebookPrinter >> printCollectionItem: e with: aBlock [

	self printObject: e with: aBlock.
	^ stream cr
]

{ #category : #printing }
INSimpleNotebookPrinter >> printObject: anObject [

	self printObject: anObject with: [ :e | self stringForObject: e ]
]

{ #category : #printing }
INSimpleNotebookPrinter >> printObject: anObject with: aBlock [

	stream << (aBlock value: anObject)
]

{ #category : #accessing }
INSimpleNotebookPrinter >> stream [

	^ stream
]

{ #category : #accessing }
INSimpleNotebookPrinter >> stream: anObject [

	stream := anObject
]

{ #category : #printing }
INSimpleNotebookPrinter >> stringForObject: anObject [

	^ anObject ifNil: [ '' ] ifNotNil: [ anObject asString ]
]
