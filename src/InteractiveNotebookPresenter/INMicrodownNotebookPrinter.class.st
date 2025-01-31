Class {
	#name : 'INMicrodownNotebookPrinter',
	#superclass : 'INSimpleNotebookPrinter',
	#instVars : [
		'microdownBuilder'
	],
	#category : 'InteractiveNotebookPresenter-Printers',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Printers'
}

{ #category : 'initialization' }
INMicrodownNotebookPrinter >> initialize [

	super initialize.
	microdownBuilder := Microdown builder
]

{ #category : 'printing' }
INMicrodownNotebookPrinter >> printAssociation: anAssoc with: aBlock [

	microdownBuilder raw: (aBlock value: anAssoc key).
	self printAssociationValue: anAssoc value with: aBlock
]

{ #category : 'printing' }
INMicrodownNotebookPrinter >> printAssociationValue: aValue with: aBlock [

	aValue isCollection
		ifTrue: [
			microdownBuilder unorderedListDuring: [
				self printCollection: aValue with: aBlock ] ]
		ifFalse: [
			microdownBuilder raw: ' -> '.
			self printObject: aValue with: aBlock ]
]

{ #category : 'printing' }
INMicrodownNotebookPrinter >> printCollection: aCollection with: aBlock [

	(self sort: aCollection with: aBlock) do: [ :e |
		self printCollectionItem: e with: aBlock ]
]

{ #category : 'printing' }
INMicrodownNotebookPrinter >> printCollectionItem: anObject with: aBlock [

	microdownBuilder unorderedListDuring: [
		microdownBuilder item: [ self printObject: anObject with: aBlock ] ]
]

{ #category : 'printing' }
INMicrodownNotebookPrinter >> printObject: anObject with: aBlock [

	^ anObject isAssociation
		  ifTrue: [ self printAssociation: anObject with: aBlock ]
		  ifFalse: [ microdownBuilder raw: (aBlock value: anObject) ]
]

{ #category : 'utilities' }
INMicrodownNotebookPrinter >> sort: aCollection with: aBlock [

	| valuable |

	valuable := (aCollection allSatisfy: [ :e | e isAssociation ])
		       ifTrue: [ #key ]
		       ifFalse: [ #yourself ].

	^ aCollection sorted: [ :a :b |
		  (aBlock value: (valuable value: a)) < (aBlock value: (valuable value: b)) ]
]

{ #category : 'accessing' }
INMicrodownNotebookPrinter >> stream: aStream [

	super stream: aStream.
	microdownBuilder setStream: stream
]
