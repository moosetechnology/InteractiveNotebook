Class {
	#name : 'INNotebookEditorPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cellList',
		'lastCellAdded',
		'selectedCell',
		'headerSep',
		'cellLayout',
		'codeCellPlaceholder'
	],
	#category : 'InteractiveNotebookPresenter-Presenters',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Presenters'
}

{ #category : 'adding' }
INNotebookEditorPresenter >> add: aCell [

	self layout add: aCell expand: false.
	aCell announceDisplayed.
	lastCellAdded takeKeyboardFocus
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> addTextCellAfter: aCell [

	lastCellAdded := self newTextCell.
	cellList add: lastCellAdded after: aCell.
	selectedCell := lastCellAdded.
	self relayout
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> addTextCellBefore: aCell [

	lastCellAdded := self newTextCell.
	cellList add: lastCellAdded before: aCell.
	selectedCell := lastCellAdded.
	self relayout
]

{ #category : 'accessing' }
INNotebookEditorPresenter >> allModelCells [

	^ cellList asOrderedCollection collect: [ :cell | cell asModelCell ]
]

{ #category : 'accessing' }
INNotebookEditorPresenter >> cellList [

	^ cellList
]

{ #category : 'accessing' }
INNotebookEditorPresenter >> codeCellPlaceholder [
	
	^ codeCellPlaceholder
]

{ #category : 'accessing' }
INNotebookEditorPresenter >> codeCellPlaceholder: anObject [

	codeCellPlaceholder := anObject
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> defer: aBlock times: n [

	n traceCr.
	self withAdapterDo: [ :a | 
		a widget defer: [ 
			n <= 0
				ifTrue: [ a widget defer: aBlock ]
				ifFalse: [ self defer: aBlock times: n - 1 ] ] ]
]

{ #category : 'accessing' }
INNotebookEditorPresenter >> headerSep [

	^ headerSep
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> initialize [

	codeCellPlaceholder := 'Code'.
	cellList := LinkedList new.
	super initialize
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> initializeLayout [

	cellLayout := SpBoxLayout newTopToBottom
		              spacing: self layoutSpacing;
		              yourself.
	self layout: (SpScrollableLayout with: (SpBoxLayout newTopToBottom
				  spacing: self layoutSpacing;
				  add: headerSep height: 1;
				  add: cellLayout;
				  yourself))
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> initializePresenters [

	(headerSep := self newRoassal) canvas color: Color transparent.
	headerSep canvas
		when: RSExtentChangedEvent
		do: [ self updateHeight ]
		for: self.
	self whenDisplayDo: [ self updateHeight ].
	self initializeLayout
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> layoutSpacing [

	^ 10
]

{ #category : 'accessing' }
INNotebookEditorPresenter >> model [

	^ self owner model
]

{ #category : 'removing' }
INNotebookEditorPresenter >> moveDown: aCell [

	| idx |
	idx := cellList indexOf: aCell.
	idx >= cellList size ifTrue: [ ^ self ].
	cellList swap: idx with: idx + 1.
	selectedCell := aCell.
	self relayout
]

{ #category : 'removing' }
INNotebookEditorPresenter >> moveUp: aCell [

	| idx |
	idx := cellList indexOf: aCell.
	idx <= 1 ifTrue: [ ^ self ].
	cellList swap: idx with: idx - 1.
	selectedCell := aCell.
	self relayout
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> newCodeCell [

	^ (self instantiate: INNotebookCodeCellPresenter on: self)
		  bindings: self model bindings;
		  yourself
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> newTextCell [

	^ (self instantiate: INNotebookTextCellPresenter) notebook: self
]

{ #category : 'adding' }
INNotebookEditorPresenter >> relayout [

	| newLayout |
	newLayout := SpBoxLayout newTopToBottom
		             spacing: self layoutSpacing;
		             yourself.
	cellList do: [ :cell | newLayout add: cell expand: false ].

	cellLayout removeAll.
	cellLayout add: (self newPresenter
			 layout: newLayout;
			 yourself).
	cellList do: [ :cell | cell announceDisplayed ].
	self defer: [ 
		selectedCell ifNotNil: [ self selectAndScrollTo: selectedCell ] ]
]

{ #category : 'removing' }
INNotebookEditorPresenter >> removeCell: aCell [

	cellList remove: aCell.
	self relayout
]

{ #category : 'adding' }
INNotebookEditorPresenter >> scrollTo: aMiNoteBookCell [

	self layout withAdapterDo: [ :a | 
		aMiNoteBookCell withAdapterDo: [ :b | 
			a widget scrollToShow: b widget bounds ] ]
]

{ #category : 'removing' }
INNotebookEditorPresenter >> select: aCell [

	selectedCell := aCell.
	cellList do: [ :c | c unselect ].
	selectedCell select
]

{ #category : 'adding' }
INNotebookEditorPresenter >> selectAndScrollTo: aMiNoteBookCell [

	self selectCell: aMiNoteBookCell.
	self scrollTo: aMiNoteBookCell
]

{ #category : 'removing' }
INNotebookEditorPresenter >> selectCell: aCell [

	selectedCell := aCell.
	cellList do: [ :c | c unselect ].
	selectedCell select
]

{ #category : 'adding' }
INNotebookEditorPresenter >> transformToCodeCell: aCell [

	| width |
	lastCellAdded := self newCodeCell
		                 text: aCell text;
		                 yourself.
	width := aCell textAreaWidth.
	cellList at: (cellList indexOf: aCell) put: lastCellAdded.
	selectedCell := lastCellAdded.
	self relayout
]

{ #category : 'adding' }
INNotebookEditorPresenter >> transformToTextCell: aCell [

	| width |
	lastCellAdded := self newTextCell
		                 text: aCell text;
		                 yourself.
	width := aCell textAreaWidth.
	cellList at: (cellList indexOf: aCell) put: lastCellAdded.
	selectedCell := lastCellAdded.
	self relayout
]

{ #category : 'removing' }
INNotebookEditorPresenter >> updateAll [

	self model cellList ifEmpty: [ ^ self ].

	cellList := LinkedList new.
	cellList addAll: (self model cellList collect: [ :c |
			 (self instantiate: c presenterClass)
				 notebook: self;
				 bindings: self model bindings;
				 text: c text;
				 yourself ]).

	selectedCell := cellList last.
	self relayout
]

{ #category : 'removing' }
INNotebookEditorPresenter >> updateHeight [

	cellList do: [ :c | c updateHeight ]
]

{ #category : 'initialization' }
INNotebookEditorPresenter >> updatePresenter [

	self updateAll
]
