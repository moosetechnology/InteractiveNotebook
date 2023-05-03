Extension { #name : #Object }

{ #category : #'*InteractiveNotebookPresenter' }
Object >> addContentToPreviewPresenter: aPresenter [
	aPresenter text: self asString
]

{ #category : #'*InteractiveNotebookPresenter' }
Object >> createContentPreviewPresenter [
	| textPresenter |
	textPresenter := SpTextPresenter new.
	textPresenter beNotEditable.
	^ textPresenter
]

{ #category : #'*InteractiveNotebookPresenter' }
Object >> generateMicrodownAt: aFileReference withIndex: anIndex [
	"Returns a Microdown string to include in the generated document.
	This method can have side effects (if an image needs to be included for example, if must first be created).
	The file reference is pointing to the directory containing the exported document, and the index is the index of the preview cell in the cell list. Those parameters are used to create a path for the eventual files to create."
	^ self asString 
]
