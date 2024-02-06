Extension { #name : #RSTAnnounceable }

{ #category : #'*InteractiveNotebookPresenter' }
RSTAnnounceable >> when: event do: aBlock for: aSubscriber [

	self announcer when: event do: aBlock
]
