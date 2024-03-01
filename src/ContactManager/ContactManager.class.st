Class {
	#name : 'ContactManager',
	#superclass : 'Object',
	#instVars : [
		'contacts'
	],
	#classInstVars : [
		'contacts'
	],
	#category : 'ContactManager',
	#package : 'ContactManager'
}

{ #category : 'accessing' }
ContactManager >> addContact: aContact [
	contacts add: aContact 
]

{ #category : 'accessing' }
ContactManager >> contacts [
	^ contacts ifNil: [ contacts := OrderedCollection new ]
]
