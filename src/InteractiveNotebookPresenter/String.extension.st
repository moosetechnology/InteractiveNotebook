Extension { #name : #String }

{ #category : #'*InteractiveNotebookPresenter' }
String >> addContentToPreviewPresenter: aPresenter [
	aPresenter text: self
]

{ #category : #'*InteractiveNotebookPresenter' }
String >> generateMicrodownAt: aFileReference withIndex: anIndex [

	^ self 
]
