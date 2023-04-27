Class {
	#name : #INNotebookCodeCellPresenter,
	#superclass : #INNotebookAbstractCellPresenter,
	#category : #InteractiveNotebookPresenter
}

{ #category : #converting }
INNotebookCodeCellPresenter >> asModelCell [

	^ INNotebookCodeCellModel new
		  text: cell text;
		  yourself
]

{ #category : #api }
INNotebookCodeCellPresenter >> beCode [

	^ self
]

{ #category : #api }
INNotebookCodeCellPresenter >> beText [
	
	notebook transformToTextCell: self.
	self needToUpdateModel
]

{ #category : #initialization }
INNotebookCodeCellPresenter >> initializePresenters [

	super initializePresenters.
	cell := self newCode
		        withoutLineNumbers;
		        beForScripting;
		        placeholder: notebook codeCellPlaceholder;
		        yourself.
	cell whenTextChangedDo: [ self updateHeight ].
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

	cell interactionModel: anEnvironment
]

{ #category : #accessing }
INNotebookCodeCellPresenter >> notebook: aNoteBook [

	notebook := aNoteBook.
]

{ #category : #api }
INNotebookCodeCellPresenter >> setModelBeforeInitialization: aModel [

	self notebook: aModel
]
