Class {
	#name : 'CMMainPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'contactList',
		'statusBar',
		'model'
	],
	#category : 'ContactManager-UI-Core',
	#package : 'ContactManager-UI',
	#tag : 'Core'
}

{ #category : 'adding' }
CMMainPresenter >> addContact [
	| presenter windowPresenter |
	
	presenter := CMAddPresenter newApplication: self application.
	windowPresenter := presenter openModal.
	windowPresenter isOk
		ifFalse: [ ^ self ].
		
	ContactManager 
		addContact:
			(ContactManager new
				name: presenter name;
				number: presenter phoneNumbers;
				email: presenter email).
				
	self updatePresenter
]

{ #category : 'adding' }
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
			evaluated: [ : contact | (contact phoneNumbers collect: #number) joinUsing: ','  ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Email';
			evaluated: [ : contact | (contact emailAddresses collect: #address) joinUsing: ',' ];
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
