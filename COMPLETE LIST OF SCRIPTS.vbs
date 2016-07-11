'THIS SCRIPT DOES NOT REQUIRE A STATS BLOCK SINCE IT'S PURELY INFORMATIONAL

''LOADING FUNCTIONS LIBRARY FROM GITHUB REPOSITORY===========================================================================
'IF IsEmpty(FuncLib_URL) = TRUE THEN	'Shouldn't load FuncLib if it already loaded once
'	IF run_locally = FALSE or run_locally = "" THEN	   'If the scripts are set to run locally, it skips this and uses an FSO below.
'		IF use_master_branch = TRUE THEN			   'If the default_directory is C:\DHS-MAXIS-Scripts\Script Files, you're probably a scriptwriter and should use the master branch.
'			FuncLib_URL = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/master/MASTER%20FUNCTIONS%20LIBRARY.vbs"
'		Else											'Everyone else should use the release branch.
'			FuncLib_URL = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/RELEASE/MASTER%20FUNCTIONS%20LIBRARY.vbs"
'		End if
'		SET req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a FuncLib_URL
'		req.open "GET", FuncLib_URL, FALSE							'Attempts to open the FuncLib_URL
'		req.send													'Sends request
'		IF req.Status = 200 THEN									'200 means great success
'			Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
'			Execute req.responseText								'Executes the script code
'		ELSE														'Error message
'			critical_error_msgbox = MsgBox ("Something has gone wrong. The Functions Library code stored on GitHub was not able to be reached." & vbNewLine & vbNewLine &_
'                                            "FuncLib URL: " & FuncLib_URL & vbNewLine & vbNewLine &_
'                                            "The script has stopped. Please check your Internet connection. Consult a scripts administrator with any questions.", _
'                                            vbOKonly + vbCritical, "BlueZone Scripts Critical Error")
'            StopScript
'		END IF
'	ELSE
'		FuncLib_URL = "C:\BZS-FuncLib\MASTER FUNCTIONS LIBRARY.vbs"
'		Set run_another_script_fso = CreateObject("Scripting.FileSystemObject")
'		Set fso_command = run_another_script_fso.OpenTextFile(FuncLib_URL)
'		text_from_the_other_script = fso_command.ReadAll
'		fso_command.Close
'		Execute text_from_the_other_script
'	END IF
'END IF
''END FUNCTIONS LIBRARY BLOCK================================================================================================



class script_bowie

    'Stuff the user indicates
	public script_name             	'The familiar name of the script (file name without file extension or category, and using familiar case, script_num)
	public description             	'The description of the script
	public button                  	'A variable to store the actual results of ButtonPressed (used by much of the script functionality, script_num)
	public SIR_instructions_button	'A variable to store the actual results of ButtonPressed (used by much of the script functionality, script_num)
    public category               	'The script category (ACTIONS/BULK/etc, script_num)
	public workflows               	'The script workflows associated with this script (Changes Reported, Applications, etc, script_num)
    public subcategory				'An array of all subcategories a script might exist in, such as "LTC" or "A-F"
	public release_date				'This allows the user to indicate when the script goes live (controls NEW!!! messaging, script_num)
    
    'Details the menus will figure out (does not need to be explicitly declared, script_num)
    public button_plus_increment	'Workflow scripts use a special increment for buttons (adding or subtracting from total times to run, script_num). This is the add button.
	public button_minus_increment	'Workflow scripts use a special increment for buttons (adding or subtracting from total times to run, script_num). This is the minus button.
	public total_times_to_run		'A variable for the total times the script should run

    'Details the class itself figures out
	public property get script_URL
		If run_locally = true then
			script_repository = "C:\DHS-MAXIS-Scripts\Script Files\"
			script_URL = script_repository & ucase(category, script_num) & "\" & ucase(category & " - " & script_name, script_num) & ".vbs"
		Else
        	If script_repository = "" then script_repository = "https://raw.githubusercontent.com/MN-Script-Team/DHS-MAXIS-Scripts/master/Script%20Files/"    'Assumes we're scriptwriters
        	script_URL = script_repository & ucase(category, script_num) & "/" & replace(ucase(category & "%20-%20" & script_name, script_num) & ".vbs", " ", "%20")
		End if
    end property
    
