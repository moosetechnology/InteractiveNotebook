Class {
	#name : #INNotebookModel,
	#superclass : #Object,
	#instVars : [
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
INNotebookModel >> addBinding: anAssociation [

	self context bindings add:
		(AdditionalBinding key: anAssociation key value: anAssociation value)
]

{ #category : #initialization }
INNotebookModel >> addBindings: aDictionary [

	self context bindings addAll:
		(aDictionary keysAndValuesDo: [ :key :value |
			 AdditionalBinding key: key value: value ])
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

	needToUpdate := true.
	cellList := anOrderedCollection
]

{ #category : #accessing }
INNotebookModel >> context [

	^ context
]

{ #category : #actions }
INNotebookModel >> executeAllCellsAsTextCollection [

	| textCollection |

	generatedDocument := String streamContents: [ :p | 
		              textCollection := cellList collect: [ :cell | 
			                                | str |
			                                str := String streamContents: [ :s | 
				                                       cell
					                                       printContentIn: s
					                                       withContext: context ].
			                                p nextPutAll: str.
			                                p nextPut: Character cr.
			                                str ] ].
	^ textCollection
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
	self initializeBindings.
	self initializeContext
]

{ #category : #initialization }
INNotebookModel >> initializeBindings [

	additionalBindings := {
		                      (AdditionalBinding key: 'stream' value: nil).
		                      (AdditionalBinding key: 'printer' value: nil) }
]

{ #category : #initialization }
INNotebookModel >> initializeContext [

	context := CompilationContext new
		           bindings: self additionalBindings;
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
