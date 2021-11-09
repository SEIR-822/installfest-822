# Installfest

Follow these instructions to set up your laptop for work in SEI. If you've previously set up a development environment on your computer, you may wish to skip some of these steps; do not do so without first checking with an instructor!

If at any point you are unsure of whether you have done something correctly, ask an instructor. It's important in many cases that we do these steps in order. In general, if you receive no output, the command has executed successfully. (No news is good news.) If you receive output in your terminal that you didn't expect, please notify an instructor.

**The goal of this is not for you to fully understand everything that is being set up on your computer or what all of these tools do!** You should be focused on following along and completing the instructions. If you have any specific questions about anything you do today, we will be happy to answer after Installfest is complete.

Be sure that you run all of these scripts from inside the `installfest` directory. You must be inside this folder so that the commands below have access to the `scripts` directory.

#### Note for Linux Users

We support both macOS and Ubuntu (an open-source Linux based OS) at SEI. If you choose
to use Linux, we strongly recommend using the latest Ubuntu [LTS](https://ubuntu.com/about/release-cycle) (currently 18.04). We can guide you through the
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

## Node/NPM

We're going to be installing Node. Node (and its various packages) will be
the foundation of a large part of the course. We will also use Node's associated package manager, `npm`, to download and install some Node modules and make them available across all of our projects.

```bash
scripts/npm.sh
```

<!-- Restart needed between Node and NPM install? -->

Restart your terminal for the installation to take effect.

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

### Configure VS Code Settings

Code formatting done well makes your code easy to read and understand, and also looks professional -- all things we want! Developing good habits early on to format as you write is important, but luckily VS Code has some great built-in tools to make formatting with your new extensions easier and more automatic.

1.  **Open settings.json**: In the navigation menu, go to `View` -> `Command Palette`, or press `command` + `shift` + `p` to open your Command Palette. Type `Open Settings`, then select `Preferences: Open Settings (JSON)`. (Do not select the Default, Keyoboard, UI or Workspace options.)

![opening settings file](https://i.imgur.com/QNh6WkI.png)

2. Once you have opened your `settings.json` file, copy and paste the following code into the top of your settings. Make sure you are pasting this code between the brackets.

```json
{
	"editor.formatOnSave": true,
	"editor.formatOnPaste": true,
	"editor.tabCompletion": "on",
	"editor.wordWrap": "on",
	"files.trimFinalNewlines": true,
	"files.autoSave": "afterDelay",
	"prettier.singleQuote": true,
	"prettier.semi": true,
	"prettier.jsxBracketSameLine": true,
	"prettier.useTabs": true,
	"prettier.tabWidth": 2,
	"prettier.jsxSingleQuote": true,
	"diffEditor.ignoreTrimWhitespace": true,
	"editor.codeActionsOnSave": {
		"source.fixAll.eslint": true
	},
	"eslint.alwaysShowStatus": true,
	"javascript.updateImportsOnFileMove.enabled": "always",
	"[javascript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"python.linting.pylintEnabled": true,
	"python.linting.enabled": true,
    "python.formatting.provider": "autopep8",
	"workbench.colorTheme": "Monokai",
	"liveServer.settings.donotShowInfoMsg": true,
	"[html]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[json]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"emmet.includeLanguages": {
		"javascript": "javascriptreact"
	},
	"window.zoomLevel": 1,
	"workbench.iconTheme": "material-icon-theme",
	"python.linting.pylintArgs": [
		"--load-plugins=pylint_django",
		"--disable=missing-docstring,invalid-name"
	]
}
```

> Note: if you find any of these settings don't work for you, feel free to modify them as you wish!

3. Now your `settings.json` should look like this:

![settings.json file](https://i.imgur.com/3x5uNur.png)

You will need to close VS Code completely and reopen it for changes to take effect. Now your text editor will AUTOMATICALLY format on save and paste!

## Chrome

If you do not already have Google Chrome, [download here](https://www.google.com/chrome/browser/desktop/index.html), install it, and set it as your
default browser.

When done, do the following on any page in Chrome:

1.  On MacOS, press `Command + option + J` simultaneously to open up the Chrome inspector
1.  On the top right of the inspector window there are three dots, click that.
1.  Go to settings and make sure yours look like the following image.

![Chrome Inspector Settings](https://git.generalassemb.ly/storage/user/5688/files/16fa008e-cecb-11e7-98dc-9a59e264c925)

## What's Left?

Tomorrow morning we'll be configuring Git on our machines. Stay tuned for that last in-class install!

Over the next few days, work on getting the remaining technologies installed:

### MongoDB

We will install MongoDB, another open source database. To do that,
type:

```
scripts/mongodb.sh
```

If you got any errors there, please let an instructor know. Otherwise, you can
verify that MongoDB is working correctly by running one of the following
commands:

### macOS

Run `brew services list`. You should see `mongodb-community` with the word "started" to
the right of it.

### Ubuntu

Run `sudo systemctl status mongodb`. You should see a green circle and the words
"active (running)" somewhere in the output.

### On either OS

If the service appears to be running, type `mongo` and hit enter.

You should see something like this:

```
MongoDB shell version v4.2.0
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 4.2.0
```

possibly followed by some warnings/errors. Ignore these warnings/errors for now.
You should notice that your command prompt is gone, replaced with a `>`.
This means the MongoDB shell installed correctly. Press `Ctrl + c` to get back
to your terminal.

### Postgres

We will be installing PostgreSQL, an open source relational database management system. In SEI, we will be writing SQL (structured query language) and maintaining our relational databases using Postgres.

Enter the following command in your terminal

```bash
scripts/postgres.sh
```

- To ensure Postgres is running on your computer, **on macOS** type:

```bash
brew services list
```

- To ensure Posgres is running on your computer, **on Linux** type:

```bash
service postgresql status
```

(_macOS_) Postgres will only work if you see a service with a `Name` of postgresql and `Status` say `started`

(_Linux_) Postgres will only work if you see a green circle and the words
"active (running)" somewhere in the output.

If Postgres didn't start correctly according to the criteria above, ask an instructor for assistance.

Verify that Postgres is working with the command

```bash
psql
```

This should bring you into the PostgreSQL interactive terminal. It should look something like this

```bash
psql (<version_number>)
Type "help" for help.

<your_username>=#
```

Exit the psql terminal by typing `\q`, followed by `Enter`

### Python

This script will install the Python language onto your computer. If you have a Mac, you may have a certain version of Python installed, but we will be making sure everyone is on the same version.

We will also be installing a package that will help us install other Python things called `pip`.

In your terminal, run:

```
scripts/python.sh
```

Shut down your terminal and navigate back to the installfest repo before moving on.