'    public property get SIR_instructions_URL 'The instructions URL in SIR
'        SIR_instructions_URL = "https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/Script%20Instructions%20Wiki/" & replace(ucase(script_name, script_num) & ".aspx", " ", "%20")
'    end property

end class

'INSTRUCTIONS: simply add your new script below. Scripts are listed in alphabetical order first by category, then by script name. Copy a block of code from above and paste your script info in. The function does the rest.


ReDim script_array(9, 0)

script_name 					= 0
script_description 				= 1
script_category					= 2
script_workflows				= 3
script_subcategory				= 4
script_release_date				= 5
script_URL						= 6
script_SIR_instructions_URL		= 7
script_button					= 8
script_SIR_instructions_button	= 9

'ACTIONS SCRIPTS=====================================================================================================================================

script_num = 0
'ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "ABAWD Banked Months FIATer"																		'Script name
script_array(script_description, script_num) 			= "FIATS SNAP eligibility, income, and deductions for HH members using banked months."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("ABAWD")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ABAWD FSET Exemption Check"																		'Script name
script_array(script_description, script_num) 			= "Double checks a case to see if any possible ABAWD/FSET exemptions exist."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("ABAWD")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "ABAWD Screening Tool"
script_array(script_description, script_num)			= "A tool to walk through a screening to determine if client is ABAWD."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("ABAWD")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "BILS Updater"
script_array(script_description, script_num)			= "Updates a BILS panel with reoccurring or actual BILS received."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Check EDRS"
script_array(script_description, script_num)			= "Checks EDRS for HH members with disqualifications on a case."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "FSET Sanction"
script_array(script_description, script_num)			= "Updates the WREG panel, and case notes when imposing or resolving a FSET sanction."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "HG Supplement"
script_array(script_description, script_num)			= "Issues a housing grant in MONY/CHCK for cases that should have been issued in prior months."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #04/25/2016#


script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "LTC - Spousal Allocation FIATer"
script_array(script_description, script_num)			= "FIATs a spousal allocation across a budget period."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1									'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "LTC - ICF-DD Deduction FIATer"																			'Script name
script_array(script_description, script_num) 			= "FIATs earned income and deductions across a budget period."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #05/23/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "MA-EPD EI FIAT"
script_array(script_description, script_num)			= "FIATs MA-EPD earned income (JOBS income, script_num) to be even across an entire budget period."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "New Job Reported"
script_array(script_description, script_num)			= "Creates a JOBS panel, CASE/NOTE and TIKL when a new job is reported. Use the DAIL scrubber for new hire DAILs."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "PA Verif Request"
script_array(script_description, script_num)			= "Creates a Word document with PA benefit totals for other agencies to determine client benefits."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Paystubs Received"
script_array(script_description, script_num)			= "Enter in pay stubs, and puts it on JOBS (both retro & pro if applicable, script_num), as well as the PIC and HC pop-up, and case note."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Shelter Expense Verif Received"
script_array(script_description, script_num)			= "Enter shelter expense/address information in a dialog and the script updates SHEL, HEST, and ADDR and case notes."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Send SVES"
script_array(script_description, script_num)			= "Sends a SVES/QURY."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Transfer Case"
script_array(script_description, script_num)			= "SPEC/XFERs a case, and can send a client memo. For in-agency as well as out-of-county XFERs."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "TYMA TIKLer"
script_array(script_description, script_num)			= "TIKLS for TYMA report forms to be sent."
script_array(script_category, script_num)               = "ACTIONS"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #02/22/2016#











