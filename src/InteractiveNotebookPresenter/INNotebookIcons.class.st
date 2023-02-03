Class {
	#name : #INNotebookIcons,
	#superclass : #Object,
	#classInstVars : [
		'icons'
	],
	#category : #InteractiveNotebookPresenter
}

{ #category : #utilities }
INNotebookIcons class >> buildCache [

	(Pragma allNamed: #icon in: self class) do: [ :pragma | 
		pragma method selector value: self ]
]

{ #category : #'icon creation' }
INNotebookIcons class >> iconAddAbove [

	<icon>
	^ self icons at: #addAbove ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 )
			  offset: 0 @ 0 ]
]

{ #category : #'icon creation' }
INNotebookIcons class >> iconAddBellow [

	<icon>
	^ self icons at: #addBelow ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 )
			  offset: 0 @ 0 ]
]

{ #category : #'icon creation' }
INNotebookIcons class >> iconAddBelow [

	<icon>
	^ self icons at: #addBelow ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 )
			  offset: 0 @ 0 ]
]

{ #category : #utilities }
INNotebookIcons class >> iconDown [

	<icon>
	^ self icons at: #down ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r40404040 16rFF404040 16r40404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r40404040 16rFF404040 16rFF404040
				     16r40404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r40404040 16rFF404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r40404040
				     16rFF404040 16rFF404040 16r40404040 16r00000000 16r00000000
				     16r40404040 16rFF404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16rFF404040 16r40404040
				     16r40404040 16rFF404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r40404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r40404040 16rFF404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r40404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 )
			  offset: 0 @ 0 ]
]

{ #category : #'icon creation' }
INNotebookIcons class >> iconRemove [

	<icon>
	^ self icons at: #remove ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 2130706432 4278190080 4278190080 4278190080
				     4278190080 4278190080 4278190080 2130706432 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     2130706432 4278190080 4278190080 4278190080 4278190080
				     4278190080 4278190080 2130706432 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 16777215
				     16777215 16777215 16777215 16777215 16777215 )
			  offset: 0 @ 0 ]
]

{ #category : #'icon creation' }
INNotebookIcons class >> iconTrash [

	<icon>
	^ self icons at: #trash ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16rFF404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 )
			  offset: 0 @ 0 ]
]

{ #category : #'icon creation' }
INNotebookIcons class >> iconUp [

	<icon>
	^ self icons at: #up ifAbsentPut: [ 
		  Form
			  extent: 16 @ 16
			  depth: 32
			  fromArray:
				  #( 16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16r40404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16rFF404040 16r40404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16rFF404040 16rFF404040
				     16rFF404040 16r40404040 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16rFF404040 16r40404040
				     16r40404040 16rFF404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16rFF404040 16r40404040
				     16r00000000 16r00000000 16r40404040 16rFF404040 16rFF404040
				     16r40404040 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16rFF404040 16r40404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r40404040
				     16rFF404040 16rFF404040 16r40404040 16r00000000 16r00000000
				     16r00000000 16r00000000 16r40404040 16rFF404040 16r40404040
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r40404040 16rFF404040 16r40404040 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 16r00000000 16r00000000 16r00000000 16r00000000
				     16r00000000 )
			  offset: 0 @ 0 ]
]

{ #category : #utilities }
INNotebookIcons class >> icons [

	^ icons ifNil: [ 
		icons := Dictionary new.
		self buildCache.
		icons ]
]

{ #category : #import }
INNotebookIcons class >> importIcons: iconCollection fromFolder: aString inClass: aClass category: aCategory [
	iconCollection
		do: [:each |
			| method form |
			form := PNGReadWriter formFromFileNamed: aString, '/', each , '.png'.
			method := each , Character cr asString ,
				('^ self icons
					at: #',  each , 
					' ifAbsentPut: ['),		
				form storeString,
				']'.
			aClass compile: method classified: aCategory ]
]

{ #category : #utilities }
INNotebookIcons class >> resetIcons [

	<script>
	icons := nil
]

{ #category : #utilities }
INNotebookIcons class >> showIcons [

	<script>
	| window |
	self buildCache.
	window := SpListPresenter new
		          items: (icons associations sorted: #key ascending);
		          display: [ :each | each key ];
		          displayIcon: [ :each | each value ];
		          open.
	window title: 'Moose icons'
]