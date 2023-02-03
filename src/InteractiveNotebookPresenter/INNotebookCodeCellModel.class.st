Class {
	#name : #INNotebookCodeCellModel,
	#superclass : #INNotebookAbstractCellModel,
	#category : #InteractiveNotebookPresenter
}

{ #category : #helpers }
INNotebookCodeCellModel >> presenterClass [

	^ INNotebookCodeCellPresenter
]

{ #category : #printing }
INNotebookCodeCellModel >> printContentIn: aStream withContext: aContext [

	aContext bindings at: 'stream' put: aStream.
	aContext bindings at: 'printer' put: (INReportCollectionPrinter new
			 stream: aStream;
			 yourself).
	self class compiler
		compilationContext: aContext;
		source: text;
		evaluate
]
