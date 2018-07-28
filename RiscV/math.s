          .text                         
          .globl main                   

          .data                         
          .align 2                      
_Math:                                  # virtual table
          .word 0                       # parent
          .word _STRING0                # class name

          .data                         
          .align 2                      
_Main:                                  # virtual table
          .word 0                       # parent
          .word _STRING1                # class name



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
_Math_New:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L28:                                   
          li    s2, 4                   
          sw    s2, 4(sp)               
          call  _Alloc                  
          move  s2, a0                  
          la    s3, _Math               
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
_L29:                                   
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

_Math.abs:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L30:                                   
          li    s2, 0                   
          lw    s3, 4(s0)               
          slt   s4, s3, s2              
          xori  s4, s4, 1               
          sw    s3, 4(s0)               
          beqz  s4, _L32                
_L31:                                   
          lw    s2, 4(s0)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L32:                                   
          lw    s2, 4(s0)               
          neg   s3, s2                  
          sw    s2, 4(s0)               
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Math.pow:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -20              
_L34:                                   
          li    s2, 1                   
          mv    s3, s2                  
          li    s2, 0                   
          mv    s4, s2                  
          sw    s4, -8(s0)              
          sw    s3, -12(s0)             
_L36:                                   
          lw    s2, -8(s0)              
          lw    s3, 8(s0)               
          slt   s4, s2, s3              
          sw    s2, -8(s0)              
          sw    s3, 8(s0)               
          beqz  s4, _L38                
_L37:                                   
          lw    s2, -12(s0)             
          lw    s3, 4(s0)               
          mul   s4, s2, s3              
          mv    s2, s4                  
          sw    s3, 4(s0)               
          sw    s2, -12(s0)             
_L35:                                   
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          sw    s3, -8(s0)              
          j     _L36                    
_L38:                                   
          lw    s2, -12(s0)             
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Math.log:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -16              
_L39:                                   
          li    s2, 1                   
          lw    s3, 4(s0)               
          slt   s4, s3, s2              
          sw    s3, 4(s0)               
          beqz  s4, _L41                
_L40:                                   
          li    s2, 1                   
          neg   s3, s2                  
          mv    a0, s3                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L41:                                   
          li    s2, 0                   
          mv    s3, s2                  
          sw    s3, -8(s0)              
_L42:                                   
          li    s2, 1                   
          lw    s3, 4(s0)               
          slt   s4, s2, s3              
          sw    s3, 4(s0)               
          beqz  s4, _L44                
_L43:                                   
          li    s2, 1                   
          lw    s3, -8(s0)              
          add   s4, s3, s2              
          mv    s3, s4                  
          li    s2, 2                   
          lw    s4, 4(s0)               
          div   s5, s4, s2              
          mv    s4, s5                  
          sw    s4, 4(s0)               
          sw    s3, -8(s0)              
          j     _L42                    
_L44:                                   
          lw    s2, -8(s0)              
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Math.max:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L45:                                   
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          slt   s4, s3, s2              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          beqz  s4, _L47                
_L46:                                   
          lw    s2, 4(s0)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L47:                                   
          lw    s2, 8(s0)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

_Math.min:                              # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -12              
_L49:                                   
          lw    s2, 4(s0)               
          lw    s3, 8(s0)               
          slt   s4, s2, s3              
          sw    s2, 4(s0)               
          sw    s3, 8(s0)               
          beqz  s4, _L51                
_L50:                                   
          lw    s2, 4(s0)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      
_L51:                                   
          lw    s2, 8(s0)               
          mv    a0, s2                  
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

main:                                   # function entry
          sw s0, 0(sp)                  
          sw ra, -4(sp)                 
          move s0, sp                   
          addi sp, sp, -20              
_L53:                                   
          li    s2, 1                   
          neg   s3, s2                  
          sw    s3, 4(sp)               
          call  _Math.abs               
          move  s2, a0                  
          sw    s2, 4(sp)               
          call  _PrintInt               
          la    s2, _STRING2            
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 2                   
          li    s3, 3                   
          sw    s2, 4(sp)               
          sw    s3, 8(sp)               
          call  _Math.pow               
          move  s2, a0                  
          sw    s2, 4(sp)               
          call  _PrintInt               
          la    s2, _STRING2            
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 16                  
          sw    s2, 4(sp)               
          call  _Math.log               
          move  s2, a0                  
          sw    s2, 4(sp)               
          call  _PrintInt               
          la    s2, _STRING2            
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 1                   
          li    s3, 2                   
          sw    s2, 4(sp)               
          sw    s3, 8(sp)               
          call  _Math.max               
          move  s2, a0                  
          sw    s2, 4(sp)               
          call  _PrintInt               
          la    s2, _STRING2            
          sw    s2, 4(sp)               
          call  _PrintString            
          li    s2, 1                   
          li    s3, 2                   
          sw    s2, 4(sp)               
          sw    s3, 8(sp)               
          call  _Math.min               
          move  s2, a0                  
          sw    s2, 4(sp)               
          call  _PrintInt               
          la    s2, _STRING2            
          sw    s2, 4(sp)               
          call  _PrintString            
          move  sp, s0                  
          lw    ra, -4(s0)              
          lw    s0, 0(s0)               
          jr    ra                      

          .section .rodata              
_STRING2:
          .string "\n"                  
_STRING0:
          .string "Math"                
_STRING1:
          .string "Main"                
