"
I am a notebook page (a tab of the main notebook window), containing an editor page and a preview page. 

I own an instance of INNotebookModel that I use to produce a document to export or to execute the cells to create the preview of the notebook.


"
Class {
	#name : #INNotebookWithPreviewPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'previewOpened',
		'notebook',
		'notebookPreview',
		'mainLayout'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #specs }
INNotebookWithPreviewPresenter class >> defaultNotebookExportName [

	^ 'notebook'
]

{ #category : #'instance creation' }
INNotebookWithPreviewPresenter class >> newModel [

	^ INNotebookModel new
]

{ #category : #specs }
INNotebookWithPreviewPresenter class >> title [

	^ 'Notebook'
]

{ #category : #actions }
INNotebookWithPreviewPresenter >> chooseTextFile: messageString extensions: stringCollection path: defaultName [
	^UIManager default
		chooseForSaveFileReference: messageString 
		extensions: stringCollection 
		path: defaultName
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> closePreview [

	previewOpened ifFalse: [ ^ self ].
	previewOpened := false.
	mainLayout remove: notebookPreview.
	notebook announceDisplayed
]

{ #category : #accessing }
INNotebookWithPreviewPresenter >> codeCellPlaceholder [

	^ notebook codeCellPlaceholder
]

{ #category : #accessing }
INNotebookWithPreviewPresenter >> codeCellPlaceholder: anObject [

	notebook codeCellPlaceholder: anObject
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> exportDocument [

	| aFile |
	self previewReloaded.
	self model cellList ifEmpty: [ 
		self inform: 'Nothing to export'.
		^ self ].
	aFile := self
		         chooseTextFile: 'Chose export destination'
		         extensions: #( 'ston' )
		         path: self exportFilename , '.ston'.
	aFile ifNotNil: [ self model exportDocumentAt: aFile ]
]

{ #category : #'as yet unclassified' }
INNotebookWithPreviewPresenter >> exportFilename [

	^ self model name = self model class defaultName
		  ifTrue: [ self class defaultNotebookExportName ]
		  ifFalse: [ self model name ]
]

{ #category : #actions }
INNotebookWithPreviewPresenter >> exportToHTML [

	| aFile |
	self previewReloaded.
	self model cellList ifEmpty: [ 
		self inform: 'Nothing to export'.
		^ self ].
	aFile := self
		         chooseTextFile: 'Chose export destination'
		         extensions: #( 'html' )
		         path: self exportFilename , '.html'.
	aFile ifNil: [ ^ self ].
	self model exportToHTMLAt: aFile.
	self reportExported: aFile
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> exportToText [

	| aFile |
	self previewReloaded.
	self model cellList ifEmpty: [ 
		self inform: 'Nothing to export'.
		^ self ].
	aFile := self
		         chooseTextFile: 'Chose export destination'
		         extensions: #( 'md' )
		         path: self exportFilename , '.md'.
	aFile ifNotNil: [ self model exportToTextAt: aFile ]
]

{ #category : #actions }
INNotebookWithPreviewPresenter >> followEntity: anEntity [

	self model followEntity: anEntity mooseModel.
	notebook mooseModel: anEntity mooseModel
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> importMicrodownFile [

	| file |
	file := UIManager default
		chooseExistingFileReference: 'Select your notebook file.'
		extensions: { 'ston' }
		path: '.'.

	file ifNotNil: [ self updateWithFile: file ]
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> initialize [

	super initialize.
	previewOpened := false
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> initializeLayout [

	mainLayout := SpBoxLayout newLeftToRight
		              beHomogeneous;
		              spacing: 2;
		              add: notebook;
		              yourself.
	self layout: (SpBoxLayout newLeftToRight
		              beHomogeneous;
		              spacing: 2;
		              add: mainLayout;
		              yourself)
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> initializePresenters [

	self whenDisplayDo: [ 
		self window whenResizingDo: [ notebook updateHeight ] ].

	notebook := self instantiate: INNotebookEditorPresenter.
	notebook browser: self.
	notebookPreview := self instantiate: INNotebookPreviewPresenter.
	notebookPreview browser: self.

	self initializeLayout
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> initializeWindow: aMiWindowPresenter [

	super initializeWindow: aMiWindowPresenter.
	aMiWindowPresenter initialExtent: 1083.0 @ 697.0
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> openPreview [

	previewOpened ifTrue: [ ^ self ].
	previewOpened := true.
	mainLayout add: notebookPreview.
	notebook announceDisplayed.
	notebookPreview announceDisplayed.
	self announceDisplayed
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> preview [

	self openPreview.
	self updateModelCells.

	notebookPreview
		updateWithStringCollection:
		self model executeAllCellsAsCollection
		andCells: notebook cellList
]

{ #category : #'as yet unclassified' }
INNotebookWithPreviewPresenter >> previewReloaded [ 
	self model needToUpdateAllCells.
	self preview
]

{ #category : #actions }
INNotebookWithPreviewPresenter >> reportExported: aFile [

	| msg |
	msg := 'Report exported.
Click to show in folder'.

	UIManager default
		inform: msg
		actionOnClick: [ aFile openInOSFileBrowser ]
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> setModelBeforeInitialization: aModel [

	aModel ifNil: [ ^ self ].

	super setModelBeforeInitialization: aModel
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> updateHeight [ 
"je ne sais pas si ça devrait être appelé ici, au moins avec une méthode y'a pas de bug"
	notebook updateHeight.
	previewOpened ifTrue: [ notebookPreview updateHeight ]
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> updateModelCells [
	
	notebook updateModelCells.
	self model cellList: notebook allModelCells.
]

{ #category : #initialization }
INNotebookWithPreviewPresenter >> updateWithFile: aFileReference [

	self model importCellsFrom: aFileReference.
	self closePreview.
	notebook updateAll
]
