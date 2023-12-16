ScriptName SQ_BookHuntSurfaceQuestScript Extends SQ_BookHuntQuestScript

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Guards (WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change)
;;;
Guard itemTrackingGuard

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Variables
;;;
Location myDungeonLocation
Resource myResource

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
ReferenceAlias Property DungeonBossChestContainer Auto Const mandatory
LocationAlias Property DungeonLocation Auto Const mandatory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntSurfaceQuestScript", "OnLocationChange", "Event OnLocationChange Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  If (myDungeonLocation)
    If (akNewLoc == myDungeonLocation || akOldLoc == myDungeonLocation)
      Self.UpdateItemTracking()
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntSurfaceQuestScript", "ObjectReference.OnItemAdded", "Event ObjectReference.OnItemAdded Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  If (aiTransferReason == 4 || aiTransferReason == 7 || aiTransferReason == 12 || aiTransferReason == 42)
    Self.SetStage(ObjectiveStage)
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded")
  EndIf
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
Bool Function CreateLegendaryBook()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHuntSurfaceQuestScript", "CreateLegendaryBook", "Creating treasue of type " + LegendaryBook + " and placing it in " + DungeonBossChestContainer, 0, Venpi_DebugEnabled.GetValueInt())
  Bool success = False
  ObjectReference legendaryBookRef = LegendaryBook.GetRef()
  SQ_BookHuntMapScript bookHuntMapRef = BookHuntMapOriginal.GetRef() as SQ_BookHuntMapScript

  If (legendaryBookRef as Bool && bookHuntMapRef as Bool)
    success = True
    myDungeonLocation = DungeonLocation.GetLocation()
    legendaryBookRef.PromoteToLegendary(0, None) ;; This probably will not work on books.......
    DungeonBossChestContainer.GetRef().AddItem(legendaryBookRef as Form, 1, False)
  EndIf

  Return success
EndFunction

Function UpdateItemTracking()
  Guard itemTrackingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard
    Actor playerRef = Game.GetPlayer()
    If playerRef.GetCurrentLocation() == myDungeonLocation
      Self.AddInventoryEventFilter(myResource as Form)
      Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnItemAdded")
    Else
      Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnItemAdded")
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
