Class {
	#name : #INNotebookTextCellModel,
	#superclass : #INNotebookAbstractCellModel,
	#category : #InteractiveNotebookPresenter
}

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
