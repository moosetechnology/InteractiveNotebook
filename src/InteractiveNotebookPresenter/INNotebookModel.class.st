"
I am the model of a notebook page (each notebook tab owns a different model).

I am responsible of the execution of each text and code cell when building a preview.
I also manage the context of the cells (the bindings allowing the user to use previously defined variables in the following cells).
Finally, I am responsible of the generation of the document to export (in Markdown, HTML, or STON).
"
Class {
	#name : #INNotebookModel,
	#superclass : #Object,
	#instVars : [
		'micDocument',
		'cellList',
		'context',
		'generatedDocument',
		'additionalBindings',
		'fileName'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #initialization }
INNotebookModel class >> initializeWith: aFileReference on: aMooseModel [

	^ self new
		  importCellsFrom: aFileReference;
		  followEntity: aMooseModel;
		  yourself
]

{ #category : #initialization }
INNotebookModel >> addCell: aCell [

	^ cellList add: aCell
]

{ #category : #initialization }
INNotebookModel >> addTextCell [
	^ self addCell: INNotebookTextCellModel new
]

{ #category : #initialization }
INNotebookModel >> additionalBindings [

	^ additionalBindings
]

{ #category : #initialization }
INNotebookModel >> additionalBindingsWithStream: aStream [

	^ self additionalBindings copyWith: { ('stream' -> aStream) }
]

{ #category : #accessing }
INNotebookModel >> cellList [

	^ cellList
]

{ #category : #accessing }
INNotebookModel >> cellList: anOrderedCollection [

	cellList := anOrderedCollection
]

{ #category : #accessing }
INNotebookModel >> context [

	^ context
]

{ #category : #actions }
INNotebookModel >> executeAllCells [

	generatedDocument := String streamContents: [ :s | 
		              self initializeContextWithStream: s.
		              cellList do: [ :cell | 
			              cell printContentIn: s withContext: context.
			              s nextPut: Character cr ] ].
	^ generatedDocument
]

{ #category : #actions }
INNotebookModel >> executeAllCellsAsCollection [

	| collection |
	self initializeContext.

	collection := cellList collect: [ :cell | 
		              cell needToUpdate
			              ifTrue: [ cell getContentwithContext: context ]
			              ifFalse: [ nil ] ].
	^ collection
]

{ #category : #export }
INNotebookModel >> exportDocumentAt: aFileReference [

	"Export the cell list in a ston file."

	aFileReference ifNil: [ ^ self ].
	aFileReference ensureDelete.
	aFileReference ifNotNil: [ 
		aFileReference writeStreamDo: [ :s | STON put: cellList onStream: s ] ]
]

{ #category : #export }
INNotebookModel >> exportToHTMLAt: aFileReference [

	"This will use the microdown HTML visitor to export the document to HTML. So your document should respect Microdown specs."
	aFileReference ifNil: [ ^ self ].
	aFileReference writeStreamDo: [ :stream | 
		stream nextPutAll: (MicHTMLVisitor asHTMLString: self generatedDocument) ]
]

{ #category : #export }
INNotebookModel >> exportToTextAt: aFileReference [

	"Export the generated document, i.e., the resulting text of all cells execution."

	aFileReference ifNil: [ ^ self ].
	aFileReference ensureDelete.
	aFileReference ifNotNil: [ 
		aFileReference writeStreamDo: [ :s | s << generatedDocument ] ]
]

{ #category : #accessing }
INNotebookModel >> generatedDocument [

	^ generatedDocument
]

{ #category : #accessing }
INNotebookModel >> generatedDocument: anObject [

	generatedDocument := anObject.
]

{ #category : #actions }
INNotebookModel >> importCellsFrom: aFileReference [

	aFileReference ifNil: [ ^ self ].
	fileName := aFileReference basename.
	cellList := STON fromString: aFileReference contents
]

{ #category : #initialization }
INNotebookModel >> initialize [

	super initialize.
	cellList := OrderedCollection new.
	additionalBindings := Dictionary new
]

{ #category : #initialization }
INNotebookModel >> initializeContext [

	context := CompilationContext new
		           bindings: self additionalBindings;
		           yourself
]

{ #category : #initialization }
INNotebookModel >> initializeContextWithStream: aStream [

	context := CompilationContext new
		           bindings: (self additionalBindingsWithStream: aStream);
		           yourself
]

{ #category : #accessing }
INNotebookModel >> micDocument [

	^ micDocument
]

{ #category : #accessing }
INNotebookModel >> name [

	^ fileName ifNil: [ 'new *' ]
]
