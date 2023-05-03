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
SpTextPresenter >> updateNotebookPresenterHeight [
	self withAdapterDo: [ :a | 
			a widget defer: [ 
				a widget scrollPane textArea withoutSelectionBar.
				self owner withAdapterDo: [ :b | 
					b widget height: a widget scrollPane textArea height ] ] ]
]
