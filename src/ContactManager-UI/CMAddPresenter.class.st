Class {
	#name : 'CMAddPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'nameText',
		'phoneNumber',
		'emailText'
	],
	#category : 'ContactManager-UI-Core',
	#package : 'ContactManager-UI',
	#tag : 'Core'
}

{ #category : 'layout' }
CMAddPresenter >> defaultLayout [
^ SpGridLayout build: [ :builder | 
	builder 
		beColumnNotHomogeneous;
		column:2 withConstraints: #beExpand;
		add: 'Name'; add: nameText; nextRow;
		add: 'PhoneNumbers'; add: phoneNumber; nextRow;
		add: 'Email'; add: emailText]

]

{ #category : 'layout' }
CMAddPresenter >> email [
		
	^ emailText text
]

{ #category : 'layout' }
CMAddPresenter >> initializeDialogWindow: aDialogPresenter [
	aDialogPresenter centered.
	aDialogPresenter
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addButton: 'Save Contact' do: [ :presenter | presenter beOk;
	close ].


]

{ #category : 'layout' }
CMAddPresenter >> initializePresenters [
	
	nameText := self newTextInput.
	emailText := self newTextInput.
	phoneNumber := self newTextInput

]

{ #category : 'layout' }
CMAddPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
	title: 'Contact';
	initialExtent: 400 @ 250

]

{ #category : 'layout' }
CMAddPresenter >> name [
	^ nameText text

]

{ #category : 'layout' }
CMAddPresenter >> phoneNumbers [
	^ phoneNumber text
		

]
