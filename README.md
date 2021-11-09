# Installfest :tada:

Follow these instructions to set up your laptop for work in SEI. If you've previously set up a development environment on your computer, you may wish to skip some of these steps; do not do so without first checking with an instructor!

If at any point you are unsure of whether you have done something correctly, ask an instructor. It's important in many cases that we do these steps in order. In general, if you receive no output, the command has executed successfully. (No news is good news.) If you receive output in your terminal that you didn't expect, please notify an instructor.

**The goal of this is not for you to fully understand everything that is being set up on your computer or what all of these tools do!** You should be focused on following along and completing the instructions. If you have any specific questions about anything you do today, we will be happy to answer after Installfest is complete.

## Setting Up

:lock: It's recommended that you're logged in as an administrative user on your machine. You will need access to your computer user's password. 

Since we have not yet configured our shell for GitHub/GHE authentication, we will need to manually download this repository as a zip file, unzip it, then move it into your root folder. 

1. Click the green "Code" button on this repo, and select "Download ZIP".
![Imgur](https://i.imgur.com/jOEXyPc.png)
1. Double click on the downloaded folder, which will likely be called `installfest-master.zip` to unzip it. Click and drag the unzipped folder called `installfest-master` into your user's root folder (shares the same name as your system username). If you're not sure how to access your user's root folder, check out [this article](https://www.cnet.com/tech/computing/how-to-find-your-macs-home-folder-and-add-it-to-finder/).
![Imgur](https://i.imgur.com/CEvFiqJ.png)
1. Open your Terminal application. You can find it in the Applications folder -> Utilties folder. You'll likely want to save it in your Dock. 
1. Type `pwd`. If your terminal opened in `Users/<your username>`, you are in the right spot! Type `cd installfest-master` to navigate into your Installfest folder. 

Be sure that you run all of these scripts from inside the `installfest-master` directory. You must be inside this folder so that the commands below have access to the `scripts` directory.

Some of the installations may require you to restart your Terminal. If so, just restart your Terminal and `cd installfest-master` to navigate back into this folder.

## Mac OS Versions

If you have not yet updated to MacOS Monterey Version 12, do NOT update your OS during the course. Updating your OS may result in some unexpected issues and bugs with the tools that we use. 

If you are on Monterey already, please note that some of the installations may not work correctly yet as software is being updated to the new OS. We will find workarounds for any Monterey related issues. 


#### Note for Linux Users

We support both macOS and Ubuntu (an open-source Linux based OS) at SEI. If you choose
to use Linux, we strongly recommend using  Ubuntu [version 18.04](https://ubuntu.com/about/release-cycle) . We can guide you through the
process of getting that set up on your machine. If you choose to use a different
Linux distribution, or a different version of Ubuntu, the scripts in this repository
will _not_ work, and you will be responsible for configuring your own development
environment. Only choose this option if you're an experienced Linux user and enjoy
troubleshooting.


## Zsh (Shell) Configuration (Mac Only)

macOS ships with utilities that are slightly different from standard Linux tools.
To smooth out _some_ of the differences and customize what we see in the Terminal application, we need to change how macOS loads our
shell (`zsh`) configuration. On Linux, this script will check that you are using
the correct shell.

In your terminal, type:

```bash
  scripts/zsh.sh
```

Then restart your Terminal (quit out of the application completely by pressing `command q` and then restart it), and you should see your changes take effect!

## Command Line Tools/XCode

In order for Homebrew and other tools to work, we'll need to rely on a number of programs that
come pre-installed on Linux. Install these tools **via the terminal** using the
command:

```shell
# macOS ONLY
xcode-select --install
```

If the dialog box below appears, you should click on the `Install` button.

<img width="449"
 alt="cdn_osxdaily_com_wp-content_uploads_2014_02_confirm-install-command-line-tools-mac-os-x_jpg"
 src="https://cloud.githubusercontent.com/assets/388761/23191483/da2ed6c4-f86b-11e6-8f8c-df842736b899.png"
/>

This may require that you run a Software Update before proceeding.

If you see a message similar to the one below, you are all set to continue!

```
xcode-select: error: command line tools are already installed, use "Software Update" to install updates
```

## Homebrew

[Homebrew](https://brew.sh/) is a package manager for macOS that makes installing software and useful tools easy.

If you are on a Linux-based OS, like Ubuntu, you won't use Homebrew, **but
you must still run this script**. Your
system includes a package manager that serves the same purpose. The script below
will automatically detect if you're on Linux, and if you are, it won't install
Homebrew. Instead, it will install a few tools that are needed on Linux for the
rest of Installfest.

Enter the following command into your terminal.

```bash
scripts/homebrew.sh
```

The last script may have displayed some errors. That's probably OK!

Most of these
errors are probably minor, but some might not be. Please wait until one of the
instructors has given you the go-ahead before moving on.

When you're ready to proceed, run:

```bash
scripts/homebrew.sh update
```

>How do I know it worked? Run `brew --version` to see an output.

## Node/NPM

We're going to be installing Node. Node (and its various packages) will be
the foundation of a large part of the course. We will also use Node's associated package manager, `npm`, to download and install some Node modules and make them available across all of our projects.

First go to [Node.js](https://nodejs.org/en/download/) and download the LTS for your operating system.  

After installing Node, restart your terminal and run `cd installfest-master` to navigate back into your Installfest directory. 

Then run: 

```bash
scripts/npm.sh
```

> How do I know it worked? Run `node --version` to see your Node version. 


## VS Code

VS Code is the text editor we will use throughout the course. If you do not already have Visual Studio Code, [download here](https://code.visualstudio.com/download).

**Important**: When done installing, if you are on a Mac, be sure to click and drag VS Code into your Applications folder. If you skip this step, any custom configurations will be lost each time you reopen VS Code.

![Click application and drag to Applications folder](https://i.imgur.com/Cd0B9hW.png)

### Launching VS Code from Terminal

- Open VS Code by clicking on the icon in your dock, OR by opening your search `cmd` + `space` and typing `vscode`.
- To be able to launch VS Code from your terminal: open the Command Palette (⇧⌘P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH.

![install shell commands](https://i.imgur.com/il5eKGh.png)

- You might need to quit terminal _and_ VS Code (`cmd` + `q`) in order for this to take effect.
- Make sure you are `quitting` terminal and VS Code, not just closing the program to install shell commands.

#### ALTERNATIVE: Use the Command Line

1. Open the terminal.
1. Copy and paste the following lines into the terminal:

```bash
cat << EOF >> ~/.zshrc
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
```

#### How do I know it worked?

1. Open terminal.
2. Type the command `code --help` into terminal. If you see some help options, you successfully installed the `code` command.

### Configure VS Code as your default Git commit/diff tool

From the command line, run the following command from any directory: `git config --global core.editor "code --wait"`

> This is especially important if you have previously used other code editors on your system.

### Install VS Code Extensions

VS Code has numerous extensions that make developers' lives easier! We will be installing a few essential ones right now:

In your terminal, run:

```
code --install-extension ./ga-seir-bundle/ga-seir-bundle-0.0.1.vsix
```

If your installations were a success, you will see a message in terminal that looks like this:

![successful extension bundle install](https://i.imgur.com/0DP1j0W.png)

> Quit your instance of VS Code and reopen for the newly-installed extensions to take effect!



## Chrome

If you do not already have Google Chrome, [download here](https://www.google.com/chrome/browser/desktop/index.html), install it, and set it as your
default browser.


## Python

This script will install the Python language onto your computer. If you have a Mac, you may have a certain version of Python installed, but we will be making sure everyone is on the same version.

We will also be installing a package that will help us install other Python things called `pip`.

In your terminal, run:

```
scripts/python.sh
```

Shut down your terminal and navigate back to the installfest repo before moving on.

> How do I know it worked? Run `python3 --version` to see an output. 

## GitHub and Initial Setup

If you haven't done so already, go to [GitHub](http://www.github.com) and create
an account.

**IMPORTANT**: be sure to write down your username and password somewhere, since
we'll be using these credentials later.

Next, go to [GitHub Enterprise](https://git.generalassemb.ly) and create an account. It is recommended that you use the same username, email address, and password for both accounts. GitHub Enterprise will be the source of your learning material throughout SEI, while your personal Github will be where you showcase your projects.

## Git

Run the command below in your terminal.
**This script should be run from the root of this git-install repository.**

```bash
  scripts/git.sh
```

The script will prompt you for some information

1.  Provide your GitHub username
2.  Provide your GitHub email (email you signed up for your account with)
3.  When prompted, log into GitHub.com, go to [https://github.com/settings/ssh](https://github.com/settings/ssh)

4.  Click the `New SSH key` button at the top right of the page

5.  Enter a title for your SSH key (you can call it whatever you want)

6.  paste in your SSH key. It should be copied to your clipboard already!

    _Help! My SSH key is no longer copied to my clipboard_ (select your OS then run the below command in terminal)
    <details>
    <summary>macOS</summary>

`pbcopy < ~/.ssh/id_rsa.pub`

  </details>

  <details>
  <summary>Linux</summary>

`xclip -selection clipboard < ~/.ssh/id_rsa.pub`

  </details>

7. Click the `Add SSH key` button

8. In your terminal, press `[Enter]` to continue

   If you get a prompt along the lines of

   ```bash
   The authenticity of host 'github.com (xxx.xxx.xxx.xxx)'... can\'t be established.
   RSA key fingerprint is XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX.
   Are you sure you want to continue connecting (yes/no)?
   ```

   Just type 'yes'. If everything's working, you should get a response like the
   following:

   ```bash
   Hi <your_username>! You\'ve successfully authenticated, but GitHub does not provide shell access.
   ```

9. Next, log into git.generalassemb.ly, go to [https://git.generalassemb.ly/settings/keys](https://git.generalassemb.ly/settings/keys),
   and paste in the same SSH key.

## Congrats! :tada:

![](https://media.giphy.com/media/ag3PWAeHrCdWV0tlkD/giphy.gif)

That was a lot of setup, but the time we invested today will pay off with smooth sailing throughout the course, as far as installations and environmental setup goes! Thanks for all your hard work, and congrats on getting your machine ready for SEIR! 
