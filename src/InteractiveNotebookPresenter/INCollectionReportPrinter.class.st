Class {
	#name : #INCollectionReportPrinter,
	#superclass : #INSimpleReportPrinter,
	#instVars : [
		'microdownBuilder'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #initialization }
INCollectionReportPrinter >> initialize [

	super initialize.
	microdownBuilder := Microdown builder
]

{ #category : #printing }
INCollectionReportPrinter >> printAssociation: anAssoc with: aBlock [

	microdownBuilder unorderedListDuring: [
		microdownBuilder item: [ microdownBuilder raw: (aBlock value: anAssoc key) ].
		microdownBuilder unorderedListDuring: [
			anAssoc value do: [ :e |
				microdownBuilder item: [ microdownBuilder raw: (aBlock value: e) ] ] ] ]
]

{ #category : #printing }
INCollectionReportPrinter >> printCollection: aCollection with: aBlock [

	self sort: aCollection with: aBlock.
	aCollection do: [ :e | self printObject: e with: aBlock ]
]

{ #category : #printing }
INCollectionReportPrinter >> printElement: anObject with: aBlock [

	microdownBuilder unorderedListDuring: [
		microdownBuilder item: [ microdownBuilder raw: (aBlock value: anObject) ] ]
]

{ #category : #printing }
INCollectionReportPrinter >> printObject: e with: aBlock [

	^ e isAssociation
		  ifTrue: [ self printAssociation: e with: aBlock ]
		  ifFalse: [ self printElement: e with: aBlock ]
]

{ #category : #printing }
INCollectionReportPrinter >> sort: aCollection with: aBlock [

	| val |

	val := (aCollection allSatisfy: [ :e | e isAssociation ])
		       ifTrue: [ #key ]
		       ifFalse: [ #yourself ].

	aCollection sort: [ :a :b |
		(aBlock value: (val value: a)) < (aBlock value: (val value: b)) ]
]

{ #category : #accessing }
INCollectionReportPrinter >> stream: aStream [

	super stream: aStream.
	microdownBuilder setStream: stream
]

{ #category : #printing }
INCollectionReportPrinter >> stringForElement: e [

	^ e printString
]
