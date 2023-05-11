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
		'additionalBindings',
		'fileName'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #accessing }
INNotebookModel class >> defaultName [

	^ 'new *'
]

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

{ #category : #export }
INNotebookModel >> createGeneratedDocumentAt: aFileReference [

	| generatedDocument parentReference |
	parentReference := aFileReference parent.
	generatedDocument := String streamContents: [ :stream | 
		                     cellList doWithIndex: [ :cell :index | 
			                     stream nextPutAll:
				                     (cell previewCell getContent
					                      generateMicrodownAt: parentReference
					                      withIndex: index).
			                     stream nextPutAll: '  '.
			                     stream nextPut: Character cr ] ].
	^ generatedDocument
]

{ #category : #actions }
INNotebookModel >> executeAllCellsAsCollection [

	| collection |
	self initializeContext.

	collection := cellList collect: [ :cell | 
		              cell needToUpdate
			              ifTrue: [ cell getContentwithContext: context ]
			              ifFalse: [ nil ] ].  	"has to be nil, so the list has the right size"
	^ collection 										"while still compiling only when necessary"
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
		stream nextPutAll: (MicHTMLVisitor asHTMLString:
				 (self createGeneratedDocumentAt: aFileReference)) ]
]

{ #category : #export }
INNotebookModel >> exportToTextAt: aFileReference [

	"Export the generated document, i.e., the resulting text of all cells execution."

	aFileReference ifNil: [ ^ self ].
	aFileReference ensureDelete.
	aFileReference ifNotNil: [ 
		aFileReference writeStreamDo: [ :s | 
			s << (self createGeneratedDocumentAt: aFileReference) ] ]
]

{ #category : #actions }
INNotebookModel >> importCellsFrom: aFileReference [

	aFileReference ifNil: [ ^ self ].
	fileName := aFileReference basenameWithoutExtension.
	cellList := STON fromString: aFileReference contents
]

{ #category : #initialization }
INNotebookModel >> initialize [

	super initialize.
	cellList := OrderedCollection new.
	additionalBindings := Dictionary new.
	self initializeContext
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

	^ fileName ifNil: [ self class defaultName ]
]

{ #category : #'as yet unclassified' }
INNotebookModel >> needToUpdateAllCells [
	cellList do: [ :c | c needToUpdate: true ]
]
