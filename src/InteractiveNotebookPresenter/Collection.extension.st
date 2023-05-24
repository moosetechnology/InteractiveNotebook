Extension { #name : #Collection }

{ #category : #'*InteractiveNotebookPresenter' }
Collection >> generateMicrodownListOn: aStream using: aGenerationHelper [

	self do: [ :el |
		(el isKindOf: self class)
			ifTrue: [
				aGenerationHelper listLevelIncrement.
				el generateMicrodownListOn: aStream using: aGenerationHelper.
				aGenerationHelper listLevelDecrement ]
			ifFalse: [
				0 to: aGenerationHelper listLevel do: [ :i |
				aStream nextPut: Character tab ].
				aStream nextPutAll: '- '.
				aStream nextPutAll:
					(el generateMicrodownUsingHelper: aGenerationHelper).
				aStream nextPut: Character cr ] ]
]

{ #category : #'*InteractiveNotebookPresenter' }
Collection >> generateMicrodownUsingHelper: aGenerationHelper [

	| text |
	aGenerationHelper listLevel: 0.
	text := String streamContents: [ :s |
		        self generateMicrodownListOn: s using: aGenerationHelper ].
	^ text
]
