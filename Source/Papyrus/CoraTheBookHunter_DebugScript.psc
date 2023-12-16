ScriptName CoraTheBookHunter_DebugScript

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBookHunt" 
Function Debug_GetBookHunt() Global
  Actor PlayerRef = Game.GetPlayer()
  LeveledItem LL_SQ_BookHunt_Surface_Any = Game.GetFormFromFile(0x74000811, "CoraTheBookHunter.esm") as LeveledItem
  PlayerRef.AddItem(LL_SQ_BookHunt_Surface_Any as Form, 1, true)
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBook_TheMountainDwarf" 
Function Debug_GetBook_TheMountainDwarf() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000837, "CoraTheBookHunter.esm") as Book
  PlayerRef.AddItem(lb_buffbook as Form, 1, true)
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBook_TheGreenRay" 
Function Debug_GetBook_TheGreenRay() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x3900081D, "BooksRevamped.esm") as Book
  PlayerRef.AddItem(lb_buffbook as Form, 1, true)
EndFunction

;; Call using: CGF "CoraTheBookHunter_DebugScript.Debug_GetBook_TheReflectingPool" 
Function Debug_GetBook_TheReflectingPool() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000845, "CoraTheBookHunter.esm") as Book
  PlayerRef.AddItem(lb_buffbook as Form, 1, true)
EndFunction
