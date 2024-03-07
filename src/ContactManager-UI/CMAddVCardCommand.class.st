Class {
	#name : 'CMAddVCardCommand',
	#superclass : 'CMAbstractCommand',
	#category : 'ContactManager-UI-Commands',
	#package : 'ContactManager-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
CMAddVCardCommand >> execute [

	context "..."
]

{ #category : 'initialization' }
CMAddVCardCommand >> initialize [
	super initialize.
	self
		name: 'Add to Contact Manager';
		description: ''
]
