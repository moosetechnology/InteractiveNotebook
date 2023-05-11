"
I am the main presenter window for the Notebook.

I am able to create new notebook tabs (each tab is an editable notebook with its own cells), and I can also import or export a notebook to various file formats.
"
Class {
	#name : #INNotebookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'toolbar',
		'mainLayout',
		'sep',
		'tabbedPresenter'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #help }
INNotebookPresenter class >> helpMessage [
	
	^ 'Open the interactive notebook'
]

{ #category : #'world menu' }
INNotebookPresenter class >> menuCommandOn: aBuilder [

	<worldMenu>
	<miBrowsers>
	(aBuilder item: #Reporter)
		parent: #Moose;
		label: self title;
		icon: (self iconNamed: #smallExport);
		order: 6;
		help: self helpMessage;
		action: [ self open ]
]

{ #category : #'world menu' }
INNotebookPresenter class >> menuItem [

	^ #reporteBuilder
]

{ #category : #'instance creation' }
INNotebookPresenter class >> open [
	^ self new
		  open;
		  yourself
]

{ #category : #specs }
INNotebookPresenter class >> title [

	^ 'Notebook'
]

{ #category : #initialization }
INNotebookPresenter >> addNewTab [

	self addNewTabWithModel: (INNotebookModel new
			 addTextCell;
			 yourself)
]

{ #category : #initialization }
INNotebookPresenter >> addNewTabWithModel: aModel [

	| newTab |
	newTab := self newNotebookPage
		          title: aModel name;
		          beCloseable;
		          presenterProvider: [ 
			          self
				          instantiate: INNotebookWithPreviewPresenter
				          on: aModel ];
		          yourself.
	tabbedPresenter addPage: newTab.
	tabbedPresenter selectPage: newTab
]

{ #category : #actions }
INNotebookPresenter >> chooseTextFile: messageString extensions: stringCollection path: defaultName [
	^UIManager default
		chooseForSaveFileReference: messageString 
		extensions: stringCollection 
		path: defaultName
]

{ #category : #initialization }
INNotebookPresenter >> closePreview [

	self currentNotebook announceDisplayed
]

{ #category : #initialization }
INNotebookPresenter >> currentNotebook [

	^ tabbedPresenter selectedPage activePresenter
]

{ #category : #initialization }
INNotebookPresenter >> exportDocument [

	self currentNotebook exportDocument
]

{ #category : #actions }
INNotebookPresenter >> exportToHTML [

	self currentNotebook exportToHTML
]

{ #category : #initialization }
INNotebookPresenter >> exportToText [

	self currentNotebook exportToText
]

{ #category : #initialization }
INNotebookPresenter >> importMicrodownFile [

	| file |
	file := UIManager default
		chooseExistingFileReference: 'Select your notebook file.'
		extensions: { 'ston' }
		path: '.'.

	file ifNotNil: [ self updateWithFile: file ]
]

{ #category : #initialization }
INNotebookPresenter >> initializeLayout [

	sep := self newRoassal.
	mainLayout := SpBoxLayout newLeftToRight
		              beHomogeneous;
		              spacing: 2;
		              add: tabbedPresenter;
		              yourself.
	sep canvas color: Color gray translucent.
	self layout: (SpBoxLayout newTopToBottom
			 spacing: 1;
			 add: toolbar expand: false;
			 add: sep height: 1;
			 add: mainLayout;
			 yourself)
]

{ #category : #initialization }
INNotebookPresenter >> initializePresenters [

	self initializeToolbar.
	self whenDisplayDo: [ 
		self window whenResizingDo: [ self currentNotebook updateHeight ] ].
	
	tabbedPresenter := self newNotebook.
	self addNewTab.
	self initializeLayout
]

{ #category : #initialization }
INNotebookPresenter >> initializeToolbar [

	toolbar := self newToolbar
		           addItem: (self newToolbarButton
				            label: 'Load...';
				            icon: (self iconNamed: #smallLoadProject);
				            action: [ self importMicrodownFile ];
				            yourself);
		           addItem: (self newToolbarButton
				            label: 'Save...';
				            icon: (self iconNamed: #smallExport);
				            action: [ self exportDocument ];
				            yourself);
		           addItem: (self newToolbarButton
				            label: 'Preview';
				            icon: (self iconNamed: #smallExport);
				            action: [ self preview ];
				            yourself);
		           addItem: (self newToolbarButton
				            label: 'Preview (recalculated)';
				            icon: (self iconNamed: #smallExport);
				            action: [ self previewReloaded ];
				            yourself);
		           addItem: (self newToolbarButton
				            label: 'Export to text';
				            icon: (self iconNamed: #smallExport);
				            action: [ self exportToText ];
				            yourself);
		           addItem: (self newToolbarButton
				            label: 'Export to HTML';
				            icon: (self iconNamed: #smallExport);
				            action: [ self exportToHTML ];
				            yourself);
		           addItem: (self newToolbarButton
				            label: 'New Tab';
				            icon: (self iconNamed: #add);
				            action: [ self addNewTab ];
				            yourself);
		           yourself
]

{ #category : #initialization }
INNotebookPresenter >> initializeWindow: aMiWindowPresenter [

	super initializeWindow: aMiWindowPresenter.
	aMiWindowPresenter initialExtent: 1083.0 @ 697.0
]

{ #category : #initialization }
INNotebookPresenter >> openPreview [

	self currentNotebook openPreview
]

{ #category : #initialization }
INNotebookPresenter >> preview [

	self currentNotebook preview
]

{ #category : #'as yet unclassified' }
INNotebookPresenter >> previewReloaded [
	self currentNotebook previewReloaded
]

{ #category : #actions }
INNotebookPresenter >> reportExported: aFile [

	| msg |
	msg := 'Report exported.
Click to show in folder'.

	UIManager default
		inform: msg
		actionOnClick: [ aFile openInOSFileBrowser ]
]

{ #category : #accessing }
INNotebookPresenter >> separator [

	^ sep
]

{ #category : #initialization }
INNotebookPresenter >> updateWithFile: aFileReference [

	| newModel |
	newModel := INNotebookModel new.
	newModel importCellsFrom: aFileReference.
	self addNewTabWithModel: newModel
]
