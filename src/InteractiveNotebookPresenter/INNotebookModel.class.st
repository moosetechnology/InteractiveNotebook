Class {
	#name : #INNotebookModel,
	#superclass : #Object,
	#instVars : [
		'needToUpdate',
		'cellList',
		'fileName',
		'printer',
		'bindings'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #initialization }
INNotebookModel >> addBinding: anAssociation [

	bindings add: anAssociation
]

{ #category : #adding }
INNotebookModel >> addBindings: aDictionary [

	aDictionary associationsDo: [ :association |
		self addBinding: association ]
]

{ #category : #initialization }
INNotebookModel >> addCell: aCell [

	cellList add: aCell
]

{ #category : #initialization }
INNotebookModel >> addTextCell [

	self addCell: INNotebookTextCellModel new
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

{ #category : #actions }
INNotebookModel >> executeAllCellsAsTextCollection [

	^ cellList collect: [ :cell |
		  String streamContents: [ :p |
			  | str |

			  printer stream: p.
			  printer print: (cell contentAsStringInContext: self newContext).
			  str := p contents.
			  str ] ]
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
		stream nextPutAll:
			(MicHTMLVisitor asHTMLString: self generateDocument) ]
]

{ #category : #export }
INNotebookModel >> exportToTextAt: aFileReference [

	"Export the generated document, i.e., the resulting text of all cells execution."

	aFileReference ifNil: [ ^ self ].
	aFileReference ensureDelete.
	aFileReference ifNotNil: [
		aFileReference writeStreamDo: [ :s | s << self generateDocument ] ]
]

{ #category : #export }
INNotebookModel >> generateDocument [

	^ String streamContents: [ :s |
		  cellList do: [ :notebookCell | s << notebookCell previewCell text ] ]
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
	printer := INMicrodownNotebookPrinter new.
	bindings := Dictionary new
]

{ #category : #accessing }
INNotebookModel >> name [

	^ fileName ifNil: [ 'new *' ]
]

{ #category : #accessing }
INNotebookModel >> newContext [

	^ CompilationContext new
		  bindings: bindings;
		  yourself
]

{ #category : #accessing }
INNotebookModel >> printer: anINNotebookPrinter [

	printer := anINNotebookPrinter
]
