# Cora The Book Hunter

## Adding a New Buff

## Durations for reference below
As the durations have to be in seconds

-   30s = 0.5m
-   60s = 1m
-   90s = 1.5m
-  120s = 2m
-  600s = 10m
-  900s = 10m
- 1200s = 20m
- 1800s = 30m
- 2400s = 40m
- 3600s = 1h
- 5400s = 1.5h
- 7200s = 2h

### Instruction
01. Add the Buff's Keyword
    - Editor ID Format is `BookBuff_[BuffName]`.
02. Add the Magic Effect. 
    - Editor ID Format is `BookBuff_[BuffName]_[EffectName]_Effect`.
    - Full - Name Format is `[BuffName] - [EffectName]`
    - Casting Type must match the setting in the spell
03. Create any number of spells with increasing duration and magnitude
    - Editor ID Format is `BookBuff_[BuffName]_Spell_[Duration]`.
    - Casting Type must match the setting in the Magic Effect
04. Create form list for the book script
    - Editor ID Format is `FL_AvailableSpells_[BuffName]`.
05. Create read count global variable
    - Editor ID Format is `BookRead__[BuffName]`.
06. Add the new read count global variable to the condition form BH_Potions_Available
07. Create the legendary book
    - Book title and body should relate to the applied buff
    - Editor ID Format is `LB_[Title]`.
    - Clone and fix book script for one of the other books
08. Add the book to FL_AvailableLegendaryBooks
09. Create the new potions
    - Potion Strength
      - Weak     (PL1 - [ 30s/ 600s/ 900s/1800s] Duration 05% Magnitude)
      - Moderate (PL2 - [ 60s/1200s/1800s/3600s] Duration 10% Magnitude)
      - Strong   (PL3 - [ 90s/2400s/3600s/5400s] Duration 20% Magnitude)
      - Ultimate (PL4 - [120s/3600s/5400s/7200s] Duration 40% Magnitude)
    - Editor ID Format is `Chem_[BuffName]_[Strength]`.
    - Full - Name format is `[BuffName] Distillation ([Strength])`
    - Mirror effects, magnitudes, and durations from the spells
10. Create the constructable objects for making the position at the pharmacy bench
    - Editor ID Format is `co_Chem_[BuffName]_[Strength]`.
    - Clone one of the other potions cause of the conditions
    - Make sure you fix the books read count for the potion strength
