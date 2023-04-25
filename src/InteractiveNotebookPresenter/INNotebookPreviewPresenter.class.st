Class {
	#name : #INNotebookPreviewPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'previewCells',
		'sep',
		'browser',
		'topMenu',
		'closeButton',
		'mainLayout',
		'scrollLayout'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #accessing }
INNotebookPreviewPresenter >> browser [

	^ browser
]

{ #category : #accessing }
INNotebookPreviewPresenter >> browser: anObject [

	browser := anObject
]

{ #category : #initialization }
INNotebookPreviewPresenter >> close [

	browser closePreview
]

{ #category : #initialization }
INNotebookPreviewPresenter >> initialize [

	super initialize.
	previewCells := OrderedCollection new.
]

{ #category : #initialization }
INNotebookPreviewPresenter >> initializeLayout [

	mainLayout := SpBoxLayout newTopToBottom
		              add: self newRoassal;
		              yourself.
	scrollLayout := SpScrollableLayout with: (self newPresenter
			                 layout: mainLayout;
			                 yourself).
	self layout: (SpBoxLayout newLeftToRight
			 spacing: 6;
			 add: sep width: 1;
			 add: (SpBoxLayout newTopToBottom
					  add: topMenu height: 16;
					  add: scrollLayout;
					  yourself);
			 yourself)
]

{ #category : #initialization }
INNotebookPreviewPresenter >> initializePresenters [

	sep := self newRoassal.
	sep canvas color: Color gray translucent.
	sep canvas when: RSExtentChangedEvent do: [ self updateHeight ].
	topMenu := self newRoassal.
	topMenu canvas color: Color transparent.
	closeButton := RSBitmap new
		               form: (Smalltalk ui icons iconNamed: #windowClose);
		               model: 'Delete';
		               size: 16;
		               yourself.
	topMenu canvas add: closeButton.
	closeButton
		setAsFixed;
		translateBy: 8 @ 8.
	closeButton when: RSMouseClick do: [ self close ].
	self whenDisplayDo: [ self relayout ].
	self initializeLayout
]

{ #category : #actions }
INNotebookPreviewPresenter >> newPreviewCellWith: anObject [
	| pCell |
	pCell := (self instantiate: INNotebookCellPreviewPresenter)
		  setContentPresenter: (anObject createContentPreviewPresenter);
		  parent: self;
		  yourself.
	anObject addContentToPreviewPresenter: pCell getContentPresenter.
	^ pCell 
]

{ #category : #initialization }
INNotebookPreviewPresenter >> relayout [

	| newLayout |
	newLayout := SpBoxLayout newTopToBottom.
	previewCells do: [ :e | newLayout add: e expand: false ].

	scrollLayout child layout: newLayout.
	previewCells do: [ :e | e announceDisplayed ]
]

{ #category : #actions }
INNotebookPreviewPresenter >> scrollTo: aMiNoteBookCellPreview [

	scrollLayout withAdapterDo: [ :a | 
		aMiNoteBookCellPreview withAdapterDo: [ :b | 
			a widget scrollToShow: b widget bounds ] ]
]

{ #category : #actions }
INNotebookPreviewPresenter >> select: aMiNoteBookCellPreview [

	previewCells do: [ :c | c unselected ].
	aMiNoteBookCellPreview select.
]

{ #category : #actions }
INNotebookPreviewPresenter >> selectAndScrollTo: aMiNoteBookCellPreview [

	self select: aMiNoteBookCellPreview.
	self scrollTo: aMiNoteBookCellPreview
]

{ #category : #initialization }
INNotebookPreviewPresenter >> updateHeight [

	previewCells do: [ :c | c updateHeight ]
]

{ #category : #actions }
INNotebookPreviewPresenter >> updateWithStringCollection: aCollection [

	previewCells := aCollection collect: [ :s | 
		                self newPreviewCellWith: s ].
	self relayout
]

{ #category : #actions }
INNotebookPreviewPresenter >> updateWithStringCollection: aCollection andCells: cells [

	| col |
	col := OrderedCollection new.
	aCollection withIndexDo: [ :e :i | 
		| cell pCell |
		cell := cells at: i.
		pCell := self newPreviewCellWith: (aCollection at: i).
		pCell cell: cell.
		cell previewCell: pCell.
		col add: pCell ].
	previewCells := col.
	self relayout
]
