Extension { #name : #MooseGroup }

{ #category : #'*InteractiveNotebookPresenter' }
MooseGroup >> addContentToPreviewPresenter: aPresenter [

	aPresenter text: (String streamContents: [ :s | 
			 self collect: [ :e | 
				 s nextPutAll: '- '.
				 s nextPutAll: e mooseName.
				 s nextPut: Character cr ] ])
]

{ #category : #'*InteractiveNotebookPresenter' }
MooseGroup >> createContentPreviewPresenter [ 
	| textPresenter |
	textPresenter := SpTextPresenter new.
	textPresenter beNotEditable.
	^ textPresenter
]
