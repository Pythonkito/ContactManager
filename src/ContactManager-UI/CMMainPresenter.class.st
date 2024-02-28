Class {
	#name : 'CMMainPresenter',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'contactList',
		'statusBar',
		'model'
	],
	#category : 'ContactManager-UI',
	#package : 'ContactManager-UI'
}

{ #category : 'as yet unclassified' }
CMMainPresenter >> contacts: aCollection [

	contactList items: aCollection.
]

{ #category : 'layout' }
CMMainPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: contactList;
		add: statusBar expand: false;
		yourself
]

{ #category : 'initialization' }
CMMainPresenter >> initialize [ 

	super initialize.
	model := self application contacts.
]

{ #category : 'initialization' }
CMMainPresenter >> initializePresenters [ 

	contactList := self newTable
		addColumn: (SpStringTableColumn new
			title: 'Name';
			evaluated: [ :each | each fullname ];
			yourself);
		yourself.
	statusBar := self newStatusBar.
]
