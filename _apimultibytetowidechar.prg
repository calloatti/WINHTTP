*!* _apiMultiByteToWideChar

Lparameters CodePage, dwFlags, lpMultiByteStr, cbMultiByte, lpWideCharStr, cchWideChar

Declare Integer MultiByteToWideChar in WIN32API As _apiMultiByteToWideChar ;
	Integer CodePage, ;
	Integer dwFlags, ;
	String  lpMultiByteStr, ;
	Integer cbMultiByte, ;
	String  @lpWideCharStr, ;
	Integer cchWideChar

Return _apiMultiByteToWideChar(m.CodePage, m.dwFlags, m.lpMultiByteStr, m.cbMultiByte, @m.lpWideCharStr, m.cchWideChar)