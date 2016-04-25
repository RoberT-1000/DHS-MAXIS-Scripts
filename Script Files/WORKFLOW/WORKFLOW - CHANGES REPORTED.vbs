run_locally = true
script_repository = "C:\DHS-MAXIS-Scripts\Script Files"

'LOADING FUNCTIONS LIBRARY FROM GITHUB REPOSITORY===========================================================================
IF IsEmpty(FuncLib_URL) = TRUE THEN	'Shouldn't load FuncLib if it already loaded once
	IF run_locally = FALSE or run_locally = "" THEN	   'If the scripts are set to run locally, it skips this and uses an FSO below.
		IF use_master_branch = TRUE THEN			   'If the default_directory is C:\DHS-MAXIS-Scripts\Script Files, you're probably a scriptwriter and should use the master branch.
			FuncLib_URL = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/master/MASTER%20FUNCTIONS%20LIBRARY.vbs"
		Else											'Everyone else should use the release branch.
			FuncLib_URL = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/RELEASE/MASTER%20FUNCTIONS%20LIBRARY.vbs"
		End if
		SET req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a FuncLib_URL
		req.open "GET", FuncLib_URL, FALSE							'Attempts to open the FuncLib_URL
		req.send													'Sends request
		IF req.Status = 200 THEN									'200 means great success
			Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
			Execute req.responseText								'Executes the script code
		ELSE														'Error message
			critical_error_msgbox = MsgBox ("Something has gone wrong. The Functions Library code stored on GitHub was not able to be reached." & vbNewLine & vbNewLine &_
                                            "FuncLib URL: " & FuncLib_URL & vbNewLine & vbNewLine &_
                                            "The script has stopped. Please check your Internet connection. Consult a scripts administrator with any questions.", _
                                            vbOKonly + vbCritical, "BlueZone Scripts Critical Error")
            StopScript
		END IF
	ELSE
		FuncLib_URL = "C:\BZS-FuncLib\MASTER FUNCTIONS LIBRARY.vbs"
		Set run_another_script_fso = CreateObject("Scripting.FileSystemObject")
		Set fso_command = run_another_script_fso.OpenTextFile(FuncLib_URL)
		text_from_the_other_script = fso_command.ReadAll
		fso_command.Close
		Execute text_from_the_other_script
	END IF
END IF
'END FUNCTIONS LIBRARY BLOCK================================================================================================
'
'Do
'
'	BeginDialog Dialog1, 0, 0, 191, 125, "Dialog"
'	  ButtonGroup ButtonPressed
'	    OkButton 135, 10, 50, 15
'	    CancelButton 135, 30, 50, 15
'	  CheckBox 10, 10, 95, 10,  "12 mo", twelve_mo_contact_checkbox
'	  CheckBox 10, 25, 95, 10,  "Appt Letter", appt_letter_checkbox
'	  CheckBox 10, 40, 95, 10,  "NOMI", NOMI_checkbox
'	  CheckBox 10, 55, 95, 10,  "Overdue Baby", overdue_baby_checkbox
'	  CheckBox 10, 70, 95, 10,  "GRH OP CL LEFT FACI", grh_op_checkbox
'	  CheckBox 10, 85, 95, 10,  "Asset Transfer", ass_xfer_checkbox
'	  CheckBox 10, 100, 95, 10, "MA-EPD No Initial Premium", MAEPD_checkbox
'	EndDialog
'
'	Dialog
'	If ButtonPressed = 0 then stopscript
'	
'	disable_StopScript = true
'
'	If twelve_mo_contact_checkbox 	= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - 12 MONTH CONTACT.vbs")
'	If appt_letter_checkbox 		= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - APPOINTMENT LETTER.vbs")
'	If NOMI_checkbox				= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - NOMI.vbs")
'	If overdue_baby_checkbox		= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - OVERDUE BABY.vbs")
'	If grh_op_checkbox 				= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - GRH OP CL LEFT FACI.vbs")
'	If ass_xfer_checkbox 			= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - LTC - ASSET TRANSFER.vbs")
'	If MAEPD_checkbox 				= checked then call run_from_GitHub(script_repository & "/NOTICES/NOTICES - MA-EPD NO INITIAL PREMIUM.vbs")
'
'
'Loop until twelve_mo_contact_checkbox = unchecked


ACTIONS_NEW_JOB_REPORTED_total = 0
ACTIONS_SEND_SVES_total = 0
NOTES_AREP_FORM_RECD_total = 0
NOTES_CRF_RECEIVED_total = 0
NOTES_DECEASED_CLIENT_SUMMARY_total = 0
NOTES_GOOD_CAUSE_CLAIMED_total = 0
NOTES_INCARCERATION_total = 0
NOTES_LTC_1503_total = 0
NOTES_LTC_5181_total = 0
NOTES_PREGNANCY_REPORTED_total = 0

Do

BeginDialog Dialog1, 0, 0, 416, 260, "Changes Reported Dialog"
  ButtonGroup ButtonPressed
    OkButton 310, 235, 50, 15
    CancelButton 365, 235, 50, 15
    PushButton 5, 30, 15, 10, "?"		, ACTIONS_NEW_JOB_REPORTED_help_button
    PushButton 190, 30, 15, 10, "+"		, ACTIONS_NEW_JOB_REPORTED_add_button
    PushButton 210, 30, 15, 10, "-"		, ACTIONS_NEW_JOB_REPORTED_rem_button
    PushButton 5, 45, 15, 10, "?"		, ACTIONS_SEND_SVES_help_button
    PushButton 190, 45, 15, 10, "+"		, ACTIONS_SEND_SVES_add_button
    PushButton 210, 45, 15, 10, "-"		, ACTIONS_SEND_SVES_rem_button
    PushButton 5, 60, 15, 10, "?"		, NOTES_AREP_FORM_RECD_help_button
    PushButton 190, 60, 15, 10, "+"		, NOTES_AREP_FORM_RECD_add_button
    PushButton 210, 60, 15, 10, "-"		, NOTES_AREP_FORM_RECD_rem_button
    PushButton 5, 75, 15, 10, "?"		, NOTES_CRF_RECEIVED_help_button
    PushButton 190, 75, 15, 10, "+"		, NOTES_CRF_RECEIVED_add_button
    PushButton 210, 75, 15, 10, "-"		, NOTES_CRF_RECEIVED_rem_button
    PushButton 5, 90, 15, 10, "?"		, NOTES_DECEASED_CLIENT_SUMMARY_help_button
    PushButton 190, 90, 15, 10, "+"		, NOTES_DECEASED_CLIENT_SUMMARY_add_button
    PushButton 210, 90, 15, 10, "-"		, NOTES_DECEASED_CLIENT_SUMMARY_rem_button
    PushButton 5, 105, 15, 10, "?"		, NOTES_INCARCERATION_help_button
    PushButton 190, 105, 15, 10, "+"	, NOTES_INCARCERATION_add_button
    PushButton 210, 105, 15, 10, "-"	, NOTES_INCARCERATION_rem_button
    PushButton 5, 120, 15, 10, "?"		, NOTES_LTC_1503_help_button
    PushButton 190, 120, 15, 10, "+"	, NOTES_LTC_1503_add_button
    PushButton 210, 120, 15, 10, "-"	, NOTES_LTC_1503_rem_button
    PushButton 5, 135, 15, 10, "?"		, NOTES_LTC_5181_help_button
    PushButton 190, 135, 15, 10, "+"	, NOTES_LTC_5181_add_button
    PushButton 210, 135, 15, 10, "-"	, NOTES_LTC_5181_rem_button
    PushButton 5, 150, 15, 10, "?"		, NOTES_PREGNANCY_REPORTED_help_button
    PushButton 190, 150, 15, 10, "+"	, NOTES_PREGNANCY_REPORTED_add_button
    PushButton 210, 150, 15, 10, "-"	, NOTES_PREGNANCY_REPORTED_rem_button
	
    PushButton 5, 215, 65, 10, "Discovery Mode"	, DISCOVERY_MODE_button
  Text 10, 10, 65, 10, "---name of script---"
  Text 190, 10, 35, 10, "---update---"
  Text 235, 10, 50, 10, "---times-to-run---"
  GroupBox 295, 5, 120, 225, "Notes"
  Text 300, 20, 110, 75, "These are scripts which are designed to process a change reported to the agency. You can use this workflow to select all changes that apply, and all of the affiliated scripts will run one after another. Select scripts with the update buttons. You can run some scripts multiple times."
  Text 300, 100, 110, 25, "You can click the question-mark button to open the instructions for this script in SIR."
  Text 300, 130, 110, 60, "You can click the ''discovery mode'' button to update this dialog by answering basic questions about the change reported: the script will guide you through the available scripts for this change."
  Text 300, 190, 110, 35, "When all the scripts are wrapped up, it will automatically run two scripts: FSET EXEMPTION CHECK and VERIFS NEEDED."
  GroupBox 5, 20, 285, 5, ""
  Text 25, 30, 160, 10, "ACTIONS - NEW JOB REPORTED"
  Text 255, 30, 15, 10, ACTIONS_NEW_JOB_REPORTED_total
  Text 25, 45, 160, 10, "ACTIONS - SEND SVES"
  Text 255, 45, 15, 10, ACTIONS_SEND_SVES_total
  Text 25, 60, 160, 10, "NOTES - AREP FORM REC'D"
  Text 255, 60, 15, 10, NOTES_AREP_FORM_RECD_total
  Text 25, 75, 160, 10, "NOTES - CRF RECEIVED"
  Text 255, 75, 15, 10, NOTES_CRF_RECEIVED_total
  Text 25, 90, 160, 10, "NOTES - DECEASED CLIENT SUMMARY"
  Text 255, 90, 15, 10, NOTES_DECEASED_CLIENT_SUMMARY_total
  Text 25, 105, 160, 10, "NOTES - INCARCERATION"
  Text 255, 105, 15, 10, NOTES_INCARCERATION_total
  Text 25, 120, 160, 10, "NOTES - LTC - 1503"
  Text 255, 120, 15, 10, NOTES_LTC_1503_total
  Text 25, 135, 160, 10, "NOTES - LTC - 5181"
  Text 255, 135, 15, 10, NOTES_LTC_5181_total
  Text 25, 150, 160, 10, "NOTES - PREGNANCY REPORTED"
  Text 255, 150, 15, 10, NOTES_PREGNANCY_REPORTED_total
EndDialog

    Dialog
	cancel_confirmation
	
	'<<<<<<<THIS IS WHERE DISCOVERY MODE SHALL GO!!!!
	If ButtonPressed = DISCOVERY_MODE_button then MsgBox "coming soon!"
	'x = MsgBox ("Is your client reporting a change?", vbYesNoCancel + vbQuestion)

    If ButtonPressed = ACTIONS_NEW_JOB_REPORTED_add_button 			then ACTIONS_NEW_JOB_REPORTED_total = ACTIONS_NEW_JOB_REPORTED_total + 1
    If ButtonPressed = ACTIONS_NEW_JOB_REPORTED_rem_button 			then ACTIONS_NEW_JOB_REPORTED_total = ACTIONS_NEW_JOB_REPORTED_total - 1
	If ButtonPressed = ACTIONS_SEND_SVES_add_button					then ACTIONS_SEND_SVES_total = ACTIONS_SEND_SVES_total + 1
	If ButtonPressed = ACTIONS_SEND_SVES_rem_button					then ACTIONS_SEND_SVES_total = ACTIONS_SEND_SVES_total - 1
	If ButtonPressed = NOTES_AREP_FORM_RECD_add_button				then NOTES_AREP_FORM_RECD_total = NOTES_AREP_FORM_RECD_total + 1
	If ButtonPressed = NOTES_AREP_FORM_RECD_rem_button				then NOTES_AREP_FORM_RECD_total = NOTES_AREP_FORM_RECD_total - 1
	If ButtonPressed = NOTES_CRF_RECEIVED_add_button				then NOTES_CRF_RECEIVED_total = NOTES_CRF_RECEIVED_total + 1
	If ButtonPressed = NOTES_CRF_RECEIVED_rem_button				then NOTES_CRF_RECEIVED_total = NOTES_CRF_RECEIVED_total - 1
	If ButtonPressed = NOTES_DECEASED_CLIENT_SUMMARY_add_button		then NOTES_DECEASED_CLIENT_SUMMARY_total = NOTES_DECEASED_CLIENT_SUMMARY_total + 1
	If ButtonPressed = NOTES_DECEASED_CLIENT_SUMMARY_rem_button		then NOTES_DECEASED_CLIENT_SUMMARY_total = NOTES_DECEASED_CLIENT_SUMMARY_total - 1
	If ButtonPressed = NOTES_INCARCERATION_add_button				then NOTES_INCARCERATION_total = NOTES_INCARCERATION_total + 1
	If ButtonPressed = NOTES_INCARCERATION_rem_button				then NOTES_INCARCERATION_total = NOTES_INCARCERATION_total - 1
	If ButtonPressed = NOTES_LTC_1503_add_button					then NOTES_LTC_1503_total = NOTES_LTC_1503_total + 1
	If ButtonPressed = NOTES_LTC_1503_rem_button					then NOTES_LTC_1503_total = NOTES_LTC_1503_total - 1
	If ButtonPressed = NOTES_LTC_5181_add_button					then NOTES_LTC_5181_total = NOTES_LTC_5181_total + 1
	If ButtonPressed = NOTES_LTC_5181_rem_button					then NOTES_LTC_5181_total = NOTES_LTC_5181_total - 1
	If ButtonPressed = NOTES_PREGNANCY_REPORTED_add_button			then NOTES_PREGNANCY_REPORTED_total = NOTES_PREGNANCY_REPORTED_total + 1
	If ButtonPressed = NOTES_PREGNANCY_REPORTED_rem_button			then NOTES_PREGNANCY_REPORTED_total = NOTES_PREGNANCY_REPORTED_total - 1
	
	If ButtonPressed = ACTIONS_NEW_JOB_REPORTED_help_button			then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/New%20job%20reported.aspx")
	If ButtonPressed = ACTIONS_SEND_SVES_help_button				then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/Send%20SVES.aspx")
	If ButtonPressed = NOTES_AREP_FORM_RECD_help_button				then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/AREP%20Form%20Rec%27d.aspx")
	If ButtonPressed = NOTES_CRF_RECEIVED_help_button				then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/Change%20Report%20Form%20received.aspx")
	If ButtonPressed = NOTES_DECEASED_CLIENT_SUMMARY_help_button	then CreateObject("WScript.Shell").Run("")
	If ButtonPressed = NOTES_INCARCERATION_help_button				then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/Incarceration.aspx")
	If ButtonPressed = NOTES_LTC_1503_help_button					then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/LTC%20-%201503.aspx")
	If ButtonPressed = NOTES_LTC_5181_help_button					then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/LTC%20-%205181.aspx")
	If ButtonPressed = NOTES_PREGNANCY_REPORTED_help_button			then CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/Pregnancy%20Reported.aspx")	
	
    If ACTIONS_NEW_JOB_REPORTED_total 		< 0 then ACTIONS_NEW_JOB_REPORTED_total = 0
	If ACTIONS_SEND_SVES_total				< 0 then ACTIONS_SEND_SVES_total = 0
	If NOTES_AREP_FORM_RECD_total			< 0 then NOTES_AREP_FORM_RECD_total = 0
	If NOTES_CRF_RECEIVED_total				< 0 then NOTES_CRF_RECEIVED_total = 0
	If NOTES_DECEASED_CLIENT_SUMMARY_total	< 0 then NOTES_DECEASED_CLIENT_SUMMARY_total = 0
	If NOTES_GOOD_CAUSE_CLAIMED_total		< 0 then NOTES_GOOD_CAUSE_CLAIMED_total = 0
	If NOTES_INCARCERATION_total			< 0 then NOTES_INCARCERATION_total = 0
	If NOTES_LTC_1503_total					< 0 then NOTES_LTC_1503_total = 0
	If NOTES_LTC_5181_total					< 0 then NOTES_LTC_5181_total = 0
	If NOTES_PREGNANCY_REPORTED_total		< 0 then NOTES_PREGNANCY_REPORTED_total = 0

Loop until ButtonPressed = -1

disable_StopScript = true

If ACTIONS_NEW_JOB_REPORTED_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/ACTIONS/ACTIONS - NEW JOB REPORTED.vbs")
		ACTIONS_NEW_JOB_REPORTED_total = ACTIONS_NEW_JOB_REPORTED_total - 1
	Loop until ACTIONS_NEW_JOB_REPORTED_total <= 0
End if

If ACTIONS_SEND_SVES_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/ACTIONS/ACTIONS - SEND SVES.vbs")
		ACTIONS_SEND_SVES_total = ACTIONS_SEND_SVES_total - 1
	Loop until ACTIONS_SEND_SVES_total <= 0
End if

If NOTES_AREP_FORM_RECD_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - AREP FORM RECEIVED.vbs")
		NOTES_AREP_FORM_RECD_total = NOTES_AREP_FORM_RECD_total - 1
	Loop until NOTES_AREP_FORM_RECD_total <= 0
End if

If NOTES_CRF_RECEIVED_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - CHANGE REPORT FORM RECEIVED.vbs")
		NOTES_CRF_RECEIVED_total = NOTES_CRF_RECEIVED_total - 1
	Loop until NOTES_CRF_RECEIVED_total <= 0
End if

If NOTES_DECEASED_CLIENT_SUMMARY_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - DECEASED CLIENT SUMMARY.vbs")
		NOTES_DECEASED_CLIENT_SUMMARY_total = NOTES_DECEASED_CLIENT_SUMMARY_total - 1
	Loop until NOTES_DECEASED_CLIENT_SUMMARY_total <= 0
End if

If NOTES_INCARCERATION_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - INCARCERATION.vbs")
		NOTES_INCARCERATION_total = NOTES_INCARCERATION_total - 1
	Loop until NOTES_INCARCERATION_total <= 0
End if

If NOTES_LTC_1503_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - LTC - 1503.vbs")
		NOTES_LTC_1503_total = NOTES_LTC_1503_total - 1
	Loop until NOTES_LTC_1503_total <= 0
End if

If NOTES_LTC_5181_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - LTC - 5181.vbs")
		NOTES_LTC_5181_total = NOTES_LTC_5181_total - 1
	Loop until NOTES_LTC_5181_total <= 0
End if

If NOTES_PREGNANCY_REPORTED_total > 0 then
	Do
		call run_from_GitHub(script_repository & "/NOTES/NOTES - PREGNANCY REPORTED.vbs")
		NOTES_PREGNANCY_REPORTED_total = NOTES_PREGNANCY_REPORTED_total - 1
	Loop until NOTES_PREGNANCY_REPORTED_total <= 0
End if


'Dialog