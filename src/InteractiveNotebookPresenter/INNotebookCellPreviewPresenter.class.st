"
I am a preview cell of a notebook page. 
I display the compiled content of a cell, either in Microdown if I represent a text cell, or using different types of presenters for a code cell, depending on the class of the final compiled result of the cell.

Using class extensions, the object resulting of the compilation of a cell provides me an appropriate presenter to display itself (using the extension method `createContentPreviewPresenter`). I can add this object to the created presenter (using the extension method `addContentToPreviewPresenter: anObject`).

Those presenters also use extension methods : `selectNotebookPresenter`, `unselectedNotebookPresenter` and `updateNotebookPresenterHeight`.
"
Class {
	#name : #INNotebookCellPreviewPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'presenter',
		'cell',
		'parent'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #initialization }
INNotebookCellPreviewPresenter class >> unselectedColor [

	^ Smalltalk ui theme backgroundColor
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> beSelected [
	
	self parent select: self.
	
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> cell [

	^ cell
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> cell: anObject [

	cell := anObject
]

{ #category : #'as yet unclassified' }
INNotebookCellPreviewPresenter >> getContentPresenter [
	^ presenter
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> initializeLayout [

	self layout: (SpBoxLayout newLeftToRight
			 add: presenter;
			 yourself)
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

{ #category : #actions }
INNotebookCellPreviewPresenter >> select [

	presenter selectNotebookPresenter 
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> selectAndScrollToMe [

	self parent selectAndScrollTo: self
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> selectMe [
	
	self parent select: self.
	cell ifNotNil: [ :c | c selectAndScrollToMe ]
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> setContentPresenter: aPresenter [

	presenter := aPresenter.
	self whenDisplayDo: [ 
		self updateHeight.
		"presenter withAdapterDo: [ :a | 
			UIManager default defer: [ 
				a widget backgroundColor: self unselectedColor ] ]" ].
	self initializeLayout.
	presenter eventHandler whenMouseDownDo: [ :anEvent | 
		self selectMe ]
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> text: aString [

	presenter text: aString
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> unselected [
	
	presenter unselectedNotebookPresenter 
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> updateHeight [

	UIManager default defer: [ 
		presenter updateNotebookPresenterHeight ]
]
