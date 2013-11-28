﻿; =================================================================================================
; Function......: GetTcpStatisticsEx
; DLL...........: Iphlpapi.dll
; Library.......: Iphlpapi.lib
; U/ANSI........:
; Author........: jNizM
; Modified......:
; Links.........: http://msdn.microsoft.com/en-us/library/windows/desktop/aa366023(v=vs.85).aspx
; AHK =============================================================================================
GetTcpStatisticsEx()
{
    static MIB_TCPSTATS, init := VarSetCapacity(MIB_TCPSTATS, 60, 0) && NumPut(60, MIB_TCPSTATS, "UInt")
    static IPv4 := 2, IPv6 := 23
    DllCall("Iphlpapi.dll\GetTcpStatisticsEx", "UInt", &MIB_TCPSTATS, "UInt", IPv4)
    return, {  0 : NumGet(MIB_TCPSTATS,  0, "UInt"),  1 : NumGet(MIB_TCPSTATS,  4, "UInt"),  2 : NumGet(MIB_TCPSTATS,  8, "UInt")
            ,  3 : NumGet(MIB_TCPSTATS, 12, "UInt"),  4 : NumGet(MIB_TCPSTATS, 16, "UInt"),  5 : NumGet(MIB_TCPSTATS, 20, "UInt")
            ,  6 : NumGet(MIB_TCPSTATS, 24, "UInt"),  7 : NumGet(MIB_TCPSTATS, 28, "UInt"),  8 : NumGet(MIB_TCPSTATS, 32, "UInt")
            ,  9 : NumGet(MIB_TCPSTATS, 36, "UInt"), 10 : NumGet(MIB_TCPSTATS, 40, "UInt"), 11 : NumGet(MIB_TCPSTATS, 44, "UInt")
            , 12 : NumGet(MIB_TCPSTATS, 48, "UInt"), 13 : NumGet(MIB_TCPSTATS, 52, "UInt"), 14 : NumGet(MIB_TCPSTATS, 56, "UInt") }
}
; ===================================================================================

GTCPSEx := GetTcpStatisticsEx()

MsgBox, % "GetTcpStatistics function`n"
        . "MIB_TCPSTATS structure`n`n"
        . "RtoAlgorithm:`t`t"          GTCPSEx[0]  "`n"
        . "RtoMin:`t`t`t"              GTCPSEx[1]  "`n"
        . "RtoMax:`t`t`t"              GTCPSEx[2]  "`n"
        . "MaxConn:`t`t`t"             GTCPSEx[3]  "`n"
        . "ActiveOpens:`t`t"           GTCPSEx[4]  "`n"
        . "PassiveOpens:`t`t"          GTCPSEx[5]  "`n"
        . "AttemptFails:`t`t"          GTCPSEx[6]  "`n"
        . "EstabResets:`t`t"           GTCPSEx[7]  "`n"
        . "CurrEstab:`t`t`t"           GTCPSEx[8]  "`n"
        . "InSegs:`t`t`t"              GTCPSEx[9]  "`n"
        . "OutSegs:`t`t`t"             GTCPSEx[10] "`n"
        . "RetransSegs:`t`t"           GTCPSEx[11] "`n"
        . "InErrs:`t`t`t"              GTCPSEx[12] "`n"
        . "OutRsts:`t`t`t"             GTCPSEx[13] "`n"
        . "NumConns:`t`t"              GTCPSEx[14]



/* C++ ==============================================================================
DWORD GetTcpStatisticsEx(
    _Out_  PMIB_TCPSTATS pStats,        // UInt
    _In_   DWORD dwFamily               // UInt
);


typedef struct _MIB_TCPSTATS {
    DWORD dwRtoAlgorithm;               //  0 (60)          UInt
    DWORD dwRtoMin;                     //  4 =>   4        UInt
    DWORD dwRtoMax;                     //  4 =>   8        UInt
    DWORD dwMaxConn;                    //  4 =>  12        UInt
    DWORD dwActiveOpens;                //  4 =>  16        UInt
    DWORD dwPassiveOpens;               //  4 =>  20        UInt
    DWORD dwAttemptFails;               //  4 =>  24        UInt
    DWORD dwEstabResets;                //  4 =>  28        UInt
    DWORD dwCurrEstab;                  //  4 =>  32        UInt
    DWORD dwInSegs;                     //  4 =>  36        UInt
    DWORD dwOutSegs;                    //  4 =>  40        UInt
    DWORD dwRetransSegs;                //  4 =>  44        UInt
    DWORD dwInErrs;                     //  4 =>  48        UInt
    DWORD dwOutRsts;                    //  4 =>  52        UInt
    DWORD dwNumConns;                   //  4 =>  56        UInt
} MIB_TCPSTATS, *PMIB_TCPSTATS;
================================================================================== */