"
This popup is used by the cell menu.
It would be deprecated if we used a real Spec toolbar.
"
Class {
	#name : 'INCellMenuPopupInteraction',
	#superclass : 'RSMorphicPopupInteraction',
	#category : 'InteractiveNotebookPresenter-Utils',
	#package : 'InteractiveNotebookPresenter',
	#tag : 'Utils'
}

{ #category : 'hooks' }
INCellMenuPopupInteraction >> popupFor: aCommand [

	^ aCommand description asTextMorph
		  backgroundColor: (Color white alpha: 0.6);
		  borderColor: Color gray;
		  textColor: Color black;
		  borderWidth: 1;
		  margins: 2;
		  yourself
]
