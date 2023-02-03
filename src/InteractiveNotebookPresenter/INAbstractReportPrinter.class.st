Class {
	#name : #INAbstractReportPrinter,
	#superclass : #Object,
	#instVars : [
		'micBuilder',
		'stream'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #printing }
INAbstractReportPrinter >> initialize [

	super initialize.
	micBuilder := Microdown builder.
]

{ #category : #printing }
INAbstractReportPrinter >> print: aCollection [

	self shouldBeImplemented
]

{ #category : #accessing }
INAbstractReportPrinter >> stream [

	^ stream
]

{ #category : #accessing }
INAbstractReportPrinter >> stream: anObject [

	stream := anObject.
	micBuilder setStream: stream
]
