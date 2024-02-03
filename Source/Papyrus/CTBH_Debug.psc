ScriptName CTBH_Debug

;; Call using: CGF "CTBH_Debug.GetBookHunt" 
Function GetBookHunt() Global
  Actor PlayerRef = Game.GetPlayer()
  LeveledItem LL_SQ_BookHunt_Surface_Any = Game.GetFormFromFile(0x74000811, "CoraTheBookHunter.esm") as LeveledItem
  If (LL_SQ_BookHunt_Surface_Any == None)
    Debug.MessageBox("Failed to find the any surface leveled item list. Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(LL_SQ_BookHunt_Surface_Any as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CTBH_Debug.GetBook_TheMountainDwarf" 
Function GetBook_TheMountainDwarf() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000837, "CoraTheBookHunter.esm") as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find legendary book The Mountain Dwarf (##000837 in CoraTheBookHunter.esm). Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CTBH_Debug.GetBook_TheGreenFlash" 
Function GetBook_TheGreenFlash() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000869, "CoraTheBookHunter.esm") as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find legendary book The Green Flash (##000869 in CoraTheBookHunter.esm). Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CTBH_Debug.GetBook_TheReflectingPool" 
Function GetBook_TheReflectingPool() Global
  Actor PlayerRef = Game.GetPlayer()
  Book lb_buffbook = Game.GetFormFromFile(0x74000845, "CoraTheBookHunter.esm") as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find legendary book The Reflecting Pool (##000845 in CoraTheBookHunter.esm). Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CTBH_Debug.GetRandomBook" 
Function GetRandomBook() Global
  Actor PlayerRef = Game.GetPlayer()
  FormList availableBooks = Game.GetFormFromFile(0x77000886, "CoraTheBookHunter.esm") as FormList
  Book lb_buffbook = availableBooks.GetAt(Utility.RandomInt(0, availableBooks.GetSize())) as Book
  If (lb_buffbook == None)
    Debug.MessageBox("Failed to find a random legendary book. Please contact Venpi for help.")
  Else
    PlayerRef.AddItem(lb_buffbook as Form, 1, true)
  EndIf
EndFunction

;; Call using: CGF "CTBH_Debug.CurrentBooksRead" 
Function CurrentBooksRead() Global
  GlobalVariable BookReadCount_GreenFlash = Game.GetFormFromFile(0x7800087F, "CoraTheBookHunter.esm") as GlobalVariable
  GlobalVariable BookReadCount_StoneForm = Game.GetFormFromFile(0x78000880, "CoraTheBookHunter.esm") as GlobalVariable
  GlobalVariable BookReadCount_TheReflection = Game.GetFormFromFile(0x78000881, "CoraTheBookHunter.esm") as GlobalVariable

  String message = "Books Read Status\n\n"
  message += "The Green Flash     = " + BookReadCount_GreenFlash.GetValueInt() + "\n"
  message += "The Mountain Dwarf  = " + BookReadCount_StoneForm.GetValueInt() + "\n"
  message += "The Reflecting Pool = " + BookReadCount_TheReflection.GetValueInt() + "\n"

  Debug.MessageBox(message)
EndFunction

;; Call using: CGF "CTBH_Debug.ActiveMagicEffects" 
;; 
;; Disabling for now HasMagicEffect reports the magic effects as invalid but the show up in the status screen again so this isn't needed
;;
; Function ActiveMagicEffects() Global
;   Actor PlayerRef = Game.GetPlayer()

;   MagicEffect BookBuff_TheReflection_Effect = Game.GetFormFromFile(0x89000846, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_GreenFlash_Effect = Game.GetFormFromFile(0x89000831, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_PhysImmune_Effect = Game.GetFormFromFile(0x8900083C, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_EnergyImmune_Effect = Game.GetFormFromFile(0x8900083B, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_EMImmune_Effect = Game.GetFormFromFile(0x8900083A, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_AirborneImmune_Effect = Game.GetFormFromFile(0x89000838, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_CorrosiveImmune_Effect = Game.GetFormFromFile(0x89000839, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_RadiationImmune_Effect = Game.GetFormFromFile(0x8900083D, "CoraTheBookHunter.esm") as MagicEffect
;   MagicEffect BookBuff_StoneForm_ThermalImmune_Effect = Game.GetFormFromFile(0x8900083E, "CoraTheBookHunter.esm") as MagicEffect

  
;   String message = "Active Magic Effects (0 = No, 1=Yes)\n\n"
;   message += "                   The Reflection = " + PlayerRef.HasMagicEffect(BookBuff_TheReflection_Effect) + "\n"
;   message += "                      Green Flash = " + PlayerRef.HasMagicEffect(BookBuff_GreenFlash_Effect) + "\n"
;   message += "     Stone Form - Physical Resist = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_PhysImmune_Effect) + "\n"
;   message += "       Stone Form - Energy Resist = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_EnergyImmune_Effect) + "\n"
;   message += "           Stone Form - EM Resist = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_EMImmune_Effect) + "\n"
;   message += "     Stone Form - Airborne Resist = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_AirborneImmune_Effect) + "\n"
;   message += "Stone Form - Corrosive Resistance = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_CorrosiveImmune_Effect) + "\n"
;   message += "    Stone Form - Radiation Resist = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_RadiationImmune_Effect) + "\n"
;   message += "      Stone Form - Thermal Resist = " + PlayerRef.HasMagicEffect(BookBuff_StoneForm_ThermalImmune_Effect) + "\n"

;   Debug.MessageBox(message)
; EndFunction