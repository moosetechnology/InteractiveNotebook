Class {
	#name : #INNotebookCodeCellPresenter,
	#superclass : #INNotebookAbstractCellPresenter,
	#category : #InteractiveNotebookPresenter
}

{ #category : #converting }
INNotebookCodeCellPresenter >> asModelCell [

	^ INNotebookCodeCellModel new
		  text: cellTextInput text;
		  yourself
]

{ #category : #api }
INNotebookCodeCellPresenter >> beCode [

	^ self
]

{ #category : #api }
INNotebookCodeCellPresenter >> beText [
	
	notebook transformToTextCell: self
]

{ #category : #initialization }
INNotebookCodeCellPresenter >> initializePresenters [

	super initializePresenters.
	cellTextInput := self newCode
		                 withoutLineNumbers;
		                 beForScripting;
		                 placeholder: notebook codeCellPlaceholder;
		                 yourself.
	cellTextInput whenTextChangedDo: [ self updateHeight ].
	self interactionModel: notebook interactionModel.

	icon := self newButton
		        label: 'Code';
		        action: [ notebook transformToTextCell: self ].

	leftMenuCanvas canvas
		add: (RSLabel new
				 text: '[ ]';
				 bold;
				 color: Color black;
				 yourself);
		when: RSMouseClick do: [ notebook transformToTextCell: self ].
	self initializeLayout
]

{ #category : #api }
INNotebookCodeCellPresenter >> interactionModel: anEnvironment [

	cellTextInput interactionModel: anEnvironment
]

{ #category : #accessing }
INNotebookCodeCellPresenter >> notebook: aNoteBook [

	notebook := aNoteBook.
]
