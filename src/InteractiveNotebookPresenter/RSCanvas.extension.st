Extension { #name : #RSCanvas }

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> addContentToPreviewPresenter: aPresenter [
	aPresenter canvas: self canvas
]

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> checkForResourcesDirectoryAt: aFileReference [
	^ (aFileReference / 'notebook_resources') exists
]

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> createContentPreviewPresenter [ 
	| rPresenter |
	rPresenter := SpRoassalPresenter new.
	^ rPresenter
]

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> createResourcesDirectoryAt: aFileReference [
	(aFileReference / 'notebook_resources') createDirectory 
]

{ #category : #'*InteractiveNotebookPresenter' }
RSCanvas >> generateMicrodownAt: aFileReference withIndex: anIndex [

	(self checkForResourcesDirectoryAt: aFileReference) ifFalse: [ 
		self createResourcesDirectoryAt: aFileReference ].

	RSPNGExporter new canvas: self; exportToFile: aFileReference / 'notebook_resources' / ('img' , (anIndex asString) , '.png').
	
	^ '![cell n°', anIndex asString ,'](notebook_resources/img', anIndex asString ,'.png)'.
]
