Class {
	#name : #INNotebookTextCellModel,
	#superclass : #INNotebookAbstractCellModel,
	#category : #InteractiveNotebookPresenter
}

{ #category : #helpers }
INNotebookTextCellModel >> presenterClass [

	^ INNotebookTextCellPresenter
]

{ #category : #printing }
INNotebookTextCellModel >> printContentIn: aStream withContext: aContext [

	aStream nextPutAll: text
]
