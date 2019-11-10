# Lab 1 - Installing Windows 7   
# You will download and install PowerShell 7 from Github. Perform
# this task on all virtual machines.

Start-Process -FilePath https://github.com/PowerShell/PowerShell

# Scroll down to the section labeled "Get PowerShell"
# Download the Windows (x64) Preview MSI file.
# Run when prompted.
# Click 'Next' twice.
# Select 'Enable PowerShell Remoting' and click 'Next'
# Click 'Install'
# Click 'Finish'

# PowerShell 7 is now installed.



##  Install Visual Studio Code.
Start-Process -FilePath 'Https://Code.VisualStudio.com/'
# Click 'Download for Windows - Stable Build'
# Click 'Run'
# When prompted :This User installer is not meant to be run..."  Click 'OK'
# Click 'Next'
# Select 'I accept the agreement' and click 'Next'.
# Click 'Next' three times.
# Click 'Install'
# Click 'Finish'

# VSCode is now installed and will launch.

# Configure VSCode for PowerShell 7.
# Perform all tasks in VSCode.
# Open the Extensions by pressing 'CTRL-SHIFT-X'
# In the search bar, type 'PowerShell'
# Look for 'PowerShell' and click 'Install'

# In the extension search bar, type 'Shell Launcher'
# Look for 'Shell Launcher' and click 'Install'

# In the extension search bar, type 'FontSize'
# Look for 'FontSize Shortcuts' and click 'Install'

# Open your settings 'File --> Preferences --> Settings'
# Open the Settings.JSON file by clicking the "Open Settings" icon at the top right of the screen.
# Paste the below code and replace the contents of the Settings.JSON file.
{

    "terminal.integrated.shell.windows": "c:/Program Files/PowerShell/7-preview/pwsh.exe",

    "shellLauncher.shells.windows": [{
            "shell": "c:\\Program Files\\PowerShell\\7-preview\\pwsh.exe",
            "label": "PowerShell Core"
        },
        {
            "shell": "C:\\Windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "label": "Windows PowerShell"
        }
    ],
    "window.zoomLevel": 1,
    "files.autoSave": "afterDelay",
    "files.defaultLanguage": "powershell",
    "powershell.startAutomatically": true,
    "powershell.powerShellExePath": "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe",
    "editor.lineHeight": 0,
    "editor.fontSize": 15,
    "terminal.integrated.fontSize": 13,
    "terminal.integrated.rendererType": "dom"
    
} 

# Close the Settings.JSON file and close the Extensions.

# Configure Keyboard shortcuts to mimic the PowerShell ISE.
# 'File --> Preferences --> Keyboard Shortcuts'

# This first item will allow for the collapse and expansion of regions.
# In the search bar, type 'regions'
# Right click 'Fold All Regions' and select 'Change Keybinding'
# Press 'CTRL M' and then press 'ENTER'  - NOTE: ignore all conflict messages.

# Right click 'unfold All Regions' and select 'Change Keybinding'
# Press 'CTRL N' and then press 'ENTER'  - NOTE: ignore all conflict messages.

# Set the terminal for clearing with CTRL K.
# In the search bar, type 'Terminal'
# Right click 'Terminal:Clear' and select 'Add Keybinding'
# Press 'CTRL K' and then press 'ENTER'  - NOTE: ignore all conflict messages.

# Set the terminal to be able to run the entire active file
# Right click 'Terminal:Run Active File in Active Terminal' and select 'Add Keybinding'
# Press 'F5' and then press 'ENTER'  - NOTE: ignore all conflict messages.

# Set the terminal to be able to run selected text
# Right click 'Terminal:Run Selected Text in Active Terminal' and select 'Add Keybinding'
# Press 'F8' and then press 'ENTER'  - NOTE: ignore all conflict messages.

# Step 6: Add the PowerShell icons to the taskbar.
# Click start and Type 'PowerShell'
# Right click both 'PowerShell' and 'PowerShell ISE'.
# Select 'Pin to Taskbar'.
# Click 'Start'
# Click the 'PowerShell' folder.
# Right click 'PowerShell 7'
# Select 'More --> Pin to Taskbar'
# Click 'Start'
# Click the 'Visual Studio Code' folder.
# Right click 'Visual Studio Code'
# Select 'More --> Pin to Taskbar'

# The PowerShell 7 / VS Code setup is complete.