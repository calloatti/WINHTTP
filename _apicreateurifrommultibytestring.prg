*!* _apiCreateUriFromMultiByteString

Lparameters pszANSIInputUri, dwEncodingFlags, dwCodePage, dwCreateFlags, dwReserved, ppURI

Declare Integer CreateUriFromMultiByteString in URLMON.DLL As _apiCreateUriFromMultiByteString ;
	String  pszANSIInputUri, ;
	Integer dwEncodingFlags, ;
	Integer dwCodePage, ;
	Integer dwCreateFlags, ;
	Integer dwReserved, ;
	Integer @ppURI

Return _apiCreateUriFromMultiByteString(m.pszANSIInputUri, m.dwEncodingFlags, m.dwCodePage, m.dwCreateFlags, m.dwReserved, @m.ppURI)