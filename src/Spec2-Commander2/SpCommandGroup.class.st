"
I am a command group decorator adding informations useful when for usage in context of a Spec application.

Basically, I add:
- an #icon (#blank by default)
- the strategy to display commands group in a MenuPresenter
"
Class {
	#name : #SpCommandGroup,
	#superclass : #CmUICommandGroup,
	#instVars : [
		'toolbarPopoverButton'
	],
	#category : #'Spec2-Commander2-Core'
}

{ #category : #converting }
SpCommandGroup >> asKMCategory [

	^ SpKMCategoryBuilder new
		visit: self;
		kmCategory	
]

{ #category : #converting }
SpCommandGroup >> asMenuBarPresenter [
	^ SpMenuBarPresenterBuilder new
		visit: self;
		menuPresenter
]

{ #category : #converting }
SpCommandGroup >> asMenuBarPresenterWith: aBlock [
	| builder |

	builder := SpMenuBarPresenterBuilder new.
	aBlock value: builder menuPresenter.
	^ builder
		visit: self;
		menuPresenter
]

{ #category : #converting }
SpCommandGroup >> asMenuPresenter [

	^ SpMenuPresenterBuilder new
		visit: self;
		menuPresenter
]

{ #category : #converting }
SpCommandGroup >> asMenuPresenterWith: aBlock [
	| builder |

	builder := SpMenuPresenterBuilder new.
	aBlock value: builder menuPresenter.
	^ builder
		visit: self;
		menuPresenter
]

{ #category : #converting }
SpCommandGroup >> asToolbarPresenter [
	^ SpToolbarPresenterBuilder new
		visit: self;
		toolbarPresenter
]

{ #category : #converting }
SpCommandGroup >> asToolbarPresenterWith: aBlock [
	| builder |
	
	builder := SpToolbarPresenterBuilder new.
	aBlock value: builder toolbarPresenter.
	^ builder
		visit: self;
		toolbarPresenter
]

{ #category : #configuring }
SpCommandGroup >> beToolbarGroup [

	toolbarPopoverButton := false
]

{ #category : #configuring }
SpCommandGroup >> beToolbarPopoverButton [

	toolbarPopoverButton := true
]

{ #category : #displaying }
SpCommandGroup >> displayIn: aMenuPresenter do: aBlock [

	self displayStrategy 
		display: self 
		in: aMenuPresenter 
		do: aBlock
]

{ #category : #initialization }
SpCommandGroup >> initialize [

	super initialize.
	toolbarPopoverButton := false
]

{ #category : #'shortcuts installation' }
SpCommandGroup >> installShortcutsIn: aPresenter [ 
	SpShortcutInstaller new
		presenter: aPresenter;
		visit: self
]

{ #category : #testing }
SpCommandGroup >> isToolbarPopoverButton [

	^ toolbarPopoverButton
]
