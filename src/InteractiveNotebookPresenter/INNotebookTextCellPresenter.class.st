Class {
	#name : #INNotebookTextCellPresenter,
	#superclass : #INNotebookAbstractCellPresenter,
	#category : #InteractiveNotebookPresenter
}

{ #category : #converting }
INNotebookTextCellPresenter >> asModelCell [

	^ INNotebookTextCellModel new
		  text: cellTextInput text;
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
INNotebookTextCellPresenter >> initializePresenters [

	super initializePresenters.
	cellTextInput := self
		                 newText
		                 withoutScrollBars;
		                 yourself.
	cellTextInput whenTextChangedDo: [ self updateHeight ].
	icon := self newButton
		        label: 'Mic';
		        action: [ notebook transformToCodeCell: self ];
		        yourself.
	leftMenuCanvas canvas
		add: (RSLabel new
				 translateBy: 0 @ -3;
				 text: 'μ';
				 fontSize: 16;
				 color: Color black;
				 yourself);
		when: RSMouseClick do: [ notebook transformToCodeCell: self ].
	self initializeLayout
]
