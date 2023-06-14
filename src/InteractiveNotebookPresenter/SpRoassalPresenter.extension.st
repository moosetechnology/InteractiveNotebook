Extension { #name : #SpRoassalPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> defaultHeight [

	^ 500
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> defaultZoom [

	^ 0.9
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> updatePresenterHeight [

	self previewCellOwner withAdapterDo: [ :a |
		| canvas |
		canvas := self currentCanvas.
		a widget height: self defaultHeight.
		canvas camera
			zoomToFit: a widget extent * self defaultZoom
			rectangle: canvas encompassingRectangle.
		canvas signalUpdate ]
]
