Class {
	#name : 'ContactManager',
	#superclass : 'Object',
	#instVars : [
		'name',
		'number',
		'email'
	],
	#classInstVars : [
		'contacts'
	],
	#category : 'ContactManager',
	#package : 'ContactManager'
}

{ #category : 'accessing' }
ContactManager class >> addContact: aContact [
	contacts add: aContact 
]

{ #category : 'accessing' }
ContactManager class >> contacts [
	^ contacts ifNil: [ contacts := OrderedCollection new ]
]
