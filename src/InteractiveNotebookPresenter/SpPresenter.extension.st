Extension { #name : #SpPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpPresenter >> previewCellOwner [

	^ self owner owner owner
]

{ #category : #'*InteractiveNotebookPresenter' }
SpPresenter >> updatePresenterHeight [ 

	self previewCellOwner withAdapterDo: [ :a | a widget height: 350 ].
]
