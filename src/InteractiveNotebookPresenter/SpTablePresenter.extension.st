Extension { #name : #SpTablePresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpTablePresenter >> maximumHeight [

	^ 350
]

{ #category : #'*InteractiveNotebookPresenter' }
SpTablePresenter >> updatePresenterHeight [

	| height |
	self withAdapterDo: [ :a |
		"adding 1.5 to the row number to account for the table header and a small padding"
		height := (a widget rowHeight * (a widget numberOfRows + 1.5)) ceiling ].
	self previewCellOwner withAdapterDo: [ :a |
		a widget height: (height < self maximumHeight
				 ifTrue: [ height ]
				 ifFalse: [ self maximumHeight ]) ]
]
