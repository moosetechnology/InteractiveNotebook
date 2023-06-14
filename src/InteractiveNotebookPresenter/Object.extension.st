Extension { #name : #Object }

{ #category : #'*InteractiveNotebookPresenter' }
Object >> generateMicrodownUsingHelper: aGenerationHelper [
	"Returns a Microdown string to include in the generated document.
	This method can have side effects (if an image needs to be included for example, if must first be created).
	The generation helper has accessors to various useful informations, like the file reference where the generated document will be created, or the index of the cell being generated currently."
	^ self asString 
]
