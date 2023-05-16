Extension { #name : #SpRoassal3InspectorPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassal3InspectorPresenter >> defaultHeight [

	^ 500
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassal3InspectorPresenter >> defaultZoom [

	^ 0.9
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassal3InspectorPresenter >> updatePresenterHeight [ 
	self previewCellOwner withAdapterDo: [ :a |
		a widget height: self defaultHeight.
		canvas camera
			zoomToFit: a widget extent * self defaultZoom
			rectangle: canvas encompassingRectangle.
		canvas signalUpdate ]
]
