if (!A_IsCompiled) {
	IfNotExist, %A_Temp%\Office2013.ico
	{
		try {
			URLDownloadToFile, https://dl.dropboxusercontent.com/u/46638969/images/Office/Office2013.ico, %A_Temp%\Office2013.ico
		}
	}
	try {
		Menu, Tray, Icon, %A_Temp%\Office2013.ico
	}
}
RegRead, isDisabled, HKCU, Software\Microsoft\Office\15.0\Common\General, DisableBootToOfficeStart
Gui, Color, White
Gui, Font, s14, Segoe UI Light
Gui, Add, Text, w250 Center, % "The Office Start Screen is:"
Gui, Add, Text, Section w50 vp
Gui, Add, Radio, ys gEnableDisable vradOSS, % "On"
Gui, Add, Radio, ys Checked gEnableDisable, % "Off"
if (isDisabled = "" || isDisabled = 0)
	GuiControl,, radOSS, 1
Gui, Font, s10
Gui, Add, Link, xm, `n<a href="https://dl.dropboxusercontent.com/u/46638969/images/OfficeStartScreen.png">What is the Office Start Screen?</a>
GuiControl, Focus, p
Gui, Show,, % "Office Start Screen"
return

EnableDisable:
{
	Gui, Submit, Nohide
	GuiControl, Focus, p
	state := (radOSS = 1 ? 0 : 1)
	RegWrite, REG_DWORD, HKCU, Software\Microsoft\Office\15.0\Common\General, DisableBootToOfficeStart, %state%
	return
}

GuiClose:
{
	ExitApp
}