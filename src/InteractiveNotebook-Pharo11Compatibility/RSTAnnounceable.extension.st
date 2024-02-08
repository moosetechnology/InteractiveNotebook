Extension { #name : #RSTAnnounceable }

{ #category : #'*InteractiveNotebook-Pharo11Compatibility' }
RSTAnnounceable >> when: event do: aBlock for: aSubscriber [

	self announcer when: event do: aBlock
]
