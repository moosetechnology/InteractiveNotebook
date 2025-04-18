Class {
	#name : 'INNotebookCodeCellModel',
	#superclass : 'INNotebookAbstractCellModel',
	#category : 'InteractiveNotebookPresenter-Cells',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Cells'
}

{ #category : 'printing' }
INNotebookCodeCellModel >> contentAsStringInContext: aCompilationContext [

	^ self class compiler
		  compilationContext: aCompilationContext;
		  source: text;
		  evaluate
]

{ #category : 'helpers' }
INNotebookCodeCellModel >> presenterClass [

	^ INNotebookCodeCellPresenter
]
