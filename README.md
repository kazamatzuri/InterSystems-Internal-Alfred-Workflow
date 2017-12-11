InterSystems-Internal-Alfred-Workflow
=====================================

Alfred Workflow for InterSystems internal tools. Not useful to non-InterSystems Employees.

##Installation

###Basic

Click this link: [Download](https://github.com/kazamatzuri/InterSystems-Internal-Alfred-Workflow/blob/master/bin/InterSystems.alfredworkflow?raw=true)

###Advanced

`git clone` this repo, then `make`

##Usage

Provides the following utilities:

* wrc (pass in WRC Number)
* devkey (pass in Devkey)
* prodlog (pass in Prodlog number)
* adhoc (pass in Adhoc number)
* doc (search docs.intersystems.com for string)
* classref (open docs.intersystems.com classref)
* newprodlog (open prodlog creation page)
* iknow (search https://iknow)
* iscperson (search ISCPerson)
* trc (pass in TRC Number)
* ccr (pass in CCR reference)
* devlog (search Devlog for string)
* cls (open class reference [autocompletes]) (currently 2017.2)
* newadhoc (open adhoc creation page)

Feel free to modify and submit a PR.

The `cls` command autocompletes to available classes. It uses a static list generated by a Routine. Currently 2015.1. Can be updated as new versions are released. Here is the code to generate the list.

##Code

	set ns = $namespace

	write "Enter a file name: "
	read filename

	open filename:"WNS"
	use filename

	zn "%SYS"
	set sysRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT Name FROM %Dictionary.ClassDefinition")
	while (sysRS.%Next()) { w sysRS.Name _ ",CACHELIB", ! }

	zn "ENSEMBLE"
	set ensRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT Name FROM %Dictionary.ClassDefinition WHERE Name %STARTSWITH 'Ens'")
	while (ensRS.%Next()) { w ensRS.Name _ ",ENSLIB", ! }

	close filename
	zn ns

##Same code, on one line (copy this into Terminal session)

	set ns = $namespace write "Enter a file name: " read filename open filename:"WNS" use filename zn "%SYS" set sysRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT Name FROM %Dictionary.ClassDefinition") while (sysRS.%Next()) { w sysRS.Name _ ",CACHELIB", ! } zn "ENSEMBLE" set ensRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT Name FROM %Dictionary.ClassDefinition WHERE Name %STARTSWITH 'Ens'") while (ensRS.%Next()) { w ensRS.Name _ ",ENSLIB", ! } close filename zn ns
