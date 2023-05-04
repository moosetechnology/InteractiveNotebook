Extension { #name : #SpRoassalPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> calculateNewCenter [
	| x y |
	x := self canvas extent x.
	y := self canvas extent y.
	^ x / 2 @ y / 2
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> calculateNewScale [

	| xw yw xc yc |
	xw := self owner withAdapterDo: [ :a | a widget height ].
	xc := self canvas extent x.
	yw := self owner withAdapterDo: [ :a | a widget width ].
	yc := self canvas extent y.
	^ xc - xw > (yc - yw)
		  ifTrue: [ xw / xc ]
		  ifFalse: [ yw / yc ]
]

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
