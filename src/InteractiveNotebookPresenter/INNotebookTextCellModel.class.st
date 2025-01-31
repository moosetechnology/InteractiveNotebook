Class {
	#name : 'INNotebookTextCellModel',
	#superclass : 'INNotebookAbstractCellModel',
	#category : 'InteractiveNotebookPresenter-Cells',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Cells'
}

{ #category : 'printing' }
INNotebookTextCellModel >> contentAsStringInContext: aCompilationContext [

	^ text
]

{ #category : 'helpers' }
INNotebookTextCellModel >> presenterClass [

	^ INNotebookTextCellPresenter
]