'BULK SCRIPTS=====================================================================================================================================

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "Address Report"																		'Script name
script_array(script_description, script_num) 			= "Creates a list of all addresses from a caseload(or entire county, script_num)."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "Banked Months Report"																		'Script name
script_array(script_description, script_num) 			= "Creates a month specific report of banked months used, also checks these cases to confirm banked month use and creates a rejected report."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #04/25/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "CASE NOTE from List"																		'Script name
script_array(script_description, script_num) 			= "Creates the same case note on cases listed in REPT/ACTV, manually entered, or from an Excel spreadsheet of your choice."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Case Transfer"																		'Script name
script_array(script_description, script_num) 			= "Searches caseload(s, script_num) by selected parameters. Transfers a specified number of those cases to another worker. Creates list of these cases."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "CEI Premium Noter"
script_array(script_description, script_num)				= "Case notes recurring CEI premiums on multiple cases simultaneously."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Check SNAP for GA RCA"
script_array(script_description, script_num) 			= "Compares the amount of GA and RCA FIAT'd into SNAP and creates a list of the results."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "COLA Auto approved Dail Noter"
script_array(script_description, script_num)				= "Case notes all cases on DAIL/DAIL with Auto-approved COLA message, creates list of these messages, deletes the DAIL."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "DAIL Report"
script_array(script_description, script_num) 			= "Pulls a list of DAILS in DAIL/DAIL into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Find MAEPD MEDI CEI"
script_array(script_description, script_num) 			= "Creates a list of cases and clients active on MA-EPD and Medicare Part B that are eligible for Part B reimbursement."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Find Panel Update Date"
script_array(script_description, script_num) 			= "Creates a list of cases from a caseload(s, script_num) showing when selected panels have been updated."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Housing Grant Exemption Finder"
script_array(script_description, script_num) 			= "Creates a list the rolling 12 months of housing grant issuances for MFIP recipients who've met an exemption."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "INAC Scrubber"
script_array(script_description, script_num)				= "Checks cases on REPT/INAC (for criteria see SIR, script_num) case notes if passes criteria, and transfers if agency uses closed-file worker number. "
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "LTC-GRH List Generator"
script_array(script_description, script_num) 			= "Creates a list of FACIs, AREPs, and waiver types assigned to the various cases in a caseload(s, script_num)."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MAGI Non MAGI Report"
script_array(script_description, script_num) 			= "Creates a list of cases and clients active on health care in MAXIS by MAGI/Non-MAGI."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "MEMO from List"
script_array(script_description, script_num)				= "Creates the same MEMO on cases listed in REPT/ACTV, manually entered, or from an Excel spreadsheet of your choice."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Non-MAGI HC Info"
script_array(script_description, script_num) 			= "Creates a list of cases with non-MAGI HC/PDED information."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-ACTV List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/ACTV into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-ARST List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/ARST into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-EOMC List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/EOMC into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-GRMR List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/GRMR into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-IEVC LIST"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/IEVC into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-INAC List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/INAC into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-MAMS List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/MAMS into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-MFCM List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/MFCM into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-MONT List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/MONT into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-MRSR List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/MRSR into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-PND1 List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/PND1 into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-PND2 List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/PND2 into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-REVS List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/REVS into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-REVW List"
script_array(script_description, script_num) 			= "Pulls a list of cases in REPT/REVW into an Excel spreadsheet."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Returned Mail"
script_array(script_description, script_num)				= "Case notes that returned mail (without a forwarding address, script_num) was received for up to 60 cases, TIKLs for 10-day return."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "REVS Scrubber"
script_array(script_description, script_num)				= "Sends appointment letters to all interview-requiring REVS cases, and creates a spreadsheet of when each appointment is."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "REVW-MONT Closures"
script_array(script_description, script_num)				= "Case notes all cases on REPT/REVW or REPT/MONT that are closing for missing or incomplete CAF/HRF/CSR/HC ER."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SWKR List Generator"
script_array(script_description, script_num) 			= "Creates a list of SWKRs assigned to the various cases in a caseload(s, script_num)."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("REPORTS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Targeted SNAP Review Selection"
script_array(script_description, script_num)				= "Creates a list of SNAP cases meeting review criteria and selects a random sample for review."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "TIKL from List"
script_array(script_description, script_num)				= "Creates the same TIKL on cases listed in REPT/ACTV, manually entered, or from an Excel spreadsheet of your choice."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Update EOMC List"
script_array(script_description, script_num)				= "Updates a saved REPT/EOMC excel file from previous month with current case status."
script_array(script_category, script_num)               = "BULK"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#











'DAIL SCRIPTS=====================================================================================================================================

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ABAWD FSET Exemption Check"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Affiliated Case Lookup"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "BNDX Scrubber"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Citizenship Verified"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "CS Reported New Employer"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "CSES Processing"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "DISA Message"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "FMED Deduction"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "LTC - Remedial Care"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "New Hire NDNH"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "New Hire"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SDX Info Has Been Stored"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Send NOMI"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Student Income"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "TPQY Response"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "TYMA Scrubber"																		'Script name
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "DAIL"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#












'NAV SCRIPTS=====================================================================================================================================

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "CASE-CURR"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "CASE-NOTE"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "DAIL-DAIL"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "DAIL-WRIT"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-DWP"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-EMER"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-FS"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-GA"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-GRH"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-HC"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-MFIP"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ELIG-MSA"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Find MAXIS case in MMIS"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Find MMIS PMI in MAXIS"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "PERS"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "POLI-TEMP"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-ACTV - Bottom"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-ACTV"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-INAC"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-MFCM"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-MONT"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-PND1"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-PND2"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-REVW"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "REPT-USER"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SELF"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SPEC-MEMO"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SPEC-WCOM"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SPEC-XFER"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-ACCT"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-ADDR"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-AREP"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-JOBS"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-MEMB"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-MONT"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-PNLP"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-PROG"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-REVW"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "STAT-UNEA"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "View INFC"
script_array(script_description, script_num) 			= ""
script_array(script_category, script_num)               = "NAV"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#












'NOTES SCRIPTS=====================================================================================================================================


script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Application Received"																		'Script name
script_array(script_description, script_num) 			= "Template for documenting details about an application recevied."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1						'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Approved programs"																		'Script name
script_array(script_description, script_num) 			= "Template for when you approve a client's programs."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "AREP Form Received"
script_array(script_description, script_num)				= "Template for when you receive an Authorized Representative (AREP, script_num) form."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Burial Assets"
script_array(script_description, script_num)				= "Template for burial assets."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "CAF"
script_array(script_description, script_num)				= "Template for when you're processing a CAF. Works for intake as well as recertification and reapplication.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Change Report Form Received"
script_array(script_description, script_num)				= "Template for case noting information reported from a Change Report Form."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Change Reported"
script_array(script_description, script_num)				= "Template for case noting HHLD Comp or Baby Born being reported. **More changes to be added in the future**"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Citizenship-Identity Verified"
script_array(script_description, script_num)				= "Template for documenting citizenship/identity status for a case."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Client Contact"
script_array(script_description, script_num)				= "Template for documenting client contact, either from or to a client."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Client Transportation Costs"
script_array(script_description, script_num)				= "Template for documenting client transportation costs."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Closed Programs"
script_array(script_description, script_num)				= "Template for indicating which programs are closing, and when. Also case notes intake/REIN dates based on various selections."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "Combined AR"
script_array(script_description, script_num)				= "Template for the Combined Annual Renewal.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "County Burial Application"
script_array(script_description, script_num)				= "Template for the County Burial Application.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)				= "CSR"
script_array(script_description, script_num)				= "Template for the Combined Six-month Report (CSR, script_num).*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "Deceased Client Summary"																		'Script name
script_array(script_description, script_num) 			= "Adds details about a deceased client to a CASE/NOTE."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #04/25/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Denied Programs"																		'Script name
script_array(script_description, script_num) 			= "Template for indicating which programs you've denied, and when. Also case notes intake/REIN dates based on various selections."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Documents Received"
script_array(script_description, script_num) 			= "Template for case noting information about documents received."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Drug Felon"
script_array(script_description, script_num) 			= "Template for noting drug felon info."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "DWP Budget"
script_array(script_description, script_num) 			= "Template for noting DWP budgets."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")  '<<Temporarily removing first alpha split, will rebuild using function to auto-alpha-split, VKC 06/16/2016
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "EDRS DISQ Match Found"
script_array(script_description, script_num) 			= "Template for noting the action steps when a SNAP recipient has an eDRS DISQ per TE02.08.127."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Emergency"
script_array(script_description, script_num) 			= "Template for EA/EGA applications.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Employment Plan or Status Update"
script_array(script_description, script_num) 			= "Template for case noting an employment plan or status update for family cash cases."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "EVF Received"
script_array(script_description, script_num) 			= "Template for noting information about an employment verification received by the agency."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "ES Referral"
script_array(script_description, script_num) 			= "Template for sending an MFIP or DWP referral to employment services."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Expedited Determination"
script_array(script_description, script_num) 			= "Template for noting detail about how expedited was determined for a case."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Expedited Screening"
script_array(script_description, script_num) 			= "Template for screening a client for expedited status."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Explanation of Income Budgeted"
script_array(script_description, script_num) 			= "Template for explaining the income budgeted for a case."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Foster Care HCAPP"
script_array(script_description, script_num) 			= "Template for noting foster care HCAPP info."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Foster Care Review"
script_array(script_description, script_num) 			= "Template for noting foster care review info."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Fraud Info"
script_array(script_description, script_num) 			= "Template for noting fraud info."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "Good Cause Claimed"
script_array(script_description, script_num)				= "Template for requests of good cause to not receive child support."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Good Cause Results"
script_array(script_description, script_num)				= "Template for Good Cause results for determination or renewal.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "GRH - HRF"
script_array(script_description, script_num)				= "Template for GRH HRFs. Case must be post-pay.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "HC ICAMA"
script_array(script_description, script_num)			= "Template for HC Interstate Compact on Adoption and Medical Assistance (HC ICAMA, script_num)."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)			= #02/22/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "HC Renewal"
script_array(script_description, script_num)				= "Template for HC renewals.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "HCAPP"
script_array(script_description, script_num)				= "Template for HCAPPs.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "HRF"
script_array(script_description, script_num)				= "Template for HRFs (for GRH, use the ''GRH - HRF'' script, script_num).*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "IEVS Notice Received"
script_array(script_description, script_num)				= "Template to case note when a IEVS notice is returned."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Incarceration"
script_array(script_description, script_num)				= "Template to note details of an incarceration, and also updates STAT/FACI if necessary."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Interview Completed"
script_array(script_description, script_num)				= "Template to case note an interview being completed but no stat panels updated."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Interview No Show"
script_array(script_description, script_num)				= "Template for case noting a client's no-showing their in-office or phone appointment."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "Medical Opinion Form Received"
script_array(script_description, script_num)				= "Template for case noting information about a Medical Opinion Form."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MFIP Sanction Cured"
script_array(script_description, script_num)				= "Template for noting the curing of an MFIP sanction."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MFIP Sanction And DWP Disqualification"
script_array(script_description, script_num)				= "Template for MFIP sanctions and DWP disqualifications, both CS and ES."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MFIP to SNAP Transition"
script_array(script_description, script_num)				= "Template for noting when closing MFIP and opening SNAP."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MSQ"
script_array(script_description, script_num)				= "Template for noting Medical Service Questionaires (MSQ, script_num)."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MTAF"
script_array(script_description, script_num)				= "Template for the MN Transition Application form (MTAF, script_num)."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "OHP Received"
script_array(script_description, script_num)				= "Template for noting Out of Home Placement (OHP, script_num)."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Overpayment"
script_array(script_description, script_num)				= "Template for noting basic information about overpayments."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Pregnancy Reported"
script_array(script_description, script_num)				= "Template for case noting a pregnancy. This script can update STAT/PREG."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Proof of Relationship"
script_array(script_description, script_num)				= "Template for documenting proof of relationship between a member 01 and someone else in the household."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "REIN Progs"
script_array(script_description, script_num)				= "Template for noting program reinstatement information."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Returned Mail Received"
script_array(script_description, script_num)				= "Template for noting Returned Mail Received information."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Significant Change"
script_array(script_description, script_num)				= "Template for noting Significant Change information."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "SNAP Case Review"
script_array(script_description, script_num)				= "Template for SNAP reviewers to use that will case note the status SNAP quality review."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Submit Case for SNAP Review"
script_array(script_description, script_num)				= "Template for when a worker sends a case to be reviewed by a supervisor or coworker."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Verifications Needed"
script_array(script_description, script_num)				= "Template for when verifications are needed (enters each verification clearly, script_num)."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

