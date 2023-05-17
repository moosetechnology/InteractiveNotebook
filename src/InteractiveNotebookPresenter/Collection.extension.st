Extension { #name : #Collection }

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
