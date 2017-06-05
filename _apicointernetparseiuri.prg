*!* _apiCoInternetParseIUri

Lparameters pIUri, ParseAction, dwFlags, pwzResult, cchResult, pcchResult, dwReserved

Declare Integer CoInternetParseIUri in 'URLMON.DLL' As _apiCoInternetParseIUri ;
	Integer pIUri, ;
	Integer ParseAction, ;
	Integer dwFlags, ;
	String  @pwzResult, ;
	Integer cchResult, ;
	Integer @pcchResult, ;
	Integer dwReserved

Return _apiCoInternetParseIUri(m.pIUri, m.ParseAction, m.dwFlags, @m.pwzResult, m.cchResult, @m.pcchResult, m.dwReserved)