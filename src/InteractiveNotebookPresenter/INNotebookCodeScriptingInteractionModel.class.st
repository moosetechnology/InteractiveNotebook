Class {
	#name : #INNotebookCodeScriptingInteractionModel,
	#superclass : #SpCodeScriptingInteractionModel,
	#instVars : [
		'receiver'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #accessing }
INNotebookCodeScriptingInteractionModel >> doItReceiver [

	^ receiver
]

{ #category : #accessing }
INNotebookCodeScriptingInteractionModel >> receiver [

	^ receiver
]

{ #category : #accessing }
INNotebookCodeScriptingInteractionModel >> receiver: anObject [

	receiver := anObject
]

{ #category : #initialization }
INNotebookCodeScriptingInteractionModel >> setBindings: aASTTree [

	aASTTree allChildren do: [ :l | 
		l class = RBAssignmentNode ifTrue: [ self bindingOf: l variable name ] ]
]
