Class {
	#name : #INNotebookTextCellModel,
	#superclass : #INNotebookAbstractCellModel,
	#category : #InteractiveNotebookPresenter
}

{ #category : #'as yet unclassified' }
INNotebookTextCellModel >> beCodeModel [ 
	"no need to add the text in the current model, it will be compiled anyway in the next preview"
	^ INNotebookCodeCellModel new 
]

{ #category : #'as yet unclassified' }
INNotebookTextCellModel >> beTextModel [ 
	^ self
]

{ #category : #printing }
INNotebookTextCellModel >> getContentwithContext: aContext [

	^ text
]

{ #category : #helpers }
INNotebookTextCellModel >> presenterClass [

	^ INNotebookTextCellPresenter
]

{ #category : #printing }
INNotebookTextCellModel >> printContentIn: aStream withContext: aContext [

	^ text
]
