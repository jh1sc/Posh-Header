# Posh-Header👨‍💻
- Simple, really quite useful psm1 module to import all local assemblies, as well as some, other winAPI functions!

# Description
 - Make Sure When Using this Module always put this code at the start of your script!
 `iwr -Uri "https://raw.githubusercontent.com/jh1sc/Posh-Header/main/Posh-H.psm1" -OutFile "$env:temp\Posh-H.psm1";ipmo "$env:temp\Posh-H.psm1"`
 `Header`
 
# What Posh-Header offers..💪

#### Get Specfic KeyStroke, ASKS/AsyncKeyStoke 
- Ok, I want to clarify and emphasize, that this is not a key logger
- It looks like a key logger because It uses the same WinApi Function to get the keystroke.
- It doesnt log anything, look for yourself
- I found use in it as normally if you would want to get a keystroke in powershell the whole script interrupted, and stopped, with this method its quick, more reliable, and has many capabilities in what Key you want to see if it was pressed or not

**To use it,** 
`If(ASKS "Key"){code to execute}`
