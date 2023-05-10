Class {
	#name : #INNotebookCodeCellModel,
	#superclass : #INNotebookAbstractCellModel,
	#category : #InteractiveNotebookPresenter
}

{ #category : #converting }
INNotebookCodeCellModel >> beCodeModel [ 
	^ self
]

{ #category : #converting }
INNotebookCodeCellModel >> beTextModel [ 
	"no need to add the text of the current model in the new model, it will be compiled anyway in the next preview"
	^ INNotebookTextCellModel new 
]

{ #category : #printing }
INNotebookCodeCellModel >> getContentwithContext: aContext [

	^ self class compiler
		  compilationContext: aContext;
		  source: text;
		  evaluate
]

{ #category : #compiling }
INNotebookCodeCellModel >> parseContent [

	^ RBParser parseExpression: text
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
