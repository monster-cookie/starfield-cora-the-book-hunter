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

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetRandomBook" 
Function Debug_GetRandomBook() Global
  Actor PlayerRef = Game.GetPlayer()
  FormList availableBooks = Game.GetFormFromFile(0x77000886, "CoraTheBookHunter.esm") as FormList
  Book lb_buffbook = availableBooks.GetAt(Utility.RandomInt(0, availableBooks.GetSize())) as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find a random legendary book. Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetRandomBook" 
Function Debug_Current() Global
  GlobalVariable BookReadCount_GreenFlash = Game.GetFormFromFile(0x7800087F, "CoraTheBookHunter.esm") as GlobalVariable
  GlobalVariable BookReadCount_StoneForm = Game.GetFormFromFile(0x78000880, "CoraTheBookHunter.esm") as GlobalVariable
  GlobalVariable BookReadCount_TheReflection = Game.GetFormFromFile(0x78000881, "CoraTheBookHunter.esm") as GlobalVariable

  String message = "Books Read Status\n\n"
  message += "The Green Flash     = " + BookReadCount_GreenFlash.GetValueInt() + "\n"
  message += "The Mountain Dwarf  = " + BookReadCount_StoneForm.GetValueInt() + "\n"
  message += "The Reflecting Pool = " + BookReadCount_TheReflection.GetValueInt() + "\n"

  Debug.MessageBox(message)
EndFunction
