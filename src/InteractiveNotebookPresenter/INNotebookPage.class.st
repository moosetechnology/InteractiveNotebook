Class {
	#name : #INNotebookPage,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'previewOpened',
		'notebook',
		'mainLayout',
		'toolbar',
		'preview'
	],
	#category : #'InteractiveNotebookPresenter-Presenters'
}

{ #category : #commands }
INNotebookPage class >> buildCommandsGroupWith: aPresenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: (INLoadCommand forSpecContext: aPresenter);
		register: (INSaveCommand forSpecContext: aPresenter);
		register: (INPreviewCommand forSpecContext: aPresenter);
		register: (INExportToTextCommand forSpecContext: aPresenter);
		register: (INExportToHtmlCommand forSpecContext: aPresenter)
]

{ #category : #help }
INNotebookPage class >> helpMessage [
	
	^ 'Open the interactive notebook'
]

{ #category : #'instance creation' }
INNotebookPage class >> newModel [

	^ INNotebookModel new
]

{ #category : #'instance creation' }
INNotebookPage class >> open [

	<script>
	^ (self on: self newModel)
		  open;
		  yourself
]

{ #category : #specs }
INNotebookPage class >> title [

	^ 'Notebook'
]

{ #category : #actions }
INNotebookPage >> addTextCell [
	
	notebook addTextCell
]

{ #category : #initialization }
INNotebookPage >> announcePreviewHasBeenOpened [

	notebook announceDisplayed.
	preview announceDisplayed.
	self announceDisplayed
]

{ #category : #actions }
INNotebookPage >> chooseTextFile: messageString extensions: stringCollection path: defaultName [

	^ UIManager default
		  chooseForSaveFileReference: messageString
		  extensions: stringCollection
		  path: defaultName
]

{ #category : #initialization }
INNotebookPage >> closePreview [

	previewOpened ifFalse: [ ^ self ].
	previewOpened := false.
	mainLayout remove: preview.
	notebook announceDisplayed
]

{ #category : #accessing }
INNotebookPage >> codeCellPlaceholder [

	^ notebook codeCellPlaceholder
]

{ #category : #accessing }
INNotebookPage >> codeCellPlaceholder: anObject [

	notebook codeCellPlaceholder: anObject
]

{ #category : #initialization }
INNotebookPage >> ensurePreviewIsOpened [

	previewOpened ifTrue: [ ^ self ].
	previewOpened := true.

	mainLayout add: preview.

	self announcePreviewHasBeenOpened
]

{ #category : #initialization }
INNotebookPage >> exportDocument [

	| aFile |
	self updateModelCells.
	self model cellList ifEmpty: [ 
		self inform: 'Nothing to export'.
		^ self ].
	aFile := self
		         chooseTextFile: 'Chose export destination'
		         extensions: #( 'ston' )
		         path: 'notebook.ston'.
	aFile ifNotNil: [ self model exportDocumentAt: aFile ]
]

{ #category : #actions }
INNotebookPage >> exportToHTML [

	| aFile |
	self updateModelCells.
	self model cellList ifEmpty: [ 
		self inform: 'Nothing to export'.
		^ self ].
	aFile := self
		         chooseTextFile: 'Chose export destination'
		         extensions: #( 'html' )
		         path: 'notebook.html'.
	aFile ifNil: [ ^ self ].
	self model exportToHTMLAt: aFile.
	self reportExported: aFile
]

{ #category : #initialization }
INNotebookPage >> exportToText [

	| aFile |
	self updateModelCells.
	self model cellList ifEmpty: [ 
		self inform: 'Nothing to export'.
		^ self ].
	aFile := self
		         chooseTextFile: 'Chose export destination'
		         extensions: #( 'md' )
		         path: 'mooseNotebook.md'.
	aFile ifNotNil: [ self model exportToTextAt: aFile ]
]

{ #category : #initialization }
INNotebookPage >> fillPreview [

	self updateModelCells.

	preview
		updateWithStrings:
		self model executeAllCellsAsTextCollection
		fromCells: notebook cellList
]

{ #category : #initialization }
INNotebookPage >> importMicrodownFile [

	| file |
	file := UIManager default
		chooseExistingFileReference: 'Select your notebook file.'
		extensions: { 'ston' }
		path: '.'.

	file ifNotNil: [ self updateWithFile: file ]
]

{ #category : #initialization }
INNotebookPage >> initialize [

	super initialize.
	previewOpened := false
]

{ #category : #initialization }
INNotebookPage >> initializeLayout [

	mainLayout := SpBoxLayout newLeftToRight
		              beHomogeneous;
		              spacing: 2;
		              add: notebook;
		              yourself.

	self layout: (SpBoxLayout newVertical
			 spacing: 2;
			 add: toolbar expand: false;
			 add: mainLayout;
			 yourself)
]

{ #category : #initialization }
INNotebookPage >> initializePresenters [

	self whenDisplayDo: [
		self window whenResizingDo: [ notebook updateHeight ] ].

	self initializeToolbar.
	notebook := self instantiate: INNotebookEditorPresenter.
	preview := self instantiate: INNotebookPreviewPresenter.

	self initializeLayout
]

{ #category : #initialization }
INNotebookPage >> initializeToolbar [

	toolbar := self newToolbar
		           fillWith: self rootCommandsGroup;
		           yourself
]

{ #category : #initialization }
INNotebookPage >> initializeWindow: aMiWindowPresenter [

	super initializeWindow: aMiWindowPresenter.
	aMiWindowPresenter initialExtent: 1083.0 @ 697.0
]

{ #category : #initialization }
INNotebookPage >> openPreview [

	self ensurePreviewIsOpened.
	self fillPreview
]

{ #category : #actions }
INNotebookPage >> reportExported: aFile [

	| msg |
	msg := 'Report exported.
Click to show in folder'.

	UIManager default
		inform: msg
		actionOnClick: [ aFile openInOSFileBrowser ]
]

{ #category : #initialization }
INNotebookPage >> setModelBeforeInitialization: aModel [

	aModel ifNil: [ ^ self ].

	super setModelBeforeInitialization: aModel
]

{ #category : #initialization }
INNotebookPage >> updateHeight [

	notebook updateHeight
]

{ #category : #initialization }
INNotebookPage >> updateModelCells [

	self model cellList: notebook allModelCells.
]

{ #category : #initialization }
INNotebookPage >> updateWithFile: aFileReference [

	self model importCellsFrom: aFileReference.
	self closePreview.
	notebook updateAll
]
