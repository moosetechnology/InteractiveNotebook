Extension { #name : #Collection }

{ #category : #'*InteractiveNotebookPresenter' }
Collection >> addContentToPreviewPresenter: aPresenter [

	| text |
	text := self
		        ifNotEmpty: [ 
			        String streamContents: [ :s | 
				        self do: [ :el | 
					        s nextPutAll: '- '.
					        s nextPutAll: el asString.
					        s nextPut: Character cr ] ] ]
		        ifEmpty: [ 'Empty collection.' ].
	aPresenter text: text
]

{ #category : #'*InteractiveNotebookPresenter' }
Collection >> generateMicrodownAt: aFileReference  withIndex: anIndex [

	| text |
	text := String streamContents: [ :s | 
		        self do: [ :el | 
			        s nextPutAll: '- '.
			        s nextPutAll: el asString.
			        s nextPut: Character cr ] ].
	 ^ text
]
