Extension { #name : #SpMorphPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpMorphPresenter >> selectNotebookPresenter [ 
	"todo"
]

{ #category : #'*InteractiveNotebookPresenter' }
SpMorphPresenter >> unselectedNotebookPresenter [ 
	"todo"
]

{ #category : #'*InteractiveNotebookPresenter' }
SpMorphPresenter >> updateNotebookPresenterHeight [ 
	self owner withAdapterDo: [ :a | 
		a widget defer: [ a widget height: 350 ].
		self morph zoomToFit ]
]
