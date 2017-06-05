*!* winhttp.prg

#Define WinHttpRequestOption_UserAgentString	0
#Define WinHttpRequestOption_URL	1
#Define WinHttpRequestOption_URLCodePage	2
#Define WinHttpRequestOption_EscapePercentInURL	3
#Define WinHttpRequestOption_SslErrorIgnoreFlags	4
#Define WinHttpRequestOption_SelectCertificate	5
#Define WinHttpRequestOption_EnableRedirects	6
#Define WinHttpRequestOption_UrlEscapeDisable	7
#Define WinHttpRequestOption_UrlEscapeDisableQuery	8
#Define WinHttpRequestOption_SecureProtocols	9
#Define WinHttpRequestOption_EnableTracing	10
#Define WinHttpRequestOption_RevertImpersonationOverSsl	11
#Define WinHttpRequestOption_EnableHttpsToHttpRedirects	12
#Define WinHttpRequestOption_EnablePassportAuthentication	13
#Define WinHttpRequestOption_MaxAutomaticRedirects	14
#Define WinHttpRequestOption_MaxResponseHeaderSize	15
#Define WinHttpRequestOption_MaxResponseDrainSize	16
#Define WinHttpRequestOption_EnableHttp1_1	17
#Define WinHttpRequestOption_EnableCertificateRevocationCheck	18

#Define AutoLogonPolicy_Always	0
#Define AutoLogonPolicy_OnlyIfBypassProxy	1
#Define AutoLogonPolicy_Never	2

#Define SslErrorFlag_UnknownCA	256
#Define SslErrorFlag_CertWrongUsage	512
#Define SslErrorFlag_CertCNInvalid	4096
#Define SslErrorFlag_CertDateInvalid	8192
#Define SslErrorFlag_Ignore_All	13056

#Define SecureProtocol_SSL2	8
#Define SecureProtocol_SSL3	32
#Define SecureProtocol_TLS1	128
#Define SecureProtocol_ALL	168

#Define HTTPREQUEST_PROXYSETTING_DEFAULT = 0
#Define HTTPREQUEST_PROXYSETTING_PRECONFIG = 0
#Define HTTPREQUEST_PROXYSETTING_DIRECT = 1
#Define HTTPREQUEST_PROXYSETTING_PROXY = 2

#Define HTTPREQUEST_SETCREDENTIALS_FOR_SERVER = 0
#Define HTTPREQUEST_SETCREDENTIALS_FOR_PROXY = 1

If Upper(Juststem(Sys(16))) $ Set('Procedure') Then
	Return
Endif

If Empty(Set('Path')) Then
	Set Path To (Addbs(Justpath(Sys(16))))
Else
	If Not Upper(Addbs(Justpath(Sys(16)))) $ Set('Path') Then
		Set Path To (Set('Path') + ';' + Addbs(Justpath(Sys(16))))
	Endif
Endif

Set Procedure To Sys(16) Additive

Return

*!* Since there seems to be no way to use the IMPLEMENTS clause in a visual class
*!* we create a PRG class here and then use it in the visual class

 Define Class WinHttpRequestEvents As Custom

	Implements IWinHttpRequestEvents In 'WinHttp.WinHttpRequest.5.1'

	Procedure IWinHttpRequestEvents_OnResponseStart(pStatus, pContentType)
	Endproc

 	Procedure IWinHttpRequestEvents_OnResponseDataAvailable(pData)
		Raiseevent(This, 'IWinHttpRequestEvents_ORDA', m.pData)
	Endproc

 	Procedure IWinHttpRequestEvents_OnResponseFinished()
	Endproc

 	Procedure IWinHttpRequestEvents_OnError(pErrorNumber, pErrorDescription)
	Endproc

	*!* IWinHttpRequestEvents_OnResponseDataAvailable does not work
	*!* with BINDEVENT because the event name is too long,
	*!* we add this event with a shorter name and call RAISEEVENT in the
	*!* original event

 	Procedure IWinHttpRequestEvents_ORDA(pData)
	Endproc

 Enddefine

