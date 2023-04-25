Class {
	#name : #INNotebookCodeCellModel,
	#superclass : #INNotebookAbstractCellModel,
	#category : #InteractiveNotebookPresenter
}

{ #category : #printing }
INNotebookCodeCellModel >> getContentwithContext: aContext [
	^self class compiler
		compilationContext: aContext;
		source: text;
		evaluate
]

{ #category : #helpers }
INNotebookCodeCellModel >> presenterClass [

	^ INNotebookCodeCellPresenter
]

{ #category : #printing }
INNotebookCodeCellModel >> printContentIn: aStream withContext: aContext [
	^self class compiler
		compilationContext: aContext;
		source: text;
		evaluate
]
