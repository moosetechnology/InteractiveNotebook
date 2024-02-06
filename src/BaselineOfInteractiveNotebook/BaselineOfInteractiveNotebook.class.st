Class {
	#name : #BaselineOfInteractiveNotebook,
	#superclass : #BaselineOf,
	#category : #BaselineOfInteractiveNotebook
}

{ #category : #baselines }
BaselineOfInteractiveNotebook >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self microdown: spec.
		spec package: 'InteractiveNotebookPresenter' ].

	spec
		for: #'pharo11.x'
		do: [ spec package: 'InteractiveNotebook-Pharo11Compatibility' ]
]

{ #category : #baselines }
BaselineOfInteractiveNotebook >> microdown: spec [

	spec for: #( #'pharo11.x' #'pharo10.x' ) do: [
		spec
			baseline: 'Microdown'
			with: [
			spec repository: 'github://pillar-markup/Microdown:master/src' ] ].

	spec for: #( #'pharo12.x' ) do: [
		spec
			baseline: 'Microdown'
			with: [
			spec repository: 'github://pillar-markup/Microdown:Pharo12/src' ] ]
]
