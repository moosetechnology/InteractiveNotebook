Class {
	#name : #INNotebookAbstractCellPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'cell',
		'notebook',
		'leftMenuCanvas',
		'previewCell',
		'rightMenuCanvas'
	],
	#category : #'InteractiveNotebookPresenter-Cells'
}

{ #category : #commands }
INNotebookAbstractCellPresenter class >> buildCommandsGroupWith: aPresenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: ((INMoveUpCellCommand forSpecContext: aPresenter)
				 iconProvider: INNotebookIcons;
				 yourself);
		register: ((INMoveDownCellCommand forSpecContext: aPresenter)
				 iconProvider: INNotebookIcons;
				 yourself);
		register: ((INAddCellAfterCommand forSpecContext: aPresenter)
				 iconProvider: INNotebookIcons;
				 yourself);
		register: ((INAddCellBeforeCommand forSpecContext: aPresenter)
				 iconProvider: INNotebookIcons;
				 yourself);
		register: ((INRemoveCellCommand forSpecContext: aPresenter)
				 iconProvider: INNotebookIcons;
				 yourself)
]

{ #category : #accessing }
INNotebookAbstractCellPresenter class >> selectedColor [

	^ Color fromHexString: '77A8C8'
]

{ #category : #initialization }
INNotebookAbstractCellPresenter class >> unselectedColor [

	^ Color transparent
]

{ #category : #commands }
INNotebookAbstractCellPresenter >> addTextCellAfter [

	^ notebook addTextCellAfter: self
]

{ #category : #commands }
INNotebookAbstractCellPresenter >> addTextCellBefore [

	^ notebook addTextCellBefore: self
]

{ #category : #converting }
INNotebookAbstractCellPresenter >> asModelCell [

	self subclassResponsibility
]

{ #category : #api }
INNotebookAbstractCellPresenter >> beSelected [

	notebook selectCell: self.
	previewCell ifNotNil: [ :c | c beSelected ]
]

{ #category : #api }
INNotebookAbstractCellPresenter >> beUnselected [

	leftMenuCanvas canvas color: self class unselectedColor.
	leftMenuCanvas canvas signalUpdate.
	rightMenuCanvas canvas color: self class unselectedColor.
	rightMenuCanvas canvas signalUpdate
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> bindings: aDictionary [

	"Nothing to do by default"

	
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> connectPresenters [

	self whenDisplayDo: [
		self withAdapterDo: [
			self adapter children second textArea announcer
				when: MorphGotFocus
				do: [ self selectMe ] ].
		self updateHeight ]
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> iconNamed: anIconName [

	INNotebookIcons icons
		at: anIconName
		ifPresent: [ :found | ^ found ].
	^ super iconNamed: anIconName
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializeButtons [

	| buttons menu |

	buttons := self rootCommandsGroup entries
		           collect: [ :command |
			           RSBitmap new
				           model: command;
				           form: (self iconNamed: command iconName);
				           size: 16;
				           when: RSMouseClick do: [ command execute ] for: self;
				           yourself ]
		           as: RSGroup.
	buttons @ INCellMenuPopupInteraction.

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
	menu padding: 10
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializeLayout [

	self layout: (SpBoxLayout newLeftToRight
			 add: leftMenuCanvas width: 30;
			 add: cell;
			 add: rightMenuCanvas width: 100;
			 yourself)
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializeLeftButton [

	leftMenuCanvas := self newRoassal.
	leftMenuCanvas canvas color: self class unselectedColor

	"Add button in subclasses"
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializePresenters [

	self initializeLeftButton.
	self initializeRightButtons
]

{ #category : #initialization }
INNotebookAbstractCellPresenter >> initializeRightButtons [

	| buttons menu |

	buttons := self rootCommandsGroup entries
		           collect: [ :command |
			           RSBitmap new
				           model: command;
				           form: (self iconNamed: command iconName);
				           size: 16;
				           when: RSMouseClick do: [ command execute ] for: self;
				           yourself ]
		           as: RSGroup.
	buttons @ INCellMenuPopupInteraction.

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

	rightMenuCanvas := self newRoassal.
	rightMenuCanvas canvas color: Color transparent.
	rightMenuCanvas canvas add: menu.
	menu adjustToChildren.
	menu padding: 10
]

{ #category : #commands }
INNotebookAbstractCellPresenter >> moveDown [

	notebook moveDown: self
]

{ #category : #commands }
INNotebookAbstractCellPresenter >> moveUp [
	
	notebook moveUp: self
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

{ #category : #commands }
INNotebookAbstractCellPresenter >> remove [

	notebook removeCell: self.
	previewCell ifNotNil: [ previewCell remove ]
]

{ #category : #api }
INNotebookAbstractCellPresenter >> select [

	self takeKeyboardFocus.
	leftMenuCanvas canvas color: self class selectedColor.
	leftMenuCanvas canvas signalUpdate.
	rightMenuCanvas canvas color: self class selectedColor.
	rightMenuCanvas canvas signalUpdate
]

{ #category : #api }
INNotebookAbstractCellPresenter >> selectAndScrollToMe [

	notebook selectAndScrollTo: self
]

{ #category : #api }
INNotebookAbstractCellPresenter >> selectMe [

	notebook selectCell: self.
	previewCell ifNotNil: [ :c | c selectAndScrollToMe ]
]

{ #category : #'api - focus' }
INNotebookAbstractCellPresenter >> takeKeyboardFocus [

	cell takeKeyboardFocus
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> text [

	^ cell text
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> text: aText [

	cell text: aText
]

{ #category : #accessing }
INNotebookAbstractCellPresenter >> textAreaWidth [

	self layout adapter ifNil: [ ^ -1 ].
	^ self layout adapter children second width
]

{ #category : #api }
INNotebookAbstractCellPresenter >> unselect [

	self beUnselected
]

{ #category : #'events - handling' }
INNotebookAbstractCellPresenter >> updateHeight [

	UIManager default defer: [ 
		notebook headerSep withAdapterDo: [ :a | 
			cell withAdapterDo: [ :b | 
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
					           updateTextWith: cell text) height.
				self withAdapterDo: [ :c | c widget height: height + 2 ] ] ] ]
]

{ #category : #'events - handling' }
INNotebookAbstractCellPresenter >> whenTextChangedDo: aBlock [

	cell whenTextChangedDo: aBlock
]
