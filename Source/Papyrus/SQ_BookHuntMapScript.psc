ScriptName SQ_BookHuntMapScript Extends ObjectReference

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;
GlobalVariable Property Venpi_DebugEnabled Auto Const Mandatory
String Property Venpi_ModName="CoraTheBookHunter" Auto Const Mandatory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Keyword Property StoryManagerEventKeyword Auto Const mandatory
ObjectReference Property SQ_TreasureMapHoldingCellMarker Auto Const mandatory
Form Property LegendaryBook Auto Const mandatory                              ;; The legendary book that will be created and placed in quest location
Int Property LegendaryBookLocation = 0 Auto Const                             ;; Valid Values sent as Event Value1: 0 = surface; 1 = resources; 2 = space
Int Property LegendaryBookProximity = 2 Auto Const                            ;; Valid Values sent as Event Value2: 0 = local area (find location in current block pattern); 1 = same planet; 2 = same system; 3 = different system
SQ_BookHuntQuestScript Property myQuest Auto hidden                           ;; Filled when treasure quest is started

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntMapScript", "OnContainerChanged", "Event OnContainerChanged Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  If (myQuest == None)
    If (akNewContainer == Game.GetPlayer() as ObjectReference)
      VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntMapScript", "OnContainerChanged", "Starting new book hunt quest.", 0, Venpi_DebugEnabled.GetValueInt())
      Self.StartBookHunt()
    EndIf
  EndIf
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
Function StartBookHunt()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntMapScript", "StartBookHunt", "Reserving dungeon, setting up chest, and triggering quest event.", 0, Venpi_DebugEnabled.GetValueInt())
  ObjectReference legendaryBookRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(LegendaryBook, 1, False, False, True, None, None, True)
  SQ_BookHuntMapScript bookHuntMapRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(Self.GetBaseObject(), 1, False, False, True, None, None, True) as SQ_BookHuntMapScript
  SQ_BookHuntQuestScript[] myQuests = StoryManagerEventKeyword.SendStoryEventAndWait(None, legendaryBookRef, bookHuntMapRef as ObjectReference, LegendaryBookLocation, LegendaryBookProximity) as SQ_BookHuntQuestScript[]
  If (myQuests.Length > 0)
    myQuest = myQuests[0]
    Int failsafeCount = 0
    While (myQuest.IsStarting() && failsafeCount < 100)
      Utility.wait(0.1)
      failsafeCount += 1
    EndWhile
    VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntMapScript", "StartBookHunt", "Story manager quest is running, giving player the map item.", 0, Venpi_DebugEnabled.GetValueInt())
    ObjectReference player = Game.GetPlayer() as ObjectReference
    player.RemoveItem(Self as Form, 1, True, None)
    player.AddItem(myQuest.BookHuntMap.GetRef() as Form, 1, True)
  EndIf
EndFunction
