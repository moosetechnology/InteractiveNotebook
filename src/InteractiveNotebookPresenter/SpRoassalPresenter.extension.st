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
SpRoassalPresenter >> getContent [
	^ self canvas
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> selectNotebookPresenter [

	"todo"
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> unselectedNotebookPresenter [

	"todo"
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> updateNotebookPresenterHeight [

	self owner withAdapterDo: [ :a |
		| canvas |
		canvas := self currentCanvas.
		a widget height: self defaultHeight.
		canvas camera
			zoomToFit: a widget extent * self defaultZoom
			rectangle: canvas encompassingRectangle.
		canvas signalUpdate ]
]
