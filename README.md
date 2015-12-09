# Kbase SDK Installation

This Kbase SDK installer users **Oracle VirtualBox** and **Vagrant** to create Kbase SDK virtual machine. It mirrors a folder from the host machine into the virtual machine so that you can develop from your host machine and `build` Kbase modules from inside the virtual machine.

### Instructions for Windows Operating System

 * Download VirtualBox [Download Link](http://download.virtualbox.org/virtualbox/5.0.10/VirtualBox-5.0.10-104061-Win.exe)
 * Double click on the downloaded file (VirtualBox-5.0.10-104061-Win.exe) and follow the menu driven install procedure.
 * Download Vagrant [Download Link](https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.msi)
 * Double click on the downloaded file (vagrant_1.7.4.msi)and follow the menu driven install procedure
 
 `Note: You may have to reboot windows after installing (Only if it is asking you to reboot)`
 
### Instructions for MacOS Operating System

 * Download VirtualBox [Download Link](http://download.virtualbox.org/virtualbox/5.0.10/VirtualBox-5.0.10-104061-OSX.dmg)
 * Double click on the downloaded file (VirtualBox-5.0.10-104061-OSX.dmg) and follow the menu driven install procedure.
 * Download Vagrant [Download Link](https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.dmg)
 * Double click on the downloaded file (vagrant_1.7.4.dmg)and follow the menu driven install procedure.

 

### Instructions for Both MacOS & Windows

After performing OS specific tasks, the following instructions are for both MacOS and Windows.

* Download Kbase SDK Installer [Download Link](https://github.com/url).
* Unzip the downloaded Kbase SDK Installer at a convenient location on your harddisk. The archive will create `KbaseSDK` folder.
* Open a **terminal** and change into `KbaseSDK` folder.
* Type in the following command into the **terminal**


```bash
vagrant up
```
`Note: Installation may take up to 20 minutes depending on the speed of your Internet connection.`

# Post Installation

Once the Installation is done. You can login into the virtual machine with the following command from your `KbaseSDK` folder.

```bash
vagrant ssh
```

Once Logged into the machine, you can test if `kb-sdk` CLI tool works.
```bash
vagrant@vagrant-ubuntu-trusty-64:~$ kb-sdk help

kb-sdk - KBase MOdule BUilder - a developer tool for building and validating KBase modules

usage: kb-sdk <command> [options]

    The available commands are:
        init - Initialize a module in the current directory.
        validate - Validate a module or modules.
        compile - Compile a KIDL file into client and server code
        help - Get help and usage information.
        test - Test a module with local Docker.
        version - Print current version of kb-sdk.

    For help on a specific command, see "kb-sdk help <command>".
    For full usage information, see "kb-sdk help -a".

vagrant@vagrant-ubuntu-trusty-64:~$ 

```

If you see the above message then you have successfully installed Kbase SDK.

# Development Workflow

**TL;DR**
* Login into your virtual machine with command *`vagrant ssh`* from folder `KbaseSDK`.
* `kb-sdk init` inside your `/kb_module` folder inside your virtual machine.
* Edit module files from your **host machine** mirrored at `KbaseSDK/kb_module`.
* `kb-sdk make` from your `/kb_module/<modulename>` folder from inside your virtual machine.

Once the installation is done. The installer creates a folder `KbaseSDK/kb_module` on the host machine. This folder is mirrored inside the virtual machine at `/kb_module`. You can `init` your modules inside the virual machines at `/kb_modules` and edit your files from the host machine at `KbaseSDK/kb_module`. You can `kb-sdk make` from your `/kb_module/<modulename>` folder from inside your virtual machine to `build` your modules.



