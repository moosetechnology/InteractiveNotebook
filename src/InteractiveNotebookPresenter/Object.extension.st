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
Object >> generateMicrodown [
	^ self asString 
]
