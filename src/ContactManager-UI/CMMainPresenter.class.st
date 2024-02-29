Class {
	#name : 'CMMainPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'contactList',
		'statusBar',
		'model'
	],
	#category : 'ContactManager-UI',
	#package : 'ContactManager-UI'
}

{ #category : 'adding' }
CMMainPresenter >> addContact [
	"empty for now"
]

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
			evaluated: #fullname;
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Number';
			evaluated: #phoneNumbers;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'email';
			evaluated: #emailAddresses;
			yourself);
		yourself.
	statusBar := self newStatusBar.
]

{ #category : 'initialization' }
CMMainPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Contact Manager';
		initialExtent: 600@400;
			toolbar: (self newToolbar
				add: (self newToolbarButton
				label: 'Add contact' ;
				icon: (self iconNamed: #smallAdd);
				action: [ self addContact ];
				yourself);
			yourself)
	
]
