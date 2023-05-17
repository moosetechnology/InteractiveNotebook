Extension { #name : #RSCanvas }

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> generateMicrodownAt: aFileReference withIndex: anIndex [

	(self checkForResourcesDirectoryFor: aFileReference) ifFalse: [ 
		self createResourcesDirectoryFor: aFileReference ].

	self zoomToFit.

	RSPNGExporter new canvas: self; exportToFile: aFileReference / 'notebook_resources' / ('img' , (anIndex asString) , '.png').
	
	^ '![cell n°', anIndex asString ,'](notebook_resources/img', anIndex asString ,'.png)'.
]
