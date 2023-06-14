Extension { #name : #SpTextPresenter }

{ #category : #'*InteractiveNotebookPresenter' }
SpTextPresenter >> updatePresenterHeight [

	self withAdapterDo: [ :a |
		a widget scrollPane textArea withoutSelectionBar.
		a widget vScrollbarShowNever.
		self previewCellOwner withAdapterDo: [ :b |
			b widget height: a widget scrollPane textArea height ] ]
]
