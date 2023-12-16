ScriptName Book_ApplySpellOnReadScript Extends ObjectReference

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;
GlobalVariable Property Venpi_DebugEnabled Auto Const Mandatory
String Property Venpi_ModName="CoraWantsAllTheBooks" Auto Const Mandatory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Actor Property PlayerRef Auto Const Mandatory
Book Property AttchedToBook Auto Const Mandatory

Int Property ChanceSmallDuration=80 Auto Const Mandatory
Spell Property SpellToApply_SmallDuration Auto Const Mandatory
Int Property ChanceMediumDuration=40 Auto Const Mandatory
Spell Property SpellToApply_MediumDuration Auto Const Mandatory
Int Property ChanceLargeDuration=20 Auto Const Mandatory
Spell Property SpellToApply_LargeDuration Auto Const Mandatory
Spell Property SpellToApplyOnFailure Auto Const Mandatory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Variables
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnActivate(ObjectReference ActionRef)
  VPI_Debug.DebugMessage(Venpi_ModName, "Book_ApplySpellOnReadScript", "OnActivate", "Event OnActivate Triggered.", 0, Venpi_DebugEnabled.GetValueInt())
EndEvent

Event OnRead()
  If (Game.GetDieRollSuccess(ChanceLargeDuration, 1, 100, -1, -1))
    ; PlayerRef.AddSpell(SpellToApply_LargeDuration, False)
    self.CastOrAddSpell(SpellToApply_LargeDuration, PlayerRef, PlayerRef, False)
    VPI_Debug.DebugMessage(Venpi_ModName, "Book_ApplySpellOnReadScript", "OnRead", "Event OnRead Triggered. Applied Large duration spell " + SpellToApply_LargeDuration + ".", 0, Venpi_DebugEnabled.GetValueInt())
  ElseIf (Game.GetDieRollSuccess(ChanceMediumDuration, 1, 100, -1, -1))
    ; PlayerRef.AddSpell(SpellToApply_MediumDuration, False)
    self.CastOrAddSpell(SpellToApply_MediumDuration, PlayerRef, PlayerRef, False)
    VPI_Debug.DebugMessage(Venpi_ModName, "Book_ApplySpellOnReadScript", "OnRead", "Event OnRead Triggered. Applied Medium duration spell " + SpellToApply_MediumDuration + ".", 0, Venpi_DebugEnabled.GetValueInt())
  ElseIf (Game.GetDieRollSuccess(ChanceSmallDuration, 1, 100, -1, -1))
    ; PlayerRef.AddSpell(SpellToApply_SmallDuration, False)
    self.CastOrAddSpell(SpellToApply_SmallDuration, PlayerRef, PlayerRef, False)
    VPI_Debug.DebugMessage(Venpi_ModName, "Book_ApplySpellOnReadScript", "OnRead", "Event OnRead Triggered. Applied Short duration spell " + SpellToApply_SmallDuration + ".", 0, Venpi_DebugEnabled.GetValueInt())
  Else
    ; PlayerRef.AddSpell(SpellToApplyOnFailure, False)
    self.CastOrAddSpell(SpellToApplyOnFailure, PlayerRef, PlayerRef, True)
    VPI_Debug.DebugMessage(Venpi_ModName, "Book_ApplySpellOnReadScript", "OnRead", "Event OnRead Triggered. Player has the author's luck and the spell fizzled.", 0, Venpi_DebugEnabled.GetValueInt())
  EndIf
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
Function CastOrAddSpell(Spell SpellToCastOrAdd, Actor CasterActor, Actor TargetActor, Bool AddSpell)
  If (AddSpell)
    TargetActor.AddSpell(SpellToCastOrAdd, False)
  Else
    SpellToCastOrAdd.Cast(CasterActor as ObjectReference, TargetActor as ObjectReference)
  EndIf
EndFunction
