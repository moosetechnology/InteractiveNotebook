"
I am the preview side of a notebook page. I create preview cells to display the result of the compilation of each cell.
"
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

{ #category : #creating }
INNotebookPreviewPresenter >> createInspectorViewFor: anObject [

	| ctxs presenter |
	ctxs := anObject inspectionContexts.
	presenter := self newNotebook.
	ctxs do: [ :ctx |
		ctx withoutEvaluator.
		presenter addPage: (self newPageForContext: ctx andObject: anObject) ].
	^ presenter 
]

{ #category : #creating }
INNotebookPreviewPresenter >> createSinglePageViewFor: anObject [

	| ctx |
	ctx := anObject inspectionContexts first.
	ctx withoutEvaluator.
	^ (self newInspectionForContext: ctx andObject: anObject) 
]

{ #category : #creating }
INNotebookPreviewPresenter >> createViewFor: anObject [

	^ self mustDisplayInspectorView
		  ifTrue: [ self createInspectorViewFor: anObject ]
		  ifFalse: [ self createSinglePageViewFor: anObject ]
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

{ #category : #'accessing - attributes' }
INNotebookPreviewPresenter >> mustDisplayInspectorView [

	^ browser owner owner displayInspectorView 
]

{ #category : #actions }
INNotebookPreviewPresenter >> newInspectionForContext: aContext andObject: anObject [
	
	^ StObjectContextPresenter on: (StObjectContextModel new 
		inspection: self;
		inspectedObject: anObject;
		context: aContext; 
		yourself)
]

{ #category : #actions }
INNotebookPreviewPresenter >> newPageForContext: aContext andObject: anObject [

	^ SpNotebookPage new
		title: aContext title;
		presenterProvider: [ self newInspectionForContext: aContext andObject: anObject ];
		yourself
]

{ #category : #actions }
INNotebookPreviewPresenter >> newPreviewCellWith: anObject [

	| pCell |
	pCell := (self instantiate: INNotebookCellPreviewPresenter)
		         contentPresenter: (self createViewFor: anObject);
		         parent: self;
		         yourself.
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
INNotebookPreviewPresenter >> updateWithStringCollection: aCollection andCells: cells [

	| col |
	col := OrderedCollection new.
	aCollection withIndexDo: [ :obj :i | 
		| cell pCell |
		cell := cells at: i.
		cell model needToUpdate
			ifTrue: [ 
				pCell := self newPreviewCellWith: obj.
				pCell cell: cell.
				cell previewCell: pCell.
				cell model previewCell: pCell.
				cell model needToUpdate: false ]
			ifFalse: [ pCell := cell previewCell ].
		col add: pCell ].
	previewCells := col.
	self relayout
]