'NOTES subcategories (placing them here to be sure buttons go in right place, script_num)-------------------------------------------------------------------------------------

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "LEP - EMA"
script_array(script_description, script_num)				= "Template for EMA applications."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LEP")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "LEP - SAVE"
script_array(script_description, script_num)				= "Template for the SAVE system for verifying immigration status."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LEP")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "LEP - Sponsor Income"
script_array(script_description, script_num)				= "Template for the sponsor income deeming calculation (it will also help calculate it for you, script_num)."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LEP")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 				= "LTC - 1503"
script_array(script_description, script_num)				= "Template for processing DHS-1503."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - 5181"
script_array(script_description, script_num)				= "Template for processing DHS-5181."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - Application Received"
script_array(script_description, script_num)				= "Template for initial details of a LTC application.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - Asset Assessment"
script_array(script_description, script_num)				= "Template for the LTC asset assessment. Will enter both person and case notes if desired."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - COLA Summary"
script_array(script_description, script_num)				= "Template to summarize actions for the changes due to COLA.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - Intake Approval"
script_array(script_description, script_num)				= "Template for use when approving a LTC intake.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - MA Approval"
script_array(script_description, script_num)				= "Template for approving LTC MA (can be used for changes, initial application, or recertification, script_num).*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - Renewal"
script_array(script_description, script_num)				= "Template for LTC renewals.*"
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)				'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie			'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 				= "LTC - Transfer Penalty"
script_array(script_description, script_num)				= "Template for noting a transfer penalty."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("LTC")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MNSure - Documents Requested"
script_array(script_description, script_num)				= "Template for when MNsure documents have been requested."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)			'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "MNSure Retro HC Application"
script_array(script_description, script_num)				= "Template for when MNsure retro HC has been requested."
script_array(script_category, script_num)               = "NOTES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#











