Class {
	#name : #INSimpleReportPrinter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #printing }
INSimpleReportPrinter >> print: anObject [

	anObject isCollection
		ifTrue: [ self printCollection: anObject ]
		ifFalse: [ self printObject: anObject ]
]

{ #category : #printing }
INSimpleReportPrinter >> printCollection: aCollection [

	self
		printCollection: aCollection
		with: [ :e | self stringForObject: e ]
]

{ #category : #printing }
INSimpleReportPrinter >> printCollection: aCollection with: aBlock [

	aCollection do: [ :e |
		self printObject: e with: aBlock.
		stream cr ]
]

{ #category : #printing }
INSimpleReportPrinter >> printObject: anObject [

	self printObject: anObject with: [ :e | self stringForObject: e ]
]

{ #category : #printing }
INSimpleReportPrinter >> printObject: anObject with: aBlock [

	stream << (aBlock value: anObject)
]

{ #category : #accessing }
INSimpleReportPrinter >> stream [

	^ stream
]

{ #category : #accessing }
INSimpleReportPrinter >> stream: anObject [

	stream := anObject
]

{ #category : #printing }
INSimpleReportPrinter >> stringForObject: anObject [

	^ anObject printString
]
