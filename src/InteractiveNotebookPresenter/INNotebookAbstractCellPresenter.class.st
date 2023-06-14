"
I am an abstract editing cell presenter. 

I have a presenter providing a text input (`cellTextInput`) in which the user can type Microdown text or code, depending on the cell type.

I give to my children buttons allowing to transform themselves from code cell to text cell and vice versa, to add a new text cell before or after the current cell, to move the cell up or down in the notebook, and one to delete the current cell.




"
Class {
	#name : #INNotebookAbstractCellPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'icon',
		'notebook',
		'removeButton',
		'leftMenuCanvas',
		'rightMenuCanvas',
		'deleteButton',
		'addCellBellowButton',
		'addCellAboveButton',
		'moveCellUp',
		'moveCellDown',
		'previewCell',
		'cellTextInput'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #converting }
INNotebookAbstractCellPresenter >> asModelCell [

	self subclassResponsibility
]

{ #category : #api }
INNotebookAbstractCellPresenter >> beCode [

	self subclassResponsibility
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> beSelected [

	notebook select: self.
	previewCell ifNotNil: [ :c | c beSelected ]
]

{ #category : #api }
INNotebookAbstractCellPresenter >> beText [

	self subclassResponsibility
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> beUnselected [

	leftMenuCanvas canvas color: self unselectedColor.
	leftMenuCanvas canvas signalUpdate.
	rightMenuCanvas canvas color: self unselectedColor.
	rightMenuCanvas canvas signalUpdate
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> cellTextInput [

	^ cellTextInput
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> createDescriptionFor: aString [

	^ aString asTextMorph
		  backgroundColor: (Color white alpha: 0.6);
		  borderColor: Color gray;
		  textColor: Color black;
		  borderWidth: 1;
		  margins: 2;
		  yourself
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> iconNamed: anIconName [

	INNotebookIcons icons
		at: anIconName
		ifPresent: [ :found | ^ found ].
	^ super iconNamed: anIconName
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializeLayout [

	self layout: (SpBoxLayout newLeftToRight
			 add: leftMenuCanvas width: 30;
			 add: cellTextInput;
			 add: rightMenuCanvas width: 100;
			 yourself)
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializePresenters [

	| buttons menu |
	self whenDisplayDo: [ 
		self withAdapterDo: [ 
			self adapter children second textArea announcer
				when: MorphGotFocus
				do: [ self selectMe ] ].
		self updateHeight ].
	removeButton := self newButton
		                icon: (Smalltalk ui iconNamed: #remove);
		                action: [ self remove ].
	leftMenuCanvas := self newRoassal.
	leftMenuCanvas canvas color: self unselectedColor.
	rightMenuCanvas := self newRoassal.
	rightMenuCanvas canvas color: Color transparent.
	deleteButton := RSBitmap new
		                form: (self iconNamed: #trash);
		                model: 'Delete';
		                size: 16;
		                yourself.
	deleteButton when: RSMouseClick do: [ self remove ].

	addCellBellowButton := RSBitmap new
		                       form: (self iconNamed: #addBelow);
		                       model: 'Add after';
		                       size: 16;
		                       yourself.
	addCellAboveButton := RSBitmap new
		                      form: (self iconNamed: #addAbove);
		                      model: 'Add before';
		                      size: 16;
		                      yourself.
	moveCellUp := RSBitmap new
		              form: (self iconNamed: #up);
		              model: 'Move up cell';
		              size: 16;
		              yourself.
	moveCellDown := RSBitmap new
		                form: (self iconNamed: #down);
		                model: 'Move down cell';
		                size: 16;
		                yourself.
	buttons := RSGroup withAll: { 
			           moveCellUp.
			           moveCellDown.
			           addCellBellowButton.
			           addCellAboveButton.

			           deleteButton }.
	buttons @ (RSMorphicPopupInteraction new
		 morphBuilder: [ :model | self createDescriptionFor: model ];
		 yourself).
	RSHorizontalLineLayout new
		alignMiddle;
		horizontalGap: 2;
		on: buttons.
	menu := RSComposite new
		        addAll: buttons;
		        isFixed: true;
		        color: Color transparent;
		        translateBy: 50 @ 14;
		        yourself.

	rightMenuCanvas canvas add: menu.
	menu adjustToChildren.
	menu padding: 10.
	moveCellUp when: RSMouseClick do: [ self moveUp ].
	moveCellDown when: RSMouseClick do: [ self moveDown ].
	addCellBellowButton
		when: RSMouseClick
		do: [ notebook addTextCellAfter: self ].
	addCellAboveButton
		when: RSMouseClick
		do: [ notebook addTextCellBefore: self ]
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> moveDown [

	notebook moveDown: self
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> moveUp [
	
	notebook moveUp: self
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> notebook [

	^ notebook
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> notebook: anObject [

	notebook := anObject
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> previewCell [

	^ previewCell
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> previewCell: anObject [

	previewCell := anObject
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> remove [

	notebook removeCell: self
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> select [

	self takeKeyboardFocus.
	leftMenuCanvas canvas color: self selectedColor.
	leftMenuCanvas canvas signalUpdate.
	rightMenuCanvas canvas color: self selectedColor.
	rightMenuCanvas canvas signalUpdate
]

{ #category : #actions }
INNotebookAbstractCellPresenter >> selectAndScrollToMe [

	notebook selectAndScrollTo: self
]

{ #category : #actions }
INNotebookAbstractCellPresenter >> selectMe [

	notebook select: self.
	previewCell ifNotNil: [ :c | c selectAndScrollToMe ]
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> selectedColor [

	^ Color fromHexString: '77A8C8'
]

{ #category : #api }
INNotebookAbstractCellPresenter >> setModelBeforeInitialization: aModel [

	self notebook: aModel
]

{ #category : #protocol }
INNotebookAbstractCellPresenter >> takeKeyboardFocus [

	cellTextInput takeKeyboardFocus
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> text [

	^ cellTextInput text
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> text: aText [

	cellTextInput text: aText
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> textAreaWidth [

	self layout adapter ifNil: [ ^ -1 ].
	^ self layout adapter children second width
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> unselect [

	self beUnselected
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> unselectedColor [

	^ Color transparent
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> updateHeight [
	UIManager default defer: [ 
		notebook headerSep withAdapterDo: [ :a | 
			cellTextInput withAdapterDo: [ :b | 
				| textMorph height width |
				textMorph := b widget.
				textMorph
					borderColor: Color gray translucent;
					borderWidth: 1.
				textMorph scrollPane
					vHideScrollbar;
					vScrollbarShowNever.
				width := a widget width.
				textMorph scrollPane textArea withoutSelectionBar.
				height := (RubEditingArea new
					           font: textMorph font;
					           width: width - 182;
					           beWrapped;
					           updateTextWith: cellTextInput text) height.
				self withAdapterDo: [ :c | c widget height: height + 2 ] ] ] ]
]

{ #category : #enumerating }
INNotebookAbstractCellPresenter >> whenTextChangedDo: aBlock [

	cellTextInput whenTextChangedDo: aBlock
]
