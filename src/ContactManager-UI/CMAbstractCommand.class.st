"
Abstract class grouping common behavior for the Contact Manager application behavior.
"
Class {
	#name : 'CMAbstractCommand',
	#superclass : 'CmCommand',
	#category : 'ContactManager-UI-Commands',
	#package : 'ContactManager-UI',
	#tag : 'Commands'
}

{ #category : 'accessing' }
CMAbstractCommand >> contactManagerPresenter [
	"Answer the receiver's <CMMainPresenter> "

	^ context
]

{ #category : 'accessing' }
CMAbstractCommand >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ context selectedContact
	
]
