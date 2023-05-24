Extension { #name : #RSCanvas }

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> generateMicrodownUsingHelper: aGenerationHelper [

	| index |
	index := aGenerationHelper index asString.
	
	(aGenerationHelper checkForResourcesDirectory) ifFalse: [ 
		aGenerationHelper createResourcesDirectory ].

	self zoomToFit.

	RSPNGExporter new canvas: self; exportToFile: aGenerationHelper fileReferenceParent / 'notebook_resources' / ('img' , index , '.png').
	
	^ '![cell n°', index ,'](notebook_resources/img', index ,'.png)'.
]
