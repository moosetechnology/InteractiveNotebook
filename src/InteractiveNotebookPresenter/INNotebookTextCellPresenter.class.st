Class {
	#name : #INNotebookTextCellPresenter,
	#superclass : #INNotebookAbstractCellPresenter,
	#category : #'InteractiveNotebookPresenter-Cells'
}

{ #category : #converting }
INNotebookTextCellPresenter >> asModelCell [

	^ INNotebookTextCellModel new
		  text: cell text;
		  yourself
]

{ #category : #api }
INNotebookTextCellPresenter >> beCode [

	notebook transformToCodeCell: self
]

{ #category : #api }
INNotebookTextCellPresenter >> beText [

	^ self
]

{ #category : #initialization }
INNotebookTextCellPresenter >> initializeLeftButton [

	super initializeLeftButton.
	leftMenuCanvas canvas
		add: (RSLabel new
				 translateBy: 0 @ -3;
				 text: 'μ';
				 fontSize: 16;
				 color: Color black;
				 yourself);
		when: RSMouseClick
		do: [ notebook transformToCodeCell: self ]
		for: self
]

{ #category : #initialization }
INNotebookTextCellPresenter >> initializePresenters [

	super initializePresenters.

	cell := self newText.
	cell whenTextChangedDo: [ self updateHeight ].

	self initializeLayout
]
