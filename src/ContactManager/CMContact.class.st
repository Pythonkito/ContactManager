Class {
	#name : 'CMContact',
	#superclass : 'ICVCard',
	#instVars : [
		'phoneNumber',
		'email'
	],
	#category : 'ContactManager',
	#package : 'ContactManager'
}

{ #category : 'accessing' }
CMContact >> email [

	^ email
]

{ #category : 'accessing' }
CMContact >> email: anObject [

	email := anObject
]

{ #category : 'accessing' }
CMContact >> phoneNumber [

	^ phoneNumber
]

{ #category : 'accessing' }
CMContact >> phoneNumber: anObject [

	phoneNumber := anObject
]
