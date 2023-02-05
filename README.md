# Posh-Header👨‍💻
- Simple, really quite useful psm1 module to import all local assemblies, as well as some, other winAPI functions!

# Description
 - Make Sure When Using this Module always put this code at the start of your script!
 
 `iwr -Uri "https://raw.githubusercontent.com/jh1sc/Posh-Header/main/Posh-H.psm1" -OutFile "$env:temp\Posh-H.psm1"`
 
 `ipmo "$env:temp\Posh-H.psm1";Header`

 
# What Posh-Header offers..💪

### Get Specfic KeyStroke, ASKS/AsyncKeyStoke 
- Ok, I want to clarify and emphasize, that this is not a key logger
- It looks like a key logger because It uses the same WinApi Function to get the keystroke.
- It doesnt log anything, look for yourself
- I found use in it as normally if you would want to get a keystroke in powershell the whole script interrupted, and stopped, with this method its quick, more reliable, and has many capabilities in what Key you want to see if it was pressed or not

**To use it,** 
`If(ASKS "Key"){code to execute}`

*Tip*: To get the entire list of usable keys, run this command, all the usable keys are written with the heading 'name'

`[System.Windows.Forms.Keys] | get-member -static`


### Set PoSh Console Font
- Simply Sets the font for powershell, not really, or not too practical in most scenarios
- however, it is mostly used for the aesthetics of a PoSh Script
- all infomation on this is at https://github.com/jh1sc/Powershell-SetFont  a previous module I had made.

**To use it,** 
`Set-Font FontIndex FontWidth FontHeight FontFamily FontWeight FaceName`

**Example Fonts**: 

`FontIndex  : 0
FontWidth  : 6
FontHeight : 12
FontFamily : 54
FontWeight : 400
FaceName   : Consolas`




*Tip*: To get the some examples go to the github link and run the modules and commands to get your own set-font for what ever needs





