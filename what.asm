format PE GUI

include '%fasminc%/win32w.inc'

entry main

struct MSGBOXDATA
  params              MSGBOXPARAMS <>
  dwunk               dd ?
  pwndOwner           dd ?
  wLanguageId         dd ?
  pidButton           dd ?         ; // Array of button IDs
  ppszButtonText      dd ?         ; // Array of button text strings
  cButtons            dd ?
  DefButton           dd ?
  CancelId            dd ?
  Timeout             dd ?
  unk2                dd 5 dup (?)
ends

section '.data' data readable writeable

sCaption du 'AxAaxaXxaBAxA ?? dead inside zagadka', 0
sTitle du '                       1000-7???', 0
sTitleDead du '4t0 TbI cka3al??? Axaxaxaxa, 1000-7 ckolko 6ydet??/!', 0
sBTN1 du '993',0
sBTN2 du '991',0
sBTN3 du '-1',0
sBTN4 du 'aAXa p0zer', 0

dwBtnIds  dd 1,2,3,4
dwTxtTbl  dd sBTN1, sBTN2, sBTN3, sBTN4
dwTxtTblDead dd sBTN1, sBTN2, sBTN3, sBTN4

mbxDead MSGBOXDATA <sizeof.MSGBOXPARAMS, 0, 0, sTitleDead, sCaption, MB_YESNOCANCEL, 0, 0, 0, 0>, \
                    0, 0, 0, dwBtnIds, dwTxtTblDead, 4, 0, 2, -1
mbxDead1 MSGBOXDATA <sizeof.MSGBOXPARAMS, 0, 0, sTitle, sCaption, MB_YESNOCANCEL, 0, 0, 0, 0>, \
                    0, 0, 0, dwBtnIds, dwTxtTblDead, 4, 0, 2, -1

section '.idata' import data readable writeable

library kernel, 'kernel32.dll', \
        user, 'user32.dll'

import kernel,\
       ExitProcess, 'ExitProcess'
import user,\
       SoftModalMessageBox, 'SoftModalMessageBox'


section '.text' code readable executable writable

main:
    invoke SoftModalMessageBox, mbxDead1
    cmp eax, 2
    jz recur
    cmp eax, 3
    jz recur
    cmp eax, 4
    jz recur
    invoke ExitProcess, 0

recur:
    invoke SoftModalMessageBox, mbxDead
    cmp eax, 2
    jz recur
    cmp eax, 3
    jz recur
    cmp eax, 4
    jz recur
    invoke ExitProcess, 0