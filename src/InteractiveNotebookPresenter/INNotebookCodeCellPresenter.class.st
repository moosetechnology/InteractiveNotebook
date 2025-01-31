Class {
	#name : 'INNotebookCodeCellPresenter',
	#superclass : 'INNotebookAbstractCellPresenter',
	#category : 'InteractiveNotebookPresenter-Cells',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Cells'
}

{ #category : 'converting' }
INNotebookCodeCellPresenter >> asModelCell [

	^ INNotebookCodeCellModel new
		  text: cell text;
		  yourself
]

{ #category : 'accessing' }
INNotebookCodeCellPresenter >> bindings: aDictionary [

	aDictionary associationsDo: [ :binding |
		cell interactionModel addBinding: binding ]
]

{ #category : 'initialization' }
INNotebookCodeCellPresenter >> initializeLeftButton [

	super initializeLeftButton.
	leftMenuCanvas canvas
		add: (RSLabel new
				 text: '[ ]';
				 bold;
				 color: Color black;
				 yourself);
		when: RSMouseClick
		do: [ notebook transformToTextCell: self ]
		for: self
]

{ #category : 'initialization' }
INNotebookCodeCellPresenter >> initializePresenters [

	super initializePresenters.

	cell := self newCode
		        withoutLineNumbers;
		        beForScripting;
		        interactionModel: self owner model interactionModel;
		        placeholder: owner codeCellPlaceholder;
		        yourself.
	cell whenTextChangedDo: [ self updateHeight ].

	self initializeLayout
]

{ #category : 'accessing' }
INNotebookCodeCellPresenter >> notebook: aNoteBook [

	notebook := aNoteBook
]

{ #category : 'accessing - model' }
INNotebookCodeCellPresenter >> setModelBeforeInitialization: aNotebook [

	self notebook: aNotebook
]
