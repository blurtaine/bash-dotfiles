# My system-wide bash configuration

***To install it, follow the instruction steps and commands below.***


1. Cloning the repo into `/etc/bash`
2. Saving the original bash.bashrc file in a backup
3. Creating a symlink in `/etc` pointing to `/etc/bash/bash.bashrc`


```bash
# You will, most likely, need root privileges to perform the these actions!
git clone https://github.com/blurtaine/bash-dotfiles.git /etc/bash
mv /etc/bash.bashrc /etc/bash.bashrc.backup
ln -s /etc/bash/bash.bashrc /etc/bash.bashrc
```
