ScriptName SQ_BookHunt_CreateMapScript Extends Quest

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
ReferenceAlias Property MapContainer Auto Const mandatory 
LocationAlias Property MapLocation Auto Const mandatory
Form Property BookHuntMap Auto Const mandatory
Keyword Property LocTypeSettlement Auto Const mandatory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Variables
;;;
Location locationToCheck
ObjectReference BookHuntMapRef

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnQuestStarted()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHunt_CreateMapScript", "OnQuestStarted", "Event OnQuestStarted Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  ObjectReference containerRef = MapContainer.GetRef()
  BookHuntMapRef = containerRef.PlaceAtMe(BookHuntMap, 1, False, False, True, None, None, True)
  containerRef.AddItem(BookHuntMapRef as Form, 1, False)
  locationToCheck = MapLocation.GetLocation()
  Location[] settlementLocations = locationToCheck.GetParentLocations(LocTypeSettlement)
  If (settlementLocations.Length > 0)
    locationToCheck = settlementLocations[0]
  EndIf
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(BookHuntMapRef as ScriptObject, "OnContainerChanged")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHunt_CreateMapScript", "Actor.OnLocationChange", "Event Actor.OnLocationChange Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  If (akSender == Game.GetPlayer() && akOldLoc == locationToCheck && (akNewLoc == None || akNewLoc.IsSameLocation(akOldLoc, LocTypeSettlement) == False))
    Self.Stop()
  EndIf
EndEvent

Event ObjectReference.OnContainerChanged(ObjectReference akSource, ObjectReference akNewContainer, ObjectReference akOldContainer)
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHunt_CreateMapScript", "ObjectReference.OnContainerChanged", "Event ObjectReference.OnContainerChanged Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  If (akSource == BookHuntMapRef)
    Self.Stop()
  EndIf
EndEvent

Event OnQuestShutdown()
  VPI_Debug.DebugMessage(Venpi_ModName, "SQ_BookHunt_CreateMapScript", "OnQuestShutdown", "Event OnQuestShutdown Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
  ObjectReference containerRef = MapContainer.GetRef()
  If (BookHuntMapRef as Bool && containerRef as Bool)
    containerRef.RemoveItem(BookHuntMapRef as Form, 1, False, None)
  EndIf
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
