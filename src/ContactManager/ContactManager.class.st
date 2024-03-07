Class {
	#name : 'ContactManager',
	#superclass : 'Object',
	#instVars : [
		'contacts'
	],
	#classVars : [
		'UniqueInstace'
	],
	#classInstVars : [
		'contacts'
	],
	#category : 'ContactManager',
	#package : 'ContactManager'
}

{ #category : 'as yet unclassified' }
ContactManager class >> initialize [

	self uniqueInstance reset
]

{ #category : 'instance creation' }
ContactManager class >> uniqueInstance [

	^ UniqueInstace ifNil: [ UniqueInstace := self basicNew ]
]

{ #category : 'accessing' }
ContactManager >> addContact: aContact [

	self contacts add: aContact 
]

{ #category : 'adding' }
ContactManager >> addContactName: aString phoneNumber: aString2 email: aString3 [ 

	self addContact: (
		CMContact new
			name: aString;
			phoneNumber: aString2;
			email: aString3;
			yourself)
		
]

{ #category : 'accessing' }
ContactManager >> contacts [
	^ contacts 
		ifNil: [ contacts := OrderedCollection new ]
]
