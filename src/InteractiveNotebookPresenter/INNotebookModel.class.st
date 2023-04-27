Class {
	#name : #INNotebookModel,
	#superclass : #Object,
	#instVars : [
		'textEditedSource',
		'needToUpdate',
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

	needToUpdate := true.
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

	needToUpdate := true.
	cellList := anOrderedCollection
]

{ #category : #accessing }
INNotebookModel >> context [

	^ context
]

{ #category : #actions }
INNotebookModel >> executeAllCells [

	needToUpdate ifFalse: [ ^ generatedDocument ].
	generatedDocument := String streamContents: [ :s | 
		              self initializeContextWithStream: s.
		              cellList do: [ :cell | 
			              cell printContentIn: s withContext: context.
			              s nextPut: Character cr ] ].
	needToUpdate := false.
	^ generatedDocument
]

{ #category : #actions }
INNotebookModel >> executeAllCellsAsCollection [

	| collection |
	self initializeContext.

	collection := cellList collect: [ :cell | 
		              cell getContentwithContext: context ].
	needToUpdate := false.
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
	needToUpdate := true.
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

{ #category : #accessing }
INNotebookModel >> needToUpdate [
	^ needToUpdate 
]

{ #category : #accessing }
INNotebookModel >> needToUpdate: aBoolean [
	needToUpdate := aBoolean 
]