'NOTICES SCRIPTS=====================================================================================================================================

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "12 Month Contact"																		'Script name
script_array(script_description, script_num) 			= "Sends a MEMO to the client of their reporting responsibilities (required for SNAP 2-yr certifications, per POLI/TEMP TE02.08.165, script_num)."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1									'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Appointment Letter"																		'Script name
script_array(script_description, script_num) 			= "Sends a MEMO containing the appointment letter (with text from POLI/TEMP TE02.05.15, script_num)."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1									'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Eligibility Notifier"																		'Script name
script_array(script_description, script_num) 			= "Sends a MEMO informing client of possible program eligibility for SNAP, MA, MSP, MNsure or CASH."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "GRH OP CL LEFT FACI"
script_array(script_description, script_num)			= "Sends a MEMO to a facility indicating that an overpayment is due because a client left."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "LTC - Asset Transfer"
script_array(script_description, script_num)			= "Sends a MEMO to a LTC client regarding asset transfers. "
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "MA Inmate Application WCOM"
script_array(script_description, script_num)			= "Sends a WCOM on a MA notice for Inmate Applications"
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "MA-EPD No Initial Premium"
script_array(script_description, script_num)			= "Sends a WCOM on a denial for no initial MA-EPD premium."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Method B WCOM"													'needs spaces to generate button width properly.
script_array(script_description, script_num)			= "Makes detailed WCOM regarding spenddown vs. recipient amount for method B HC cases."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "MFIP Orientation"
script_array(script_description, script_num)			= "Sends a MEMO to a client regarding MFIP orientation."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "MNsure Memo"
script_array(script_description, script_num)			= "Sends a MEMO to a client regarding MNsure."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "NOMI"
script_array(script_description, script_num)			= "Sends the SNAP notice of missed interview (NOMI, script_num) letter, following rules set out in POLI/TEMP TE02.05.15."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Overdue Baby"
script_array(script_description, script_num)			= "Sends a MEMO informing client that they need to report information regarding the status of pregnancy, within 10 days or their case may close."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "SNAP E and T Letter"
script_array(script_description, script_num)			= "Sends a SPEC/LETR informing client that they have an Employment and Training appointment."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Verifications Still Needed"
script_array(script_description, script_num)			= "Creates a Word document informing client of a list of verifications that are still required."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)			= #04/25/2016#



