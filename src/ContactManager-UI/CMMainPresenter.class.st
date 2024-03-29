Class {
	#name : 'CMMainPresenter',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'contactList',
		'statusBar',
		'model',
		'addPresenter'
	],
	#category : 'ContactManager-UI-Core',
	#package : 'ContactManager-UI',
	#tag : 'Core'
}

{ #category : 'commands' }
CMMainPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register:
			((CmCommandGroup named: 'contact manager commands') asSpecGroup
				register: CMAddVCardCommand forSpec;
				yourself)
]

{ #category : 'adding' }
CMMainPresenter >> addContact [
	
	addPresenter openModal isOk
		ifFalse: [ ^ self ].
		
	self contactManager
		addContactName: addPresenter name
		phoneNumber: addPresenter phoneNumbers
		email: addPresenter email .
	
	contactList items: self contactManager contacts.
	self updatePresenter
]

{ #category : 'as yet unclassified' }
CMMainPresenter >> contactManager [

	^ self application contactManager
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
CMMainPresenter >> initializeContactList [

	contactList := self newTable
		addColumn: (SpStringTableColumn new
			title: 'Name';
			evaluated: #name;
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Number';
			evaluated: #phoneNumber;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Email';
			evaluated: #email;
			yourself);
		contextMenu: [ (self rootCommandsGroup / 'contact manager commands') beRoot asMenuPresenter ];
		items: self contactManager contacts;
		yourself.
]

{ #category : 'initialization' }
CMMainPresenter >> initializePresenters [ 

	self initializeContactList.
	addPresenter := self instantiate: CMAddPresenter.
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
