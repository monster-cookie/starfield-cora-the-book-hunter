ScriptName CoraTheBookHunter_DebugScript

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBookHunt" 
Function Debug_GetBookHunt() Global
  Actor PlayerRef = Game.GetPlayer()
  LeveledItem LL_SQ_BookHunt_Surface_Any = Game.GetFormFromFile(0x74000811, "CoraTheBookHunter.esm") as LeveledItem
  If (LL_SQ_BookHunt_Surface_Any == None)
    Debug.MessageBox("Failed to find the any surface leveled item list. Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(LL_SQ_BookHunt_Surface_Any as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBook_TheMountainDwarf" 
Function Debug_GetBook_TheMountainDwarf() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000837, "CoraTheBookHunter.esm") as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find legendary book The Mountain Dwarf (##000837 in CoraTheBookHunter.esm). Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBook_TheGreenFlash" 
Function Debug_GetBook_TheGreenFlash() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000869, "CoraTheBookHunter.esm") as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find legendary book The Green Flash (##000869 in CoraTheBookHunter.esm). Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBook_TheReflectingPool" 
Function Debug_GetBook_TheReflectingPool() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000845, "CoraTheBookHunter.esm") as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find legendary book The Reflecting Pool (##000845 in CoraTheBookHunter.esm). Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction
