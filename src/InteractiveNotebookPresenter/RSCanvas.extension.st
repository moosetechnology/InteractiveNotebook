Extension { #name : #RSCanvas }

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> addContentToPreviewPresenter: aPresenter [
	aPresenter canvas: self
]

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> createContentPreviewPresenter [ 
	| rPresenter |
	rPresenter := SpRoassalPresenter new.
	^ rPresenter
]

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> generateMicrodown [ 
	^ 'plus tard hehe'
]
