Extension { #name : #SpRoassalPresenter }

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
		a widget defer: [ a widget height: 350 ].
		self canvas zoomToFit ]
]
