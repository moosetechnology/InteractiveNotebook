Class {
	#name : 'INNotebookPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'tabbedPresenter',
		'addTabButton',
		'printer',
		'bindings'
	],
	#category : 'InteractiveNotebookPresenter-Presenters',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Presenters'
}

{ #category : 'help' }
INNotebookPresenter class >> helpMessage [
	
	^ 'Open the interactive notebook'
]

{ #category : 'initialization' }
INNotebookPresenter class >> initialExtent [

	^ 1083.0 @ 697.0
]

{ #category : 'instance creation' }
INNotebookPresenter class >> open [

	<script>
	^ self new
		  open;
		  yourself
]

{ #category : 'specs' }
INNotebookPresenter class >> title [

	^ 'Notebook'
]

{ #category : 'configuration' }
INNotebookPresenter >> addBinding: anAssociation [

	bindings add: anAssociation.
	tabbedPresenter pages do: [ :page |
		page activePresenter ifNotNil: [ :inNotebookPage |
			inNotebookPage model addBinding: anAssociation ] ]
]

{ #category : 'adding' }
INNotebookPresenter >> addNewTab [

	| newTab |

	newTab := self newNotebookPage.
	newTab
		title: 'New*';
		beCloseable;
		presenterProvider: [
			self instantiate: INNotebookPage on: self newModel ].

	tabbedPresenter addPage: newTab.
	tabbedPresenter selectPage: newTab
]

{ #category : 'initialization' }
INNotebookPresenter >> connectPresenters [

	self whenDisplayDo: [
		self window whenResizingDo: [
			tabbedPresenter selectedPage activePresenter updateHeight ] ]
]

{ #category : 'initialization' }
INNotebookPresenter >> initialize [

	super initialize.
	printer := MiMooseNotebookPrinter new.
	bindings := Dictionary new.
	self addNewTab
]

{ #category : 'initialization' }
INNotebookPresenter >> initializeAddTabButton [

	addTabButton := self newButton
		                addStyle: 'small';
		                icon: (self iconNamed: #smallAdd);
		                help: 'Add new tab';
		                action: [ self addNewTab ];
		                yourself
]

{ #category : 'initialization' }
INNotebookPresenter >> initializeLayout [

	self layout: (SpOverlayLayout new
			 child: tabbedPresenter;
			 addOverlay: addTabButton withConstraints: [ :c |
				 c
					 vAlignStart;
					 hAlignEnd ];
			 yourself)
]

{ #category : 'initialization' }
INNotebookPresenter >> initializePresenters [

	tabbedPresenter := self newNotebook.
	self initializeAddTabButton.

	self initializeLayout
]

{ #category : 'initialization' }
INNotebookPresenter >> initializeWindow: aMiWindowPresenter [

	super initializeWindow: aMiWindowPresenter.
	aMiWindowPresenter initialExtent: self class initialExtent
]

{ #category : 'adding' }
INNotebookPresenter >> newModel [

	^ INNotebookModel new
		  printer: printer;
		  addBindings: bindings;
		  addTextCell;
		  yourself
]

{ #category : 'configuration' }
INNotebookPresenter >> printer: aPrinter [

	printer := aPrinter.
	tabbedPresenter pages do: [ :page |
		page activePresenter ifNotNil: [ :inNotebookPage |
			inNotebookPage model printer: aPrinter ] ]
]
