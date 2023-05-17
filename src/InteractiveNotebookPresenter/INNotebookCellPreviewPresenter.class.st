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
		'cell',
		'parent',
		'contentPresenter'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #actions }
INNotebookCellPreviewPresenter class >> selectedColor [

	^ Color fromHexString: '77A8C8'
]

{ #category : #initialization }
INNotebookCellPreviewPresenter class >> unselectedColor [

	^ Color transparent
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> beSelected [
	
	self parent select: self.
	
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> cell: anObject [

	cell := anObject
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> cellTextInput [

	^ cell
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> contentPresenter [
	^ contentPresenter
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> contentPresenter: aPresenter [

	contentPresenter := aPresenter.
	self whenDisplayDo: [ self updateHeight ].
	self initializeLayout.
	contentPresenter eventHandler whenMouseDownDo: [ :anEvent |
		self selectMe ]
]

{ #category : #accessing }
INNotebookCellPreviewPresenter >> getContent [

	^ parent mustDisplayInspectorView
		  ifTrue: [
			  contentPresenter selectedPage activePresenter view context
				  inspectedObject ]
		  ifFalse: [ contentPresenter view context inspectedObject ]
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> initializeLayout [

	self layout: (SpBoxLayout newLeftToRight
			 add: contentPresenter;
			 yourself)
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> initializePresenters [

	self whenDisplayDo: [
		self withAdapterDo: [ :a |
			a widget announcer when: MorphGotFocus do: [ self selectMe ] ] ]
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
	
	self withAdapterDo: [ :a | a widget color: self class selectedColor ]
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

{ #category : #accessing }
INNotebookCellPreviewPresenter >> text: aString [

	contentPresenter text: aString
]

{ #category : #actions }
INNotebookCellPreviewPresenter >> unselected [
	
	self withAdapterDo: [ :a |
		a widget color: self class unselectedColor ]
]

{ #category : #initialization }
INNotebookCellPreviewPresenter >> updateHeight [

	parent mustDisplayInspectorView
		ifFalse: [ contentPresenter specPresenter updatePresenterHeight ]
		ifTrue: [ self updateInspectorViewHeight ]
]

{ #category : #'as yet unclassified' }
INNotebookCellPreviewPresenter >> updateInspectorViewHeight [
	self withAdapterDo: [ :a | a widget height: 350 ].
]
