Class {
	#name : #INNotebookCellPreviewPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'textPresenter',
		'cell',
		'parent'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #actions }
INNotebookCellPreviewPresenter >> beSelected [

	self parent selectCell: self
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> cell [

	^ cell
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> cell: anObject [

	cell := anObject
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> initializeLayout [

	self layout: (SpBoxLayout newLeftToRight
			 add: textPresenter;
			 yourself)
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> initializePresenters [

	textPresenter := self newText
		                 beNotEditable;
		                 yourself.
	self whenDisplayDo: [ 
		self updateHeight.
		textPresenter withAdapterDo: [ :a | 
			UIManager default defer: [ 
				a widget backgroundColor: self unselectedColor ] ] ].
	self initializeLayout.
	textPresenter eventHandler whenMouseDownDo: [ :anEvent | 
		self selectMe ]
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> morphFor: aPresenter from: aMorph [

	aMorph presenter = aPresenter ifTrue: [ ^ aMorph ].
	aMorph owner ifNil: [ ^ nil ].
	^ self morphFor: aPresenter from: aMorph owner
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> parent [

	^ parent
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> parent: anObject [

	parent := anObject
]

{ #category : #removing }
INNotebookCellPreviewPresenter >> remove [

	parent removeCell: self
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> select [

	textPresenter withAdapterDo: [ :a | 
		a widget backgroundColor: (Color fromHexString: '77A8C8') ]
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> selectAndScrollToMe [

	self parent selectAndScrollTo: self
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> selectMe [
	
	self parent selectCell: self.
	cell ifNotNil: [ :c | c selectAndScrollToMe ]
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> text: aString [

	textPresenter text: aString
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> unselected [
	
	textPresenter withAdapterDo: [ :a | a widget backgroundColor: self unselectedColor ]
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> unselectedColor [

	^ Smalltalk ui theme backgroundColor
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> updateHeight [

	UIManager default defer: [ 
		textPresenter withAdapterDo: [ :a | 
			a widget defer: [ 
				a widget scrollPane textArea withoutSelectionBar.
				self withAdapterDo: [ :b | 
					b widget height: a widget scrollPane textArea height ] ] ] ]
]
