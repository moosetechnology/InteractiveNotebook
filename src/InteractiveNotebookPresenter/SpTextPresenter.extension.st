Extension { #name : #SpTextPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpTextPresenter >> getContent [ 
	^ self text
]

{ #category : #'*InteractiveNotebookPresenter' }
SpTextPresenter >> selectNotebookPresenter [ 

	self withAdapterDo: [ :a | 
		a widget backgroundColor: (Color fromHexString: '77A8C8') ]
]

{ #category : #'*InteractiveNotebookPresenter' }
SpTextPresenter >> unselectedNotebookPresenter [ 

	self withAdapterDo: [ :a | a widget backgroundColor: INNotebookCellPreviewPresenter unselectedColor ]
]

{ #category : #'*InteractiveNotebookPresenter' }
SpTextPresenter >> updatePresenterHeight [

	self withAdapterDo: [ :a |
		a widget scrollPane textArea withoutSelectionBar.
		a widget vScrollbarShowNever.
		self previewCellOwner withAdapterDo: [ :b |
			b widget height: a widget scrollPane textArea height ] ]
]
