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

	aContext bindings add:
		(AdditionalBinding key: 'stream' value: aStream).
	aContext bindings add: (AdditionalBinding
			 key: 'printer'
			 value: (MiMooseNotebookPrinter new
					  stream: aStream;
					  yourself)).
	self class compiler
		compilationContext: aContext;
		source: text;
		evaluate
]
