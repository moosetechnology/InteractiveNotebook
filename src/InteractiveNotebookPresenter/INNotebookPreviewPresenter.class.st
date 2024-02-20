Class {
	#name : #INNotebookPreviewPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'previewCells',
		'sep',
		'topMenu',
		'closeButton',
		'mainLayout',
		'scrollLayout'
	],
	#category : #'InteractiveNotebookPresenter-Presenters'
}

{ #category : #initialization }
INNotebookPreviewPresenter >> close [

	owner closePreview
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
	sep canvas
		when: RSExtentChangedEvent
		do: [ self updateHeight ]
		for: self.
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
	closeButton when: RSMouseClick do: [ self close ] for: self.
	self whenDisplayDo: [ self relayout ].
	self initializeLayout
]

{ #category : #'instance creation' }
INNotebookPreviewPresenter >> newPreviewCellFrom: aNotebookCell text: aString [

	| previewCell |

	previewCell := self newPreviewCellWith: aString.

	previewCell cell: aNotebookCell.
	aNotebookCell previewCell: previewCell.

	^ previewCell
]

{ #category : #actions }
INNotebookPreviewPresenter >> newPreviewCellWith: aString [

	^ (self instantiate: INNotebookCellPreviewPresenter)
		  text: aString;
		  parent: self;
		  yourself
]

{ #category : #initialization }
INNotebookPreviewPresenter >> relayout [

	| newLayout |

	previewCells ifEmpty: [ ^ self ].
	newLayout := SpBoxLayout newTopToBottom.
	previewCells do: [ :e | newLayout add: e expand: false ].

	scrollLayout child layout: newLayout.
	previewCells do: [ :e | e announceDisplayed ]
]

{ #category : #removing }
INNotebookPreviewPresenter >> removeCell: aPreviewCell [

	previewCells remove: aPreviewCell.
	self relayout
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

	self selectCell: aMiNoteBookCellPreview.
	self scrollTo: aMiNoteBookCellPreview
]

{ #category : #actions }
INNotebookPreviewPresenter >> selectCell: aMiNoteBookCellPreview [

	previewCells do: [ :c | c unselected ].
	aMiNoteBookCellPreview select.
]

{ #category : #initialization }
INNotebookPreviewPresenter >> updateHeight [

	previewCells do: [ :c | c updateHeight ]
]

{ #category : #actions }
INNotebookPreviewPresenter >> updateWithStrings: aCollectionOfStrings fromCells: cells [

	previewCells := aCollectionOfStrings
		                with: cells
		                collect: [ :string :notebookCell |
			                self newPreviewCellFrom: notebookCell text: string ].

	self relayout
]
