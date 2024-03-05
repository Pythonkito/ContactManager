Class {
	#name : 'CMMainApplication',
	#superclass : 'SpApplication',
	#instVars : [
		'contacts'
	],
	#category : 'ContactManager-UI-Core',
	#package : 'ContactManager-UI',
	#tag : 'Core'
}

{ #category : 'private' }
CMMainApplication class >> menuNoteTakersOn: aBuilder [
	<worldMenu>

	(aBuilder item: #ContactManager)
		parent: #Tools;
		label: 'The Contact Manager';
		icon: (self iconNamed: #catalog);
		action: [ CMMainApplication new run ];
		help: 'The Contact Manager';
		order: 630
]

{ #category : 'instance creation' }
CMMainApplication >> contacts [

	^ contacts
]

{ #category : 'instance creation' }
CMMainApplication >> defaultContacts [

	^ ICCardHandParser parseVCardString: ICVCardTest new aviCardString
]

{ #category : 'initialization' }
CMMainApplication >> initialize [

	super initialize.
	contacts := self defaultContacts.
]

{ #category : 'instance creation' }
CMMainApplication >> start [

	(CMMainPresenter newApplication: self) 
		"contacts: self contacts;"
		open
]
