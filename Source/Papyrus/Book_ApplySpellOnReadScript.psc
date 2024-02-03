ScriptName Book_ApplySpellOnReadScript Extends ObjectReference

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;
GlobalVariable Property Venpi_DebugEnabled Auto Const Mandatory
String Property Venpi_ModName="CoraTheBookHunter" Auto Const Mandatory

GlobalVariable Property BookReadCount Auto Const Mandatory
GlobalVariable Property CoraAgreedToGivePotionRecipes Auto Const Mandatory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Actor Property PlayerRef Auto Const Mandatory
FormList Property FL_AvailableSpells Auto Const Mandatory
Spell Property SpellToApplyOnFailure Auto Const Mandatory
Message Property CoraPotionsAvailable Auto Const Mandatory

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
  If (Game.GetDieRollSuccess(80, 1, 100, -1, -1))
    Spell spellToCast = FL_AvailableSpells.GetAt(Utility.RandomInt(0, FL_AvailableSpells.GetSize()-1)) as Spell
    self.CastOrAddSpell(spellToCast, PlayerRef, PlayerRef, False)
    BookReadCount.SetValueInt(BookReadCount.GetValueInt() + 1)
    VPI_Debug.DebugMessage(Venpi_ModName, "Book_ApplySpellOnReadScript", "OnRead", "Event OnRead Triggered. Applied spell " + spellToCast + ".", 0, Venpi_DebugEnabled.GetValueInt())
    If (BookReadCount.GetValueInt() >= 5 && CoraAgreedToGivePotionRecipes.GetValueInt() == 0)
      ;; Display message from Cora about loading distilled potion recipes on the chemistry bench
      CoraPotionsAvailable.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      CoraAgreedToGivePotionRecipes.SetValueInt(1)
    EndIf
  Else
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
