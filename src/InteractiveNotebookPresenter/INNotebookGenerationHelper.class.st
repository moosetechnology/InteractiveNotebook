"
I am a helper class used to generate the document to export.
"
Class {
	#name : #INNotebookGenerationHelper,
	#superclass : #Object,
	#instVars : [
		'fileReferenceParent',
		'index',
		'listLevel'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #'instance creation' }
INNotebookGenerationHelper class >> newFor: aFileReference [

	^ self new
		  fileReferenceParent: aFileReference;
		  index: 0;
		  yourself
]

{ #category : #'*InteractiveNotebookPresenter' }
INNotebookGenerationHelper >> checkForResourcesDirectory [
	"checks whether or not the notebook resources file is already created"
	^ (fileReferenceParent / 'notebook_resources') exists
]

{ #category : #'*InteractiveNotebookPresenter' }
INNotebookGenerationHelper >> createResourcesDirectory [
	"create a resource directory, to store additional files necessary to the notebook export document, like images"
	(fileReferenceParent / 'notebook_resources') createDirectory 
]

{ #category : #accessing }
INNotebookGenerationHelper >> fileReferenceParent [

	^ fileReferenceParent
]

{ #category : #accessing }
INNotebookGenerationHelper >> fileReferenceParent: anObject [

	fileReferenceParent := anObject
]

{ #category : #'as yet unclassified' }
INNotebookGenerationHelper >> generateObject: anObject [

	self incrementIndex.
	^ anObject generateMicrodownUsingHelper: self
]

{ #category : #'as yet unclassified' }
INNotebookGenerationHelper >> incrementIndex [

	index := index + 1.
]

{ #category : #accessing }
INNotebookGenerationHelper >> index [

	^ index
]

{ #category : #accessing }
INNotebookGenerationHelper >> index: anObject [

	index := anObject
]

{ #category : #accessing }
INNotebookGenerationHelper >> listLevel [

	^ listLevel
]

{ #category : #accessing }
INNotebookGenerationHelper >> listLevel: anObject [

	listLevel := anObject
]

{ #category : #accessing }
INNotebookGenerationHelper >> listLevelDecrement [

	listLevel := listLevel - 1
]

{ #category : #accessing }
INNotebookGenerationHelper >> listLevelIncrement [

	listLevel := listLevel + 1
]
