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
SpRoassalPresenter >> selectNotebookPresenter [

	"todo"
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> unselectedNotebookPresenter [

	"todo"
]

{ #category : #'*InteractiveNotebookPresenter' }
SpRoassalPresenter >> updateNotebookPresenterHeight [

	| rect |
	self owner withAdapterDo: [ :a | 
		a widget defer: [ a widget height: 350 ] ].
	self canvas camera zoomToFit: self canvas extent * 0.9
		"self canvas camera scale: self calculateNewScale.
		self canvas camera position: self calculateNewCenter."
		
		"rect := RSCoordinates new visibleRectangleFor: self canvas camera.
		""rect := Rectangle
			        origin: 0 - a widget height @ 0 - a widget width
			        corner: a widget height @ a widget width.""
		self canvas camera
			zoomToFit: (a widget height @ a widget width) * 1.3
			rectangle: rect."
]
