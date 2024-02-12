Class {
	#name : #INNotebookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'toolbar',
		'tabbedPresenter'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #commands }
INNotebookPresenter class >> buildCommandsGroupWith: aPresenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: (INLoadCommand forSpecContext: aPresenter);
		register: (INSaveCommand forSpecContext: aPresenter);
		register: (INPreviewCommand forSpecContext: aPresenter);
		register: (INExportToTextCommand forSpecContext: aPresenter);
		register: (INExportToHtmlCommand forSpecContext: aPresenter);
		register: (INNewTabCommand forSpecContext: aPresenter)
]

{ #category : #help }
INNotebookPresenter class >> helpMessage [
	
	^ 'Open the interactive notebook'
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

	self currentNotebook model addBinding: anAssociation
]

{ #category : #adding }
INNotebookPresenter >> addBindingsToCurrentNotebook: aDictionary [

	self currentNotebook model addBindings: aDictionary
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
INNotebookPresenter >> connectPresenters [

	self whenDisplayDo: [
		self window whenResizingDo: [ self currentNotebook updateHeight ] ]
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

	self layout: (SpBoxLayout newTopToBottom
			 spacing: 1;
			 add: toolbar expand: false;
			 add: self newSeparator height: 1;
			 add: self mainLayout;
			 yourself)
]

{ #category : #initialization }
INNotebookPresenter >> initializePresenters [

	self initializeToolbar.

	tabbedPresenter := self newNotebook.
	self addNewTab.
	self initializeLayout
]

{ #category : #initialization }
INNotebookPresenter >> initializeToolbar [

	toolbar := self newToolbar
		           fillWith: self rootCommandsGroup;
		           yourself
]

{ #category : #initialization }
INNotebookPresenter >> initializeWindow: aMiWindowPresenter [

	super initializeWindow: aMiWindowPresenter.
	aMiWindowPresenter initialExtent: 1083.0 @ 697.0
]

{ #category : #initialization }
INNotebookPresenter >> mainLayout [

	^ SpBoxLayout newLeftToRight
		  beHomogeneous;
		  spacing: 2;
		  add: tabbedPresenter;
		  yourself
]

{ #category : #initialization }
INNotebookPresenter >> newSeparator [

	| separator |

	separator := self newRoassal.
	separator canvas color: Color gray translucent.
	^ separator
]

{ #category : #initialization }
INNotebookPresenter >> openPreview [

	self currentNotebook openPreview
]

{ #category : #initialization }
INNotebookPresenter >> preview [

	self currentNotebook preview
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

{ #category : #initialization }
INNotebookPresenter >> updateWithFile: aFileReference [

	| newModel |
	newModel := INNotebookModel new.
	newModel importCellsFrom: aFileReference.
	self addNewTabWithModel: newModel
]
