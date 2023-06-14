Extension { #name : #INNotebookGenerationHelper }

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
