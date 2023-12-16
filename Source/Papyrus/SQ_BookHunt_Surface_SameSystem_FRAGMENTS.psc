ScriptName SQ_BookHunt_Surface_SameSystem_FRAGMENTS Extends Quest Const hidden

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Fragments
;;;
Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.Stop()
EndFunction