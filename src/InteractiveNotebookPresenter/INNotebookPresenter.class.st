Class {
	#name : #INNotebookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabbedPresenter',
		'addTabButton'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #help }
INNotebookPresenter class >> helpMessage [
	
	^ 'Open the interactive notebook'
]

{ #category : #initialization }
INNotebookPresenter class >> initialExtent [

	^ 1083.0 @ 697.0
]

{ #category : #'instance creation' }
INNotebookPresenter class >> open [

	<script>
	^ self new
		  open;
		  yourself
]

{ #category : #specs }
INNotebookPresenter class >> title [

	^ 'Notebook'
]

{ #category : #adding }
INNotebookPresenter >> addBindingToCurrentNotebook: anAssociation [

	tabbedPresenter selectedPage activePresenter model addBinding:
		anAssociation
]

{ #category : #adding }
INNotebookPresenter >> addNewTab [

	self addNewTabWithModel: (INNotebookModel new
			 addTextCell;
			 yourself)
]

{ #category : #adding }
INNotebookPresenter >> addNewTabWithModel: aModel [

	| newTab |

	newTab := self newNotebookPage.
	newTab
		title: aModel name;
		beCloseable;
		presenterProvider: [ self instantiate: INNotebookPage on: aModel ].

	tabbedPresenter addPage: newTab.
	tabbedPresenter selectPage: newTab
]

{ #category : #initialization }
INNotebookPresenter >> connectPresenters [

	self whenDisplayDo: [
		self window whenResizingDo: [
			tabbedPresenter selectedPage activePresenter updateHeight ] ]
]

{ #category : #initialization }
INNotebookPresenter >> initializeAddTabButton [

	addTabButton := self newButton
		                addStyle: 'small';
		                icon: (self iconNamed: #smallAdd);
		                help: 'Add new tab';
		                action: [ self addNewTab ];
		                yourself
]

{ #category : #initialization }
INNotebookPresenter >> initializeLayout [

	self layout: (SpOverlayLayout new
			 child: tabbedPresenter;
			 addOverlay: addTabButton withConstraints: [ :c |
				 c
					 vAlignStart;
					 hAlignEnd ];
			 yourself)
]

{ #category : #initialization }
INNotebookPresenter >> initializePresenters [

	tabbedPresenter := self newNotebook.
	self initializeAddTabButton.

	self addNewTab.

	self initializeLayout
]

{ #category : #initialization }
INNotebookPresenter >> initializeWindow: aMiWindowPresenter [

	super initializeWindow: aMiWindowPresenter.
	aMiWindowPresenter initialExtent: self class initialExtent
]
