﻿; =================================================================================================
; Function......: timeGetTime
; DLL...........: Winmm.dll
; Library.......: Winmm.lib
; U/ANSI........:
; Author........: jNizM
; Modified......:
; Links.........: http://msdn.microsoft.com/en-us/library/windows/desktop/dd757629(v=vs.85).aspx
; =================================================================================================
timeGetTime()
{
    return DllCall("Winmm.dll\timeGetTime", "UInt")
}
; ===================================================================================

MsgBox, % timeGetTime()





/* C++ ==============================================================================
DWORD timeGetTime(void);        // UInt
================================================================================== */