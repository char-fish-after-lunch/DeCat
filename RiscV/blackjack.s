          .text                         
          .globl main                   

          .data                         
          .align 2                      
_rndModule:                             # virtual table
          .word 0                       # parent
          .word _STRING0                # class name
          .word _rndModule.Init         
          .word _rndModule.Random       
          .word _rndModule.RndInt       

          .data                         
          .align 2                      
_Deck:                                  # virtual table
          .word 0                       # parent
          .word _STRING1                # class name
          .word _Deck.Init              
          .word _Deck.Shuffle           
          .word _Deck.GetCard           

          .data                         
          .align 2                      
_BJDeck:                                # virtual table
          .word 0                       # parent
          .word _STRING2                # class name
          .word _BJDeck.Init            
          .word _BJDeck.DealCard        
          .word _BJDeck.Shuffle         
          .word _BJDeck.NumCardsRemaining

          .data                         
          .align 2                      
_Player:                                # virtual table
          .word 0                       # parent
          .word _STRING3                # class name
          .word _Player.Init            
          .word _Player.Hit             
          .word _Player.DoubleDown      
          .word _Player.TakeTurn        
          .word _Player.HasMoney        
          .word _Player.PrintMoney      
          .word _Player.PlaceBet        
          .word _Player.GetTotal        
          .word _Player.Resolve         
          .word _Player.GetYesOrNo      

          .data                         
          .align 2                      
_Dealer:                                # virtual table
          .word _Player                 # parent
          .word _STRING4                # class name
          .word _Dealer.Init            
          .word _Player.Hit             
          .word _Player.DoubleDown      
          .word _Dealer.TakeTurn        
          .word _Player.HasMoney        
          .word _Player.PrintMoney      
          .word _Player.PlaceBet        
          .word _Player.GetTotal        
          .word _Player.Resolve         
          .word _Player.GetYesOrNo      

          .data                         
          .align 2                      
_House:                                 # virtual table
          .word 0                       # parent
          .word _STRING5                # class name
          .word _House.SetupGame        
          .word _House.SetupPlayers     
          .word _House.TakeAllBets      
          .word _House.TakeAllTurns     
          .word _House.ResolveAllPlayers
          .word _House.PrintAllMoney    
          .word _House.PlayOneGame      

          .data                         
          .align 2                      
_Main:                                  # virtual table
          .word 0                       # parent
          .word _STRING6                # class name



          .section .text                
_PrintInt:                              
          lw    a0, 4(sp)               
          tail  _catlib__PrintInt       
          jr    ra                      
_PrintString:                           
          lw    a0, 4(sp)               
          tail  _catlib__PrintString    
          jr    ra                      
_Alloc:                                 
          lw    a0, 4(sp)               
          tail  _catlib__Alloc          
          jr    ra                      
_ReadInteger:                           
          lw    a0, 4(sp)               
          tail  _catlib__ReadInteger    
          jr    ra                      
_ReadString:                            
          lw    a0, 4(sp)               
          tail  _catlib__ReadString     
          jr    ra                      
_Halt:                                  
          tail  _catlib__Halt           
          jr    ra                      
_rndModule_New:                         # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L167:                                  
          li    s2, 8                   
          sw    s2, 4(sp)               
          call  _Alloc                  
          move  s2, a0                  
          li    s3, 0                   
          sw    s3, 4(s2)               
          la    s3, _rndModule          
          sw    s3, 0(s2)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Deck_New:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L168:                                  
          li    s2, 16                  
          sw    s2, 4(sp)               
          call  _Alloc                  
          move  s2, a0                  
          li    s3, 0                   
          sw    s3, 4(s2)               
          sw    s3, 8(s2)               
          sw    s3, 12(s2)              
          la    s3, _Deck               
          sw    s3, 0(s2)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_BJDeck_New:                            # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L169:                                  
          li    s2, 16                  
          sw    s2, 4(sp)               
          call  _Alloc                  
          move  s2, a0                  
          li    s3, 0                   
          sw    s3, 4(s2)               
          sw    s3, 8(s2)               
          sw    s3, 12(s2)              
          la    s3, _BJDeck             
          sw    s3, 0(s2)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player_New:                            # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -32              
_L170:                                  
          li    s2, 28                  
          sw    s2, 4(sp)               
          sw    s2, -8(s0)              
          call  _Alloc                  
          move  s3, a0                  
          lw    s2, -8(s0)              
          li    s4, 0                   
          li    s5, 4                   
          add   s6, s3, s2              
          sw    s2, -8(s0)              
          sw    s4, -12(s0)             
          sw    s5, -16(s0)             
          sw    s6, -20(s0)             
_L171:                                  
          lw    s2, -20(s0)             
          lw    s3, -16(s0)             
          sub   s4, s2, s3              
          mv    s2, s4                  
          lw    s4, -8(s0)              
          sub   s5, s4, s3              
          mv    s4, s5                  
          sw    s4, -8(s0)              
          sw    s3, -16(s0)             
          sw    s2, -20(s0)             
          beqz  s4, _L173               
_L172:                                  
          lw    s2, -20(s0)             
          lw    s3, -12(s0)             
          sw    s3, 0(s2)               
          sw    s3, -12(s0)             
          sw    s2, -20(s0)             
          j     _L171                   
_L173:                                  
          la    s2, _Player             
          lw    s3, -20(s0)             
          sw    s2, 0(s3)               
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Dealer_New:                            # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -32              
_L174:                                  
          li    s2, 28                  
          sw    s2, 4(sp)               
          sw    s2, -8(s0)              
          call  _Alloc                  
          move  s3, a0                  
          lw    s2, -8(s0)              
          li    s4, 0                   
          li    s5, 4                   
          add   s6, s3, s2              
          sw    s4, -12(s0)             
          sw    s5, -16(s0)             
          sw    s6, -20(s0)             
          sw    s2, -8(s0)              
_L175:                                  
          lw    s2, -20(s0)             
          lw    s3, -16(s0)             
          sub   s4, s2, s3              
          mv    s2, s4                  
          lw    s4, -8(s0)              
          sub   s5, s4, s3              
          mv    s4, s5                  
          sw    s3, -16(s0)             
          sw    s2, -20(s0)             
          sw    s4, -8(s0)              
          beqz  s4, _L177               
_L176:                                  
          lw    s2, -20(s0)             
          lw    s3, -12(s0)             
          sw    s3, 0(s2)               
          sw    s3, -12(s0)             
          sw    s2, -20(s0)             
          j     _L175                   
_L177:                                  
          la    s2, _Dealer             
          lw    s3, -20(s0)             
          sw    s2, 0(s3)               
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House_New:                             # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L178:                                  
          li    s2, 16                  
          sw    s2, 4(sp)               
          call  _Alloc                  
          move  s2, a0                  
          li    s3, 0                   
          sw    s3, 4(s2)               
          sw    s3, 8(s2)               
          sw    s3, 12(s2)              
          la    s3, _House              
          sw    s3, 0(s2)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Main_New:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L179:                                  
          li    s2, 4                   
          sw    s2, 4(sp)               
          call  _Alloc                  
          move  s2, a0                  
          la    s3, _Main               
          sw    s3, 0(s2)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_rndModule.Init:                        # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L180:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s3, 8(s0)               
          sw    s3, 4(s2)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_rndModule.Random:                      # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L181:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s3, 15625               
          lw    s4, 4(s2)               
          li    s5, 10000               
          rem   s6, s4, s5              
          mul   s4, s3, s6              
          li    s3, 22221               
          add   s5, s4, s3              
          li    s3, 65536               
          rem   s4, s5, s3              
          sw    s4, 4(s2)               
          lw    s3, 4(s2)               
          sw    s2, 4(s0)               
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_rndModule.RndInt:                      # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L182:                                  
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 12(s3)              
          sw    s2, 4(s0)               
          jalr  s4                      
          move  s3, a0                  
          lw    s2, 4(s0)               
          lw    s4, 8(s0)               
          rem   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s4, 8(s0)               
          mv    a0, s5                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Deck.Init:                             # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -36              
_L183:                                  
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          li    s3, 52                  
          li    s4, 0                   
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          beqz  s5, _L185               
_L184:                                  
          la    s2, _STRING7            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L185:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s2, s3              
          add   s5, s2, s4              
          sw    s5, 4(sp)               
          sw    s2, -12(s0)             
          sw    s5, -16(s0)             
          sw    s3, -8(s0)              
          call  _Alloc                  
          move  s4, a0                  
          lw    s2, -12(s0)             
          lw    s5, -16(s0)             
          lw    s3, -8(s0)              
          sw    s3, 0(s4)               
          li    s3, 0                   
          add   s4, s4, s5              
          sw    s2, -12(s0)             
          sw    s5, -16(s0)             
          sw    s4, -20(s0)             
          sw    s3, -24(s0)             
_L186:                                  
          lw    s2, -16(s0)             
          lw    s3, -12(s0)             
          sub   s2, s2, s3              
          sw    s3, -12(s0)             
          sw    s2, -16(s0)             
          beqz  s2, _L188               
_L187:                                  
          lw    s2, -20(s0)             
          lw    s3, -12(s0)             
          sub   s2, s2, s3              
          lw    s4, -24(s0)             
          sw    s4, 0(s2)               
          sw    s3, -12(s0)             
          sw    s2, -20(s0)             
          sw    s4, -24(s0)             
          j     _L186                   
_L188:                                  
          lw    s2, 4(s0)               
          lw    s3, -20(s0)             
          sw    s3, 8(s2)               
          lw    s3, 12(s2)              
          lw    s3, 8(s0)               
          sw    s3, 12(s2)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Deck.Shuffle:                          # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -60              
_L189:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s3, 1                   
          sw    s3, 4(s2)               
          sw    s2, 4(s0)               
_L191:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 52                  
          slt   s5, s4, s3              
          xori  s5, s5, 1               
          sw    s2, 4(s0)               
          beqz  s5, _L196               
_L192:                                  
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          lw    s4, 4(s2)               
          li    s5, 1                   
          sub   s6, s4, s5              
          lw    s4, -4(s3)              
          slt   s5, s6, s4              
          sw    s3, -8(s0)              
          sw    s6, -12(s0)             
          sw    s2, 4(s0)               
          beqz  s5, _L194               
_L193:                                  
          li    s2, 0                   
          lw    s3, -12(s0)             
          slt   s4, s3, s2              
          sw    s3, -12(s0)             
          beqz  s4, _L195               
_L194:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L195:                                  
          li    s2, 4                   
          lw    s3, -12(s0)             
          mul   s4, s3, s2              
          lw    s2, -8(s0)              
          add   s5, s2, s4              
          lw    s4, 0(s5)               
          lw    s4, 4(s0)               
          lw    s5, 4(s4)               
          li    s6, 13                  
          rem   s7, s5, s6              
          li    s5, 4                   
          mul   s6, s3, s5              
          add   s3, s2, s6              
          sw    s7, 0(s3)               
          sw    s4, 4(s0)               
_L190:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s3, 4(s2)               
          li    s4, 1                   
          add   s5, s3, s4              
          sw    s5, 4(s2)               
          sw    s2, 4(s0)               
          j     _L191                   
_L196:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s3, 4(s2)               
          li    s4, 1                   
          sub   s5, s3, s4              
          sw    s5, 4(s2)               
          sw    s2, 4(s0)               
_L197:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 0                   
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          beqz  s5, _L211               
_L198:                                  
          lw    s2, 4(s0)               
          lw    s3, 12(s2)              
          lw    s4, 4(s2)               
          sw    s3, 4(sp)               
          sw    s4, 8(sp)               
          lw    s4, 0(s3)               
          lw    s3, 16(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          move  s4, a0                  
          lw    s2, 4(s0)               
          mv    s3, s4                  
          lw    s4, 4(s2)               
          lw    s4, 4(s2)               
          li    s5, 1                   
          sub   s6, s4, s5              
          sw    s6, 4(s2)               
          lw    s4, 8(s2)               
          lw    s5, 4(s2)               
          lw    s6, -4(s4)              
          slt   s7, s5, s6              
          sw    s4, -20(s0)             
          sw    s2, 4(s0)               
          sw    s5, -24(s0)             
          sw    s3, -16(s0)             
          beqz  s7, _L200               
_L199:                                  
          li    s2, 0                   
          lw    s3, -24(s0)             
          slt   s4, s3, s2              
          sw    s3, -24(s0)             
          beqz  s4, _L201               
_L200:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L201:                                  
          li    s2, 4                   
          lw    s3, -24(s0)             
          mul   s4, s3, s2              
          lw    s2, -20(s0)             
          add   s3, s2, s4              
          lw    s2, 0(s3)               
          mv    s3, s2                  
          lw    s2, 4(s0)               
          lw    s4, 8(s2)               
          lw    s5, 4(s2)               
          lw    s6, -4(s4)              
          slt   s7, s5, s6              
          sw    s4, -32(s0)             
          sw    s5, -36(s0)             
          sw    s2, 4(s0)               
          sw    s3, -28(s0)             
          beqz  s7, _L203               
_L202:                                  
          li    s2, 0                   
          lw    s3, -36(s0)             
          slt   s4, s3, s2              
          sw    s3, -36(s0)             
          beqz  s4, _L204               
_L203:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L204:                                  
          li    s2, 4                   
          lw    s3, -36(s0)             
          mul   s4, s3, s2              
          lw    s2, -32(s0)             
          add   s5, s2, s4              
          lw    s4, 0(s5)               
          lw    s4, 4(s0)               
          lw    s5, 8(s4)               
          lw    s6, -4(s5)              
          lw    s7, -16(s0)             
          slt   s8, s7, s6              
          sw    s2, -32(s0)             
          sw    s3, -36(s0)             
          sw    s4, 4(s0)               
          sw    s7, -16(s0)             
          sw    s5, -40(s0)             
          beqz  s8, _L206               
_L205:                                  
          li    s2, 0                   
          lw    s3, -16(s0)             
          slt   s4, s3, s2              
          sw    s3, -16(s0)             
          beqz  s4, _L207               
_L206:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L207:                                  
          li    s2, 4                   
          lw    s3, -16(s0)             
          mul   s4, s3, s2              
          lw    s2, -40(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          li    s4, 4                   
          lw    s5, -36(s0)             
          mul   s6, s5, s4              
          lw    s4, -32(s0)             
          add   s5, s4, s6              
          sw    s2, 0(s5)               
          lw    s2, 4(s0)               
          lw    s4, 8(s2)               
          lw    s5, -4(s4)              
          slt   s6, s3, s5              
          sw    s2, 4(s0)               
          sw    s4, -44(s0)             
          sw    s3, -16(s0)             
          beqz  s6, _L209               
_L208:                                  
          li    s2, 0                   
          lw    s3, -16(s0)             
          slt   s4, s3, s2              
          sw    s3, -16(s0)             
          beqz  s4, _L210               
_L209:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L210:                                  
          li    s2, 4                   
          lw    s3, -16(s0)             
          mul   s4, s3, s2              
          lw    s2, -44(s0)             
          add   s5, s2, s4              
          lw    s4, 0(s5)               
          li    s4, 4                   
          mul   s5, s3, s4              
          add   s3, s2, s5              
          lw    s2, -28(s0)             
          sw    s2, 0(s3)               
          j     _L197                   
_L211:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Deck.GetCard:                          # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L212:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 52                  
          slt   s5, s3, s4              
          xori  s5, s5, 1               
          sw    s2, 4(s0)               
          beqz  s5, _L214               
_L213:                                  
          li    s2, 0                   
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L214:                                  
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          lw    s4, 4(s2)               
          lw    s5, -4(s3)              
          slt   s6, s4, s5              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          sw    s4, -12(s0)             
          beqz  s6, _L216               
_L215:                                  
          li    s2, 0                   
          lw    s3, -12(s0)             
          slt   s4, s3, s2              
          sw    s3, -12(s0)             
          beqz  s4, _L217               
_L216:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L217:                                  
          li    s2, 4                   
          lw    s3, -12(s0)             
          mul   s4, s3, s2              
          lw    s2, -8(s0)              
          add   s3, s2, s4              
          lw    s2, 0(s3)               
          mv    s3, s2                  
          lw    s2, 4(s0)               
          lw    s4, 4(s2)               
          lw    s4, 4(s2)               
          li    s5, 1                   
          add   s6, s4, s5              
          sw    s6, 4(s2)               
          sw    s2, 4(s0)               
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_BJDeck.Init:                           # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -52              
_L218:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s3, 8                   
          li    s4, 0                   
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          beqz  s5, _L220               
_L219:                                  
          la    s2, _STRING7            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L220:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s2, s3              
          add   s5, s2, s4              
          sw    s5, 4(sp)               
          sw    s2, -12(s0)             
          sw    s5, -16(s0)             
          sw    s3, -8(s0)              
          call  _Alloc                  
          move  s4, a0                  
          lw    s2, -12(s0)             
          lw    s5, -16(s0)             
          lw    s3, -8(s0)              
          sw    s3, 0(s4)               
          li    s3, 0                   
          add   s4, s4, s5              
          sw    s2, -12(s0)             
          sw    s5, -16(s0)             
          sw    s4, -20(s0)             
          sw    s3, -24(s0)             
_L221:                                  
          lw    s2, -16(s0)             
          lw    s3, -12(s0)             
          sub   s2, s2, s3              
          sw    s3, -12(s0)             
          sw    s2, -16(s0)             
          beqz  s2, _L223               
_L222:                                  
          lw    s2, -20(s0)             
          lw    s3, -12(s0)             
          sub   s2, s2, s3              
          lw    s4, -24(s0)             
          sw    s4, 0(s2)               
          sw    s3, -12(s0)             
          sw    s2, -20(s0)             
          sw    s4, -24(s0)             
          j     _L221                   
_L223:                                  
          lw    s2, 4(s0)               
          lw    s3, -20(s0)             
          sw    s3, 4(s2)               
          li    s3, 0                   
          mv    s4, s3                  
          sw    s2, 4(s0)               
          sw    s4, -28(s0)             
_L225:                                  
          li    s2, 8                   
          lw    s3, -28(s0)             
          slt   s4, s3, s2              
          sw    s3, -28(s0)             
          beqz  s4, _L233               
_L226:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -28(s0)             
          slt   s6, s5, s4              
          sw    s2, 4(s0)               
          sw    s5, -28(s0)             
          sw    s3, -32(s0)             
          beqz  s6, _L228               
_L227:                                  
          li    s2, 0                   
          lw    s3, -28(s0)             
          slt   s4, s3, s2              
          sw    s3, -28(s0)             
          beqz  s4, _L229               
_L228:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L229:                                  
          li    s2, 4                   
          lw    s3, -28(s0)             
          mul   s4, s3, s2              
          lw    s2, -32(s0)             
          add   s5, s2, s4              
          lw    s4, 0(s5)               
          sw    s3, -28(s0)             
          sw    s2, -32(s0)             
          call  _Deck_New               
          move  s4, a0                  
          lw    s3, -28(s0)             
          lw    s2, -32(s0)             
          li    s5, 4                   
          mul   s6, s3, s5              
          add   s5, s2, s6              
          sw    s4, 0(s5)               
          lw    s2, 4(s0)               
          lw    s4, 4(s2)               
          lw    s5, -4(s4)              
          slt   s6, s3, s5              
          sw    s4, -36(s0)             
          sw    s2, 4(s0)               
          sw    s3, -28(s0)             
          beqz  s6, _L231               
_L230:                                  
          li    s2, 0                   
          lw    s3, -28(s0)             
          slt   s4, s3, s2              
          sw    s3, -28(s0)             
          beqz  s4, _L232               
_L231:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L232:                                  
          li    s2, 4                   
          lw    s3, -28(s0)             
          mul   s4, s3, s2              
          lw    s2, -36(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 8(s0)               
          sw    s4, 8(sp)               
          lw    s5, 0(s2)               
          lw    s2, 8(s5)               
          sw    s4, 8(s0)               
          sw    s3, -28(s0)             
          jalr  s2                      
          lw    s4, 8(s0)               
          lw    s3, -28(s0)             
          sw    s4, 8(s0)               
          sw    s3, -28(s0)             
_L224:                                  
          li    s2, 1                   
          lw    s3, -28(s0)             
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -28(s0)             
          j     _L225                   
_L233:                                  
          lw    s2, 4(s0)               
          lw    s3, 12(s2)              
          lw    s3, 8(s0)               
          sw    s3, 12(s2)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_BJDeck.DealCard:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -32              
_L234:                                  
          li    s2, 0                   
          mv    s3, s2                  
          lw    s2, 4(s0)               
          lw    s4, 8(s2)               
          li    s5, 8                   
          li    s6, 52                  
          mul   s7, s5, s6              
          slt   s5, s4, s7              
          xori  s5, s5, 1               
          sw    s3, -8(s0)              
          sw    s2, 4(s0)               
          beqz  s5, _L236               
_L235:                                  
          li    s2, 11                  
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L236:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          sub   s4, s3, s2              
          seqz  s4, s4                  
          sw    s3, -8(s0)              
          beqz  s4, _L241               
_L237:                                  
          lw    s2, 4(s0)               
          lw    s3, 12(s2)              
          li    s4, 8                   
          sw    s3, 4(sp)               
          sw    s4, 8(sp)               
          lw    s4, 0(s3)               
          lw    s3, 16(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          move  s4, a0                  
          lw    s2, 4(s0)               
          mv    s3, s4                  
          lw    s4, 4(s2)               
          lw    s5, -4(s4)              
          slt   s6, s3, s5              
          sw    s4, -16(s0)             
          sw    s2, 4(s0)               
          sw    s3, -12(s0)             
          beqz  s6, _L239               
_L238:                                  
          li    s2, 0                   
          lw    s3, -12(s0)             
          slt   s4, s3, s2              
          sw    s3, -12(s0)             
          beqz  s4, _L240               
_L239:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L240:                                  
          li    s2, 4                   
          lw    s3, -12(s0)             
          mul   s4, s3, s2              
          lw    s2, -16(s0)             
          add   s3, s2, s4              
          lw    s2, 0(s3)               
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s2, 16(s3)              
          jalr  s2                      
          move  s3, a0                  
          mv    s2, s3                  
          sw    s2, -8(s0)              
          j     _L236                   
_L241:                                  
          li    s2, 10                  
          lw    s3, -8(s0)              
          slt   s4, s2, s3              
          sw    s3, -8(s0)              
          beqz  s4, _L243               
_L242:                                  
          li    s2, 10                  
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L245:                                  
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          lw    s3, 8(s2)               
          li    s4, 1                   
          add   s5, s3, s4              
          sw    s5, 8(s2)               
          lw    s2, -8(s0)              
          sw    s2, 4(s0)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L243:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          sub   s4, s3, s2              
          seqz  s4, s4                  
          sw    s3, -8(s0)              
          beqz  s4, _L245               
_L244:                                  
          li    s2, 11                  
          mv    s3, s2                  
          sw    s3, -8(s0)              
          j     _L245                   

_BJDeck.Shuffle:                        # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L246:                                  
          la    s2, _STRING9            
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 0                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L248:                                  
          li    s2, 8                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L253               
_L249:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -12(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L251               
_L250:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L252               
_L251:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L252:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -12(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 0(s2)               
          lw    s2, 12(s4)              
          sw    s3, -8(s0)              
          jalr  s2                      
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
_L247:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -8(s0)              
          j     _L248                   
_L253:                                  
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          li    s3, 0                   
          sw    s3, 8(s2)               
          la    s3, _STRING10           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_BJDeck.NumCardsRemaining:              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L254:                                  
          li    s2, 8                   
          li    s3, 52                  
          mul   s4, s2, s3              
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          sub   s5, s4, s3              
          sw    s2, 4(s0)               
          mv    a0, s5                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.Init:                           # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L255:                                  
          lw    s2, 4(s0)               
          lw    s3, 20(s2)              
          li    s3, 1000                
          sw    s3, 20(s2)              
          la    s3, _STRING11           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          la    s4, _STRING12           
          sw    s4, 4(sp)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          lw    s4, 24(s2)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _ReadLine               
          move  s4, a0                  
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          sw    s4, 24(s2)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.Hit:                            # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -20              
_L256:                                  
          lw    s2, 8(s0)               
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 12(s3)              
          sw    s2, 8(s0)               
          jalr  s4                      
          move  s3, a0                  
          lw    s2, 8(s0)               
          mv    s4, s3                  
          lw    s3, 4(s0)               
          lw    s5, 24(s3)              
          sw    s5, 4(sp)               
          sw    s3, 4(s0)               
          sw    s2, 8(s0)               
          sw    s4, -8(s0)              
          call  _PrintString            
          lw    s3, 4(s0)               
          lw    s2, 8(s0)               
          lw    s4, -8(s0)              
          la    s5, _STRING13           
          sw    s5, 4(sp)               
          sw    s3, 4(s0)               
          sw    s2, 8(s0)               
          sw    s4, -8(s0)              
          call  _PrintString            
          lw    s3, 4(s0)               
          lw    s2, 8(s0)               
          lw    s4, -8(s0)              
          sw    s4, 4(sp)               
          sw    s3, 4(s0)               
          sw    s2, 8(s0)               
          sw    s4, -8(s0)              
          call  _PrintInt               
          lw    s3, 4(s0)               
          lw    s2, 8(s0)               
          lw    s4, -8(s0)              
          la    s5, _STRING14           
          sw    s5, 4(sp)               
          sw    s3, 4(s0)               
          sw    s2, 8(s0)               
          sw    s4, -8(s0)              
          call  _PrintString            
          lw    s3, 4(s0)               
          lw    s2, 8(s0)               
          lw    s4, -8(s0)              
          lw    s5, 4(s3)               
          lw    s5, 4(s3)               
          add   s6, s5, s4              
          sw    s6, 4(s3)               
          lw    s5, 12(s3)              
          lw    s5, 12(s3)              
          li    s6, 1                   
          add   s7, s5, s6              
          sw    s7, 12(s3)              
          li    s5, 11                  
          sub   s6, s4, s5              
          seqz  s6, s6                  
          sw    s3, 4(s0)               
          sw    s2, 8(s0)               
          beqz  s6, _L258               
_L257:                                  
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          lw    s3, 8(s2)               
          li    s4, 1                   
          add   s5, s3, s4              
          sw    s5, 8(s2)               
          sw    s2, 4(s0)               
_L258:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 21                  
          slt   s5, s4, s3              
          lw    s3, 8(s2)               
          li    s4, 0                   
          slt   s6, s4, s3              
          and   s3, s5, s6              
          sw    s2, 4(s0)               
          beqz  s3, _L260               
_L259:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s3, 4(s2)               
          li    s4, 10                  
          sub   s5, s3, s4              
          sw    s5, 4(s2)               
          lw    s3, 8(s2)               
          lw    s3, 8(s2)               
          li    s4, 1                   
          sub   s5, s3, s4              
          sw    s5, 8(s2)               
          sw    s2, 4(s0)               
          j     _L258                   
_L260:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.DoubleDown:                     # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -20              
_L261:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 10                  
          sub   s5, s3, s4              
          snez  s5, s5                  
          lw    s3, 4(s2)               
          li    s4, 11                  
          sub   s6, s3, s4              
          snez  s6, s6                  
          and   s3, s5, s6              
          sw    s2, 4(s0)               
          beqz  s3, _L263               
_L262:                                  
          li    s2, 0                   
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L263:                                  
          la    s2, _STRING15           
          lw    s3, 4(s0)               
          sw    s3, 4(sp)               
          sw    s2, 8(sp)               
          lw    s2, 0(s3)               
          lw    s4, 44(s2)              
          sw    s3, 4(s0)               
          jalr  s4                      
          move  s2, a0                  
          lw    s3, 4(s0)               
          sw    s3, 4(s0)               
          beqz  s2, _L265               
_L264:                                  
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          lw    s3, 16(s2)              
          li    s4, 2                   
          mul   s5, s3, s4              
          sw    s5, 16(s2)              
          sw    s2, 4(sp)               
          lw    s3, 8(s0)               
          sw    s3, 8(sp)               
          lw    s4, 0(s2)               
          lw    s5, 12(s4)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          jalr  s5                      
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          lw    s4, 24(s2)              
          sw    s4, 4(sp)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          la    s4, _STRING16           
          sw    s4, 4(sp)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          lw    s4, 4(s2)               
          sw    s4, 4(sp)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          la    s4, _STRING14           
          sw    s4, 4(sp)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          li    s4, 1                   
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          mv    a0, s4                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L265:                                  
          li    s2, 0                   
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.TakeTurn:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L267:                                  
          la    s2, _STRING17           
          sw    s2, 4(sp)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING18           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s3, 0                   
          sw    s3, 4(s2)               
          lw    s3, 8(s2)               
          li    s3, 0                   
          sw    s3, 8(s2)               
          lw    s3, 12(s2)              
          li    s3, 0                   
          sw    s3, 12(s2)              
          sw    s2, 4(sp)               
          lw    s3, 8(s0)               
          sw    s3, 8(sp)               
          lw    s4, 0(s2)               
          lw    s5, 12(s4)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          jalr  s5                      
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          sw    s2, 4(sp)               
          sw    s3, 8(sp)               
          lw    s4, 0(s2)               
          lw    s5, 12(s4)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          jalr  s5                      
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          sw    s2, 4(sp)               
          sw    s3, 8(sp)               
          lw    s4, 0(s2)               
          lw    s5, 16(s4)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          jalr  s5                      
          move  s4, a0                  
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          not   s5, s4                  
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          beqz  s5, _L272               
_L268:                                  
          li    s2, 1                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L269:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 21                  
          slt   s5, s4, s3              
          xori  s5, s5, 1               
          lw    s3, -8(s0)              
          and   s4, s5, s3              
          sw    s2, 4(s0)               
          beqz  s4, _L272               
_L270:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING16           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING14           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING19           
          sw    s2, 4(sp)               
          sw    s3, 8(sp)               
          lw    s3, 0(s2)               
          lw    s4, 44(s3)              
          sw    s2, 4(s0)               
          jalr  s4                      
          move  s3, a0                  
          lw    s2, 4(s0)               
          mv    s4, s3                  
          sw    s2, 4(s0)               
          sw    s4, -8(s0)              
          beqz  s4, _L269               
_L271:                                  
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          lw    s3, 8(s0)               
          sw    s3, 8(sp)               
          lw    s4, 0(s2)               
          lw    s5, 12(s4)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          jalr  s5                      
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          j     _L269                   
_L272:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 21                  
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          beqz  s5, _L274               
_L273:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING20           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING21           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
_L275:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L274:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING22           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING14           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          j     _L275                   

_Player.HasMoney:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L276:                                  
          lw    s2, 4(s0)               
          lw    s3, 20(s2)              
          li    s4, 0                   
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          mv    a0, s5                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.PrintMoney:                     # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L277:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING23           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 20(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING14           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.PlaceBet:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L278:                                  
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          li    s3, 0                   
          sw    s3, 16(s2)              
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 28(s3)              
          sw    s2, 4(s0)               
          jalr  s4                      
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
_L279:                                  
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          li    s4, 0                   
          slt   s5, s4, s3              
          xori  s5, s5, 1               
          lw    s3, 16(s2)              
          lw    s4, 20(s2)              
          slt   s6, s4, s3              
          or    s3, s5, s6              
          sw    s2, 4(s0)               
          beqz  s3, _L281               
_L280:                                  
          la    s2, _STRING24           
          sw    s2, 4(sp)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          sw    s2, 4(s0)               
          call  _ReadInteger            
          move  s3, a0                  
          lw    s2, 4(s0)               
          sw    s3, 16(s2)              
          sw    s2, 4(s0)               
          j     _L279                   
_L281:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.GetTotal:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L282:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          sw    s2, 4(s0)               
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Player.Resolve:                        # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L283:                                  
          li    s2, 0                   
          mv    s3, s2                  
          li    s2, 0                   
          mv    s4, s2                  
          lw    s2, 4(s0)               
          lw    s5, 4(s2)               
          li    s6, 21                  
          sub   s7, s5, s6              
          seqz  s7, s7                  
          lw    s5, 12(s2)              
          li    s6, 2                   
          sub   s8, s5, s6              
          seqz  s8, s8                  
          and   s5, s7, s8              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          sw    s4, -12(s0)             
          beqz  s5, _L285               
_L284:                                  
          li    s2, 2                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L293:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          xori  s4, s4, 1               
          sw    s3, -8(s0)              
          beqz  s4, _L295               
_L294:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING25           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING14           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
_L298:                                  
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          lw    s4, -8(s0)              
          mul   s5, s4, s3              
          mv    s4, s5                  
          lw    s3, 16(s2)              
          lw    s5, -12(s0)             
          mul   s6, s5, s3              
          mv    s5, s6                  
          lw    s3, 20(s2)              
          lw    s3, 20(s2)              
          add   s6, s3, s4              
          sub   s3, s6, s5              
          sw    s3, 20(s2)              
          sw    s2, 4(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L295:                                  
          li    s2, 1                   
          lw    s3, -12(s0)             
          slt   s4, s3, s2              
          xori  s4, s4, 1               
          sw    s3, -12(s0)             
          beqz  s4, _L297               
_L296:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING26           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 16(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING14           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          j     _L298                   
_L297:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING27           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          j     _L298                   
_L285:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 21                  
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          beqz  s5, _L287               
_L286:                                  
          li    s2, 1                   
          mv    s3, s2                  
          sw    s3, -12(s0)             
          j     _L293                   
_L287:                                  
          li    s2, 21                  
          lw    s3, 8(s0)               
          slt   s4, s2, s3              
          sw    s3, 8(s0)               
          beqz  s4, _L289               
_L288:                                  
          li    s2, 1                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
          j     _L293                   
_L289:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, 8(s0)               
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          sw    s4, 8(s0)               
          beqz  s5, _L291               
_L290:                                  
          li    s2, 1                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
          j     _L293                   
_L291:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, 8(s0)               
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s4, 8(s0)               
          beqz  s5, _L293               
_L292:                                  
          li    s2, 1                   
          mv    s3, s2                  
          sw    s3, -12(s0)             
          j     _L293                   

_Player.GetYesOrNo:                     # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L299:                                  
          lw    s2, 8(s0)               
          sw    s2, 4(sp)               
          sw    s2, 8(s0)               
          call  _PrintString            
          lw    s2, 8(s0)               
          la    s3, _STRING28           
          sw    s3, 4(sp)               
          sw    s2, 8(s0)               
          call  _PrintString            
          lw    s2, 8(s0)               
          sw    s2, 8(s0)               
          call  _ReadInteger            
          move  s3, a0                  
          lw    s2, 8(s0)               
          li    s4, 0                   
          sub   s5, s3, s4              
          snez  s5, s5                  
          sw    s2, 8(s0)               
          mv    a0, s5                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Dealer.Init:                           # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L300:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s3, 0                   
          sw    s3, 4(s2)               
          lw    s3, 8(s2)               
          li    s3, 0                   
          sw    s3, 8(s2)               
          lw    s3, 12(s2)              
          li    s3, 0                   
          sw    s3, 12(s2)              
          la    s3, _STRING4            
          mv    s4, s3                  
          lw    s3, 24(s2)              
          sw    s4, 24(s2)              
          sw    s2, 4(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Dealer.TakeTurn:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -20              
_L301:                                  
          la    s2, _STRING17           
          sw    s2, 4(sp)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING18           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
_L302:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 16                  
          slt   s5, s4, s3              
          xori  s5, s5, 1               
          sw    s2, 4(s0)               
          beqz  s5, _L304               
_L303:                                  
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          lw    s3, 8(s0)               
          sw    s3, 8(sp)               
          lw    s4, 0(s2)               
          lw    s5, 12(s4)              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          jalr  s5                      
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          j     _L302                   
_L304:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          li    s4, 21                  
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          beqz  s5, _L306               
_L305:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING20           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING21           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
_L307:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L306:                                  
          lw    s2, 4(s0)               
          lw    s3, 24(s2)              
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING22           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintInt               
          lw    s2, 4(s0)               
          la    s3, _STRING14           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          j     _L307                   

_House.SetupGame:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L308:                                  
          la    s2, _STRING29           
          sw    s2, 4(sp)               
          call  _PrintString            
          la    s2, _STRING30           
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _rndModule_New          
          move  s2, a0                  
          mv    s3, s2                  
          la    s2, _STRING31           
          sw    s2, 4(sp)               
          sw    s3, -8(s0)              
          call  _PrintString            
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
          call  _ReadInteger            
          move  s2, a0                  
          lw    s3, -8(s0)              
          sw    s3, 4(sp)               
          sw    s2, 8(sp)               
          lw    s2, 0(s3)               
          lw    s4, 8(s2)               
          sw    s3, -8(s0)              
          jalr  s4                      
          lw    s3, -8(s0)              
          lw    s2, 4(s0)               
          lw    s4, 12(s2)              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          call  _BJDeck_New             
          move  s4, a0                  
          lw    s2, 4(s0)               
          lw    s3, -8(s0)              
          sw    s4, 12(s2)              
          lw    s4, 8(s2)               
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          call  _Dealer_New             
          move  s4, a0                  
          lw    s2, 4(s0)               
          lw    s3, -8(s0)              
          sw    s4, 8(s2)               
          lw    s4, 12(s2)              
          sw    s4, 4(sp)               
          sw    s3, 8(sp)               
          lw    s3, 0(s4)               
          lw    s4, 8(s3)               
          sw    s2, 4(s0)               
          jalr  s4                      
          lw    s2, 4(s0)               
          lw    s3, 12(s2)              
          sw    s3, 4(sp)               
          lw    s4, 0(s3)               
          lw    s3, 16(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House.SetupPlayers:                    # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -52              
_L309:                                  
          la    s2, _STRING32           
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _ReadInteger            
          move  s2, a0                  
          mv    s3, s2                  
          lw    s2, 4(s0)               
          lw    s4, 4(s2)               
          li    s4, 0                   
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          beqz  s5, _L311               
_L310:                                  
          la    s2, _STRING7            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L311:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s2, s3              
          add   s5, s2, s4              
          sw    s5, 4(sp)               
          sw    s2, -12(s0)             
          sw    s5, -16(s0)             
          sw    s3, -8(s0)              
          call  _Alloc                  
          move  s4, a0                  
          lw    s2, -12(s0)             
          lw    s5, -16(s0)             
          lw    s3, -8(s0)              
          sw    s3, 0(s4)               
          li    s3, 0                   
          add   s4, s4, s5              
          sw    s2, -12(s0)             
          sw    s5, -16(s0)             
          sw    s4, -20(s0)             
          sw    s3, -24(s0)             
_L312:                                  
          lw    s2, -16(s0)             
          lw    s3, -12(s0)             
          sub   s2, s2, s3              
          sw    s3, -12(s0)             
          sw    s2, -16(s0)             
          beqz  s2, _L314               
_L313:                                  
          lw    s2, -20(s0)             
          lw    s3, -12(s0)             
          sub   s2, s2, s3              
          lw    s4, -24(s0)             
          sw    s4, 0(s2)               
          sw    s3, -12(s0)             
          sw    s2, -20(s0)             
          sw    s4, -24(s0)             
          j     _L312                   
_L314:                                  
          lw    s2, 4(s0)               
          lw    s3, -20(s0)             
          sw    s3, 4(s2)               
          li    s3, 0                   
          mv    s4, s3                  
          sw    s2, 4(s0)               
          sw    s4, -28(s0)             
_L316:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s3, -28(s0)             
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -28(s0)             
          beqz  s5, _L324               
_L317:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -28(s0)             
          slt   s6, s5, s4              
          sw    s2, 4(s0)               
          sw    s5, -28(s0)             
          sw    s3, -32(s0)             
          beqz  s6, _L319               
_L318:                                  
          li    s2, 0                   
          lw    s3, -28(s0)             
          slt   s4, s3, s2              
          sw    s3, -28(s0)             
          beqz  s4, _L320               
_L319:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L320:                                  
          li    s2, 4                   
          lw    s3, -28(s0)             
          mul   s4, s3, s2              
          lw    s2, -32(s0)             
          add   s5, s2, s4              
          lw    s4, 0(s5)               
          sw    s3, -28(s0)             
          sw    s2, -32(s0)             
          call  _Player_New             
          move  s4, a0                  
          lw    s3, -28(s0)             
          lw    s2, -32(s0)             
          li    s5, 4                   
          mul   s6, s3, s5              
          add   s5, s2, s6              
          sw    s4, 0(s5)               
          lw    s2, 4(s0)               
          lw    s4, 4(s2)               
          lw    s5, -4(s4)              
          slt   s6, s3, s5              
          sw    s2, 4(s0)               
          sw    s3, -28(s0)             
          sw    s4, -36(s0)             
          beqz  s6, _L322               
_L321:                                  
          li    s2, 0                   
          lw    s3, -28(s0)             
          slt   s4, s3, s2              
          sw    s3, -28(s0)             
          beqz  s4, _L323               
_L322:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L323:                                  
          li    s2, 4                   
          lw    s3, -28(s0)             
          mul   s4, s3, s2              
          lw    s2, -36(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          li    s4, 1                   
          add   s5, s3, s4              
          sw    s2, 4(sp)               
          sw    s5, 8(sp)               
          lw    s4, 0(s2)               
          lw    s2, 8(s4)               
          sw    s3, -28(s0)             
          jalr  s2                      
          lw    s3, -28(s0)             
          sw    s3, -28(s0)             
_L315:                                  
          li    s2, 1                   
          lw    s3, -28(s0)             
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -28(s0)             
          j     _L316                   
_L324:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House.TakeAllBets:                     # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -28              
_L325:                                  
          la    s2, _STRING33           
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 0                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L327:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s3, -8(s0)              
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          beqz  s5, _L336               
_L328:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -12(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L330               
_L329:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L331               
_L330:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L331:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -12(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 0(s2)               
          lw    s2, 24(s4)              
          sw    s3, -8(s0)              
          jalr  s2                      
          move  s4, a0                  
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
          beqz  s4, _L326               
_L332:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -16(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L334               
_L333:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L335               
_L334:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L335:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -16(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 0(s2)               
          lw    s2, 32(s4)              
          sw    s3, -8(s0)              
          jalr  s2                      
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
_L326:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -8(s0)              
          j     _L327                   
_L336:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House.TakeAllTurns:                    # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -32              
_L337:                                  
          li    s2, 0                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L339:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s3, -8(s0)              
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          beqz  s5, _L348               
_L340:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -12(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L342               
_L341:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L343               
_L342:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L343:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -12(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 0(s2)               
          lw    s2, 24(s4)              
          sw    s3, -8(s0)              
          jalr  s2                      
          move  s4, a0                  
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
          beqz  s4, _L338               
_L344:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -16(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L346               
_L345:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L347               
_L346:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L347:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -16(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          lw    s4, 4(s0)               
          lw    s5, 12(s4)              
          sw    s2, 4(sp)               
          sw    s5, 8(sp)               
          lw    s5, 0(s2)               
          lw    s2, 20(s5)              
          sw    s4, 4(s0)               
          sw    s3, -8(s0)              
          jalr  s2                      
          lw    s4, 4(s0)               
          lw    s3, -8(s0)              
          sw    s4, 4(s0)               
          sw    s3, -8(s0)              
_L338:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -8(s0)              
          j     _L339                   
_L348:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House.ResolveAllPlayers:               # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -36              
_L349:                                  
          la    s2, _STRING34           
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 0                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L351:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s3, -8(s0)              
          slt   s5, s3, s4              
          sw    s2, 4(s0)               
          sw    s3, -8(s0)              
          beqz  s5, _L360               
_L352:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -12(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L354               
_L353:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L355               
_L354:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L355:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -12(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 0(s2)               
          lw    s2, 24(s4)              
          sw    s3, -8(s0)              
          jalr  s2                      
          move  s4, a0                  
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
          beqz  s4, _L350               
_L356:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s3, -16(s0)             
          sw    s2, 4(s0)               
          sw    s5, -8(s0)              
          beqz  s6, _L358               
_L357:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L359               
_L358:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L359:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -16(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          lw    s4, 4(s0)               
          lw    s5, 8(s4)               
          sw    s5, 4(sp)               
          lw    s6, 0(s5)               
          lw    s5, 36(s6)              
          sw    s4, 4(s0)               
          sw    s2, -20(s0)             
          sw    s3, -8(s0)              
          jalr  s5                      
          move  s6, a0                  
          lw    s4, 4(s0)               
          lw    s2, -20(s0)             
          lw    s3, -8(s0)              
          sw    s2, 4(sp)               
          sw    s6, 8(sp)               
          lw    s5, 0(s2)               
          lw    s2, 40(s5)              
          sw    s4, 4(s0)               
          sw    s3, -8(s0)              
          jalr  s2                      
          lw    s4, 4(s0)               
          lw    s3, -8(s0)              
          sw    s4, 4(s0)               
          sw    s3, -8(s0)              
_L350:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -8(s0)              
          j     _L351                   
_L360:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House.PrintAllMoney:                   # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L361:                                  
          li    s2, 0                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L363:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s3, -8(s0)              
          slt   s5, s3, s4              
          sw    s3, -8(s0)              
          sw    s2, 4(s0)               
          beqz  s5, _L368               
_L364:                                  
          lw    s2, 4(s0)               
          lw    s3, 4(s2)               
          lw    s4, -4(s3)              
          lw    s5, -8(s0)              
          slt   s6, s5, s4              
          sw    s5, -8(s0)              
          sw    s2, 4(s0)               
          sw    s3, -12(s0)             
          beqz  s6, _L366               
_L365:                                  
          li    s2, 0                   
          lw    s3, -8(s0)              
          slt   s4, s3, s2              
          sw    s3, -8(s0)              
          beqz  s4, _L367               
_L366:                                  
          la    s2, _STRING8            
          sw    s2, 4(sp)               
          call  _PrintString            
          call  _Halt                   
_L367:                                  
          li    s2, 4                   
          lw    s3, -8(s0)              
          mul   s4, s3, s2              
          lw    s2, -12(s0)             
          add   s5, s2, s4              
          lw    s2, 0(s5)               
          sw    s2, 4(sp)               
          lw    s4, 0(s2)               
          lw    s2, 28(s4)              
          sw    s3, -8(s0)              
          jalr  s2                      
          lw    s3, -8(s0)              
          sw    s3, -8(s0)              
_L362:                                  
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -8(s0)              
          j     _L363                   
_L368:                                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_House.PlayOneGame:                     # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -20              
_L369:                                  
          lw    s2, 4(s0)               
          lw    s3, 12(s2)              
          sw    s3, 4(sp)               
          lw    s4, 0(s3)               
          lw    s3, 20(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          move  s4, a0                  
          lw    s2, 4(s0)               
          li    s3, 26                  
          slt   s5, s4, s3              
          sw    s2, 4(s0)               
          beqz  s5, _L371               
_L370:                                  
          lw    s2, 4(s0)               
          lw    s3, 12(s2)              
          sw    s3, 4(sp)               
          lw    s4, 0(s3)               
          lw    s3, 16(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
_L371:                                  
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 16(s3)              
          sw    s2, 4(s0)               
          jalr  s4                      
          lw    s2, 4(s0)               
          la    s3, _STRING35           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          li    s4, 0                   
          sw    s3, 4(sp)               
          sw    s4, 8(sp)               
          lw    s4, 0(s3)               
          lw    s3, 8(s4)               
          sw    s2, 4(s0)               
          jalr  s3                      
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          lw    s4, 12(s2)              
          sw    s3, 4(sp)               
          sw    s4, 8(sp)               
          lw    s4, 0(s3)               
          lw    s3, 12(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 20(s3)              
          sw    s2, 4(s0)               
          jalr  s4                      
          lw    s2, 4(s0)               
          lw    s3, 8(s2)               
          lw    s4, 12(s2)              
          sw    s3, 4(sp)               
          sw    s4, 8(sp)               
          lw    s4, 0(s3)               
          lw    s3, 20(s4)              
          sw    s2, 4(s0)               
          jalr  s3                      
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 24(s3)              
          sw    s2, 4(s0)               
          jalr  s4                      
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

main:                                   # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -24              
_L372:                                  
          li    s2, 1                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
          call  _House_New              
          move  s2, a0                  
          lw    s3, -8(s0)              
          mv    s4, s2                  
          sw    s4, 4(sp)               
          lw    s2, 0(s4)               
          lw    s5, 8(s2)               
          sw    s3, -8(s0)              
          sw    s4, -12(s0)             
          jalr  s5                      
          lw    s3, -8(s0)              
          lw    s4, -12(s0)             
          sw    s4, 4(sp)               
          lw    s2, 0(s4)               
          lw    s5, 12(s2)              
          sw    s3, -8(s0)              
          sw    s4, -12(s0)             
          jalr  s5                      
          lw    s3, -8(s0)              
          lw    s4, -12(s0)             
          sw    s3, -8(s0)              
          sw    s4, -12(s0)             
_L373:                                  
          lw    s2, -8(s0)              
          beqz  s2, _L375               
_L374:                                  
          lw    s2, -12(s0)             
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s4, 32(s3)              
          sw    s2, -12(s0)             
          jalr  s4                      
          lw    s2, -12(s0)             
          la    s3, _STRING36           
          sw    s3, 4(sp)               
          sw    s2, -12(s0)             
          call  _Main.GetYesOrNo        
          move  s3, a0                  
          lw    s2, -12(s0)             
          mv    s4, s3                  
          sw    s4, -8(s0)              
          sw    s2, -12(s0)             
          j     _L373                   
_L375:                                  
          lw    s2, -12(s0)             
          sw    s2, 4(sp)               
          lw    s3, 0(s2)               
          lw    s2, 28(s3)              
          jalr  s2                      
          la    s2, _STRING37           
          sw    s2, 4(sp)               
          call  _PrintString            
          la    s2, _STRING38           
          sw    s2, 4(sp)               
          call  _PrintString            
          la    s2, _STRING39           
          sw    s2, 4(sp)               
          call  _PrintString            
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Main.GetYesOrNo:                       # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L376:                                  
          lw    s2, 4(s0)               
          sw    s2, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          la    s3, _STRING28           
          sw    s3, 4(sp)               
          sw    s2, 4(s0)               
          call  _PrintString            
          lw    s2, 4(s0)               
          sw    s2, 4(s0)               
          call  _ReadInteger            
          move  s3, a0                  
          lw    s2, 4(s0)               
          li    s4, 0                   
          sub   s5, s3, s4              
          snez  s5, s5                  
          sw    s2, 4(s0)               
          mv    a0, s5                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

          .section .rodata              
_STRING9:
          .string "Shuffling..."        
_STRING12:
          .string "? "                  
_STRING2:
          .string "BJDeck"              
_STRING19:
          .string "Would you like a hit?"
_STRING22:
          .string " stays at "          
_STRING21:
          .string "!\n"                 
_STRING37:
          .string "Thank you for playing...come again soon.\n"
_STRING17:
          .string "\n"                  
_STRING35:
          .string "\nDealer starts. "   
_STRING13:
          .string " was dealt a "       
_STRING27:
          .string ", you push!\n"       
_STRING34:
          .string "\nTime to resolve bets.\n"
_STRING32:
          .string "How many players do we have today? "
_STRING38:
          .string "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
_STRING14:
          .string ".\n"                 
_STRING3:
          .string "Player"              
_STRING7:
          .string "Decaf runtime error: Cannot create negative-sized array\n"
_STRING24:
          .string "How much would you like to bet? "
_STRING31:
          .string "Please enter a random number seed: "
_STRING11:
          .string "What is the name of player #"
_STRING1:
          .string "Deck"                
_STRING25:
          .string ", you won $"         
_STRING5:
          .string "House"               
_STRING10:
          .string "done.\n"             
_STRING30:
          .string "---------------------------\n"
_STRING0:
          .string "rndModule"           
_STRING39:
          .string "(2001 mods by jdz)\n"
_STRING15:
          .string "Would you like to double down?"
_STRING26:
          .string ", you lost $"        
_STRING36:
          .string "\nDo you want to play another hand?"
_STRING33:
          .string "\nFirst, let's take bets.\n"
_STRING16:
          .string ", your total is "    
_STRING23:
          .string ", you have $"        
_STRING28:
          .string " (0=No/1=Yes) "      
_STRING6:
          .string "Main"                
_STRING18:
          .string "'s turn.\n"          
_STRING20:
          .string " busts with the big "
_STRING4:
          .string "Dealer"              
_STRING8:
          .string "Decaf runtime error: Array subscript out of bounds\n"
_STRING29:
          .string "\nWelcome to CS143 BlackJack!\n"
