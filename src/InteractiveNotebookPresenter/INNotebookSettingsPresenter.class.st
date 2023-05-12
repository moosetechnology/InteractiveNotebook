Class {
	#name : #INNotebookSettingsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'displayChoiceCheckbox',
		'ownerNotebook'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #'instance creation' }
INNotebookSettingsPresenter class >> openFor: aSpPresenter [

	| presenter |
	presenter := self new ownerNotebook: aSpPresenter.
	presenter displayChoiceCheckbox state: aSpPresenter displayInspectorView.
	presenter open.
	presenter owner whenClosedDo: [
		presenter ownerNotebook displayInspectorView:
			presenter displayChoiceCheckbox state ]
]

{ #category : #specs }
INNotebookSettingsPresenter class >> title [ 
	^ 'Notebook settings'
]

{ #category : #accessing }
INNotebookSettingsPresenter >> displayChoiceCheckbox [

	^ displayChoiceCheckbox
]

{ #category : #initialization }
INNotebookSettingsPresenter >> initializeLayout [ 
	self layout: (SpBoxLayout newTopToBottom add: displayChoiceCheckbox; yourself)
]

{ #category : #initialization }
INNotebookSettingsPresenter >> initializePresenters [

	displayChoiceCheckbox := self newCheckBox
		label: 'Display all inspector tabs?';
		yourself.
	self initializeLayout.
]

{ #category : #initialization }
INNotebookSettingsPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: 300.0 @ 100.0
]

{ #category : #accessing }
INNotebookSettingsPresenter >> ownerNotebook [

	^ ownerNotebook
]

{ #category : #accessing }
INNotebookSettingsPresenter >> ownerNotebook: anObject [

	ownerNotebook := anObject
]
