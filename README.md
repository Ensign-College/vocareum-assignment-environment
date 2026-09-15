# Vocareum Bash Environment v1.0

Drop-in Bash startup files for Vocareum notebook assignments.

## Features

0. **Identifiable screenshots** - the shell prompt shows the student's own
   username instead of a generic account name. `.bashrc` derives it from
   Vocareum's `VOC_INITIATOR_EMAIL` variable (`john.taylor@ensign.edu` ->
   `john.taylor@<host>:~$`), so any screenshot a student submits carries their
   identity.
1. **Quality-of-life improvements**
    -   `nano` as the default editor for Git commit messages, `Ctrl-X Ctrl-E` command line editing, etc.
    -   `rm`/`cp`/`mv` commands prompt the user before destroying files
    -   `Ctrl-S` freed up for forward history search
    -   colorized `ls`, `grep`, `diff`, GCC diagnostics and man pages
        -   Note: man pages may be disabled in containerized environments; run `sudo unminimize` to enable the full software suite
    -   a large set of handy aliases (`ll`, `la`, `diffu`, `grepi`, `findf`, `pd`, ...)
    -   `autocd`, `cdspell`, `globstar` and other convenience shell options
    -   and full programmable tab completion via the bundled `.bash_completion` (bash-completion 2.11), used only if the system copy is missing


## Installation

These steps need to be done only once per Vocareum assignment:

0. Create a **Vocareum notebook** assignment.
1. Click **Configure Workspace** to open the administrator terminal.
2. Copy or upload [`bashrc`](./bashrc) and [`bash_completion`](./bash_completion) into `/voc/startercode`.
3. Rename them so the names begin with a dot:

   ```sh
   cd /voc/startercode
   mv bashrc .bashrc
   mv bash_completion .bash_completion
   ```

4. Save the workspace configuration.

When a student opens the workspace, Vocareum copies everything from `/voc/startercode` into their home directory, where Bash loads `~/.bashrc` automatically in each interactive shell.  You can test this for yourself by pressing the **Student View** button.  If you make changes to files under `/voc/startercode` *after* starting student view, click the **Reset Assignment/Lab** button to force the change to take effect (it is on the upper right-hand corner of the terminal, and looks like a curved arrow). 

## Notes

- Students can add their own aliases in `~/.bash_aliases`; `.bashrc` sources it if present.
- Existing student files are not overwritten on subsequent logins, so edit these files in `/voc/startercode` *before* releasing the assignment.
- Starter code files under `/voc/startercode` **are not** automatically copied into the instructor's home directory at container start up. These files must manually be copied into `$HOME` to use these files in the instructor's environment.
    - The instructor's shell prompt looks different than a student's prompt to make it more evident that you are working as an instructor.
