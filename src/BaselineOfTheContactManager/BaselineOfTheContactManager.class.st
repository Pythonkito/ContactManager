Class {
	#name : 'BaselineOfTheContactManager',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTheContactManager',
	#package : 'BaselineOfTheContactManager'
}

{ #category : 'baselines' }
BaselineOfTheContactManager >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			self ical: spec.

			spec 
				package: 'ContactManager' 		with: [ spec requires: #(ICal) ];
				package: 'ContactManager-UI'   with: [ spec requires: #(ContactManager) ];
				package: 'ContactManager-Tests'	with: [ spec requires: #(ContactManager) ].
			spec 
				group: 'Core' 						with: #('ContactManager');
				group: 'UI'                    with: #('ContactManager-UI');
				group: 'Tests' 						with: #('ContactManager-Tests');
				group: 'default' 					with: #('Core' 'Tests' 'UI') ]
]

{ #category : 'baselines' }
BaselineOfTheContactManager >> ical: spec [

	spec
		baseline: 'ICal'
		with: [ spec repository: 'github://hernanmd/Infhub:load_vcard_tests/src' ]
]
