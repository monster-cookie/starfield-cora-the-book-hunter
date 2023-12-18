ScriptName SQ_BookHuntQuestScript Extends Quest

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;
GlobalVariable Property Venpi_DebugEnabled Auto Const Mandatory
String Property Venpi_ModName="CoraTheBookHunter" Auto Const Mandatory

GlobalVariable Property ActiveBookHunts Auto Const mandatory ;; Count of active book hunt quests running

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
ReferenceAlias Property BookHuntMap Auto Const mandatory         ;; used by SQ_BookHuntMapScript to swap dummy map with the real map with text replacement created by this quest
ReferenceAlias Property BookHuntMapOriginal Auto Const mandatory ;; Passed in via event - Used to get properties for creating the legendary book
ReferenceAlias Property LegendaryBook Auto Const mandatory       ;; Passed in via event - Needs to be moved to the container on startup

Int Property ObjectiveID = 10 Auto Const
Int Property ObjectiveStage = 100 Auto Const

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnQuestStarted()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntQuestScript", "OnQuestStarted", "Event OnQuestStarted Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  ActiveBookHunts.Mod(1.0)
  If Self.CreateLegendaryBook()
    Self.SetObjectiveDisplayed(ObjectiveID, True, False)
  Else
    Game.GetPlayer().RemoveItem(BookHuntMap.GetRef() as Form, 1, True, None)
    Self.Stop()
  EndIf
EndEvent

Event OnQuestShutdown()
  ActiveBookHunts.Mod(-1.0)
EndEvent

Event OnQuestRejected()
  Self.HandleOnQuestRejected()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
Function HandleOnQuestRejected()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntQuestScript", "HandleOnQuestRejected", "Event HandleOnQuestRejected Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  Self.SetObjectiveDisplayed(ObjectiveID, False, False)
  Self.Stop()
EndFunction

Bool Function CreateLegendaryBook()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntQuestScript", "CreateLegendaryBook", "NOT IMPLEMENTED FUNCTION", 2, Venpi_DebugEnabled.GetValueInt())
  Return False
EndFunction