'-------------------------------------------------------------------------------------------------------------------------SNAP WCOMS LISTS
'Resetting the variable
script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)
'Set script_array(script_num, script_num) = new script_bowie
script_array(script_name, script_num) 			= "ABAWD with Child in HH WCOM"'needs spaces to generate button width properly.																'Script name
script_array(script_description, script_num) 			= "Adds a WCOM to a notice for an ABAWD adult receiving child under 18 exemption."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("SNAP WCOMS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Banked Month WCOMS"
script_array(script_description, script_num) 			= "Adds various WCOMS to a notice for regarding banked month approvals/closure."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("SNAP WCOMS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Duplicate Assistance WCOM"
script_array(script_description, script_num) 			= "Adds a WCOM to a notice for duplicate assistance explaining why the client was ineligible."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("SNAP WCOMS")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Postponed WREG Verifs"
script_array(script_description, script_num) 			= "Sends a WCOM informing the client of postponed verifications that MAXIS won't add to notice correctly by itself."
script_array(script_category, script_num)               = "NOTICES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("SNAP WCOMS")
script_array(script_release_date, script_num)           = #10/01/2000#













'UTILITIES SCRIPTS=====================================================================================================================================

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Banked Month Database Updater"
script_array(script_description, script_num) 			= "Updates cases in the banked month database with actual MAXIS status."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Copy CASE NOTE Elsewhere"
script_array(script_description, script_num) 			= "Copies a CASE/NOTE to either a claims note or a SPEC/MEMO."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #06/27/2016#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num)			= "Copy Panels to Word"
script_array(script_description, script_num)			= "Copies MAXIS panels to Word en masse for a case for easier review."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Info"
script_array(script_description, script_num) 			= "Displays information about your BlueZone Scripts installation."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Move Production Screen to Inquiry"
script_array(script_description, script_num) 			= "Moves a screen from MAXIS prouduction mode to MAXIS inquiry."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Phone Number or Name Look Up"
script_array(script_description, script_num) 			= "Checks every case on REPT screens to find a case number when you have a phone number. *OR* Searches for a specific case on multiple REPT screens by last name."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "POLI TEMP List"
script_array(script_description, script_num) 			= "Creates a list of current POLI/TEMP topics, TEMP reference and revised date."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "PRISM Screen Finder"
script_array(script_description, script_num) 			= "Navigates to popular PRISM screens. The navigation window stays open until user closes it."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Training Case Creator"
script_array(script_description, script_num) 			= "Creates training case scenarios en masse and XFERs them to workers."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

script_num = script_num + 1								'Increment by one
ReDim Preserve script_array(9, script_num)		'Resets the array to add one more element to it
'Set script_array(script_num, script_num) = new script_bowie		'Set this array element to be a new script_bowie. Script details below...
script_array(script_name, script_num) 			= "Update Worker Signature"
script_array(script_description, script_num) 			= "Sets or updates the default worker signature for this user."
script_array(script_category, script_num)               = "UTILITIES"
script_array(script_workflows, script_num)              = ""
script_array(script_subcategory, script_num)            = array("")
script_array(script_release_date, script_num)           = #10/01/2000#

total_number_of_scripts = script_num
MsgBox "hit"