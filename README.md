# dotfiles

Easily set up a new computer, restore your packages, applications, configurations, and keep your computer automatically maintained and backed up! Complete with bonus convenience scripts and sensible defaults.

To simplify instructions, the paths provided in this README are for Ubuntu scripts. However, these all have their counterparts for other OSs. You just need to replace the 'ubuntu' part in the paths and, based on the OS, the extension of the script. Sometimes additional minor changes to the path are required as well but it should all be clear and intuitive.

All installations and backups work by providing a profile name for them for easy management of different setups. If you provide no profile name to a script, they'll use the default `personal` profile.

Example use:
```
install.sh # Set up your new machine quickly using the default personal profile
# Assume you're customising your installation here by installing new packages, editing shell configuration, etc
backup.sh my-work-ci-server
# Now if you're working on your own fork, you can commit this profile and later use it to set up new machines or make reinstallations way easier!
```

## Setting Up After a Fresh Install

The following steps assume that you are doing the setup on a freshly formatted computer. Therefore you don't even have your SSH keys or anything set up.

Open the Terminal app and enter the commands below.

```
mkdir ~/Projects
cd ~/Projects
git clone https://github.com/isair/dotfiles.git
cd dotfiles
```

Before typing the following line, make sure you check the files under the `profiles/personal` folder and modify them to personalise your setup.

```
./scripts/ubuntu/install.sh
```

## Automating Backup & Cleanup

One way to automate backup and cleanup is to add cron jobs for these scripts.

```
crontab -e
```

Append the following line, changing the path as necessary.
```
0 15 * * * ~/projects/dotfiles/scripts/ubuntu/backup.sh
```

This will update your package list but you'll still need to commit and push yourself, or write a script for it.


```
sudo crontab -e
```

Append the following line, changing the path if needed again.
```
30 9 * * * /home/owner/projects/dotfiles/scripts/ubuntu/cleanup.sh
```

Your computer will now do a clean-up in the morning, to open up space that you might need during the day. At 15:00, it will do backups.

## Supported Package Managers

The back-up scripts support the following package managers.

### OS X

- brew
- brew cask

### Ubuntu

- apt
- snap

### Windows

- scoop

## Development

Commit scopes:
- profiles
- scripts
- repo
