#! /bin/bash

echo This will uninstall MacPorts and all of the leftovers from MacPorts.

while true
 do
   echo "Are you sure? [Y/n]?"
    read response
    case $(echo ${response:-Y}|tr '[:lower:]' '[:upper:]') in
        Y|YES)
            sudo port -fp uninstall installed
            sudo -s rm -rf \
        /opt/local \
        /Applications/DarwinPorts \
        /Applications/MacPorts \
        /Library/LaunchDaemons/org.macports.* \
        /Library/Receipts/DarwinPorts*.pkg \
        /Library/Receipts/MacPorts*.pkg \
        /Library/StartupItems/DarwinPortsStartup \
        /Library/Tcl/darwinports1.0 \
        /Library/Tcl/macports1.0 \
        ~/.macports
sudo /usr/bin/dscl . -delete "/Users/macports"
sudo dscl . -delete "/Groups/macports"
echo MacPorts has sucessfully been uninstalled from your system. If you want a better package manager, try Homebrew.
            break
            ;;
        N|NO)
            echo "Cancelled."
            exit
            ;;
        *)
            echo "Not an option!"
            ;;
    esac
done
