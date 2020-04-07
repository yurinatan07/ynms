If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

Get-AppxPackage -AllUsers *Microsoft.WindowsCamera* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Windows.Photos* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.VP9VideoExtensions* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.StorePurchaseApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Wallet* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.ScreenSketch* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.ZuneVideo* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.ZuneMusic* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxGameOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Xbox.TCUI* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WindowsMaps* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WebpImageExtension* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.WebMediaExtensions* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Print3D* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.People* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.OneConnect* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Office.OneNote* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.MSPaint* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.MixedReality.Portal* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Microsoft3DViewer* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Messaging* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Getstarted* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.GetHelp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.BingWeather* | Remove-AppxPackage
Get-AppxPackage -AllUsers *king.com.CandyCrushFriends* | Remove-AppxPackage
Get-AppxPackage -AllUsers *king.com.BubbleWitch3Saga* | Remove-AppxPackage
Get-AppxPackage -AllUsers *HxOutlook.exe* | Remove-AppxPackage
Get-AppxPackage -AllUsers *WWAHost.exe* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Msn.News.exe* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Todo.exe* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Receiver* | Remove-AppxPackage
Get-AppxPackage -AllUsers *HxCalendarAppImm* | Remove-AppxPackage
Get-AppxPackage -AllUsers *WinStore.App.exe* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Netflix | Remove-AppxPackage
Get-AppxPackage -AllUsers king.com.CandyCrushSodaSaga | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.ParentalControls | Remove-AppxPackage
Get-AppxPackage -AllUsers Windows.ContactSupport | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Xbox* | Remove-AppxPackage
Get-AppxPackage -AllUsers microsoft.windowscommunicationsapps | Remove-AppxPackage # Mail and Calendar
Get-AppxPackage -AllUsers Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Zune* | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.WindowsPhone | Remove-AppxPackage # Phone Companion
Get-AppxPackage -AllUsers Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Office.Sway | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Appconnector | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.WindowsFeedback* | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.FeatureOnDemand.InsiderHub | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.Cortana | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.People | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Bing* | Remove-AppxPackage # Money, Sports, News, Finance and Weather
Get-AppxPackage -AllUsers Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.CommsPhone | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Advertising.Xaml | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.SecondaryTileExperience | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.ParentalControls | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.ContentDeliveryManager | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.CloudExperienceHost | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Windows.ShellExperienceHost | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.BioEnrollment | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.OneConnect | Remove-AppxPackage
Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage
Get-AppxPackage -AllUsers king.com.CandyCrushSodaSaga | Remove-AppxPackage
Get-AppxPackage -AllUsers flaregamesGmbH.RoyalRevolt2 | Remove-AppxPackage
Get-AppxPackage -AllUsers *Netflix | Remove-AppxPackage
Get-AppxPackage -AllUsers Facebook.Facebook | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.MinecraftUWP | Remove-AppxPackage
Get-AppxPackage -AllUsers *MarchofEmpires | Remove-AppxPackage

pause
