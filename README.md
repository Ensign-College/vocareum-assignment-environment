# Vocareum Bash Environment v1.0

Drop-in Bash startup files for Vocareum notebook assignments.

## Features

0. **Identifiable screenshots** - the shell prompt shows the student's own
   username instead of a generic account name. `.bashrc` derives it from
   Vocareum's `VOC_INITIATOR_EMAIL` variable (`john.taylor@ensign.edu` ->
   `john.taylor@<host>:~$`), so any screenshot a student submits carries their
   identity.
1. **Quality-of-life improvements**
    -   colorized PS1 prompt, `ls`, `grep`, `diff`, GCC diagnostics and man pages
        -   Note: man pages may be disabled in containerized environments; run `sudo unminimize` to enable the full software suite
    -   a large set of handy aliases (`ll`, `la`, `grepi`, `findf`, ...)
    -   interactive `rm`/`cp`/`mv` as a safety net
    -   `autocd`, `cdspell`, `globstar` and other convenience shell options
    -   `nano` as the default editor
    -   `Ctrl-S` freed up for forward history search
    -   and full programmable tab completion via the bundled `.bash_completion` (bash-completion 2.11), used only if the system copy is missing


## Installation

These steps need to be done only once per assignment

0. Create a Vocareum **notebook** assignment.
1. Click **Configure Workspace** to open the administrator terminal.
2. Copy or upload `.bashrc` and `.bash_completion` into `/voc/startercode`.
   The web uploader may refuse or hide dot-files, so upload them as `bashrc`
   and `bash_completion` if necessary.
3. Rename them so the names begin with a dot:

   ```sh
   cd /voc/startercode
   mv bashrc .bashrc
   mv bash_completion .bash_completion
   ```

4. Save the workspace configuration.

When a student opens the workspace, Vocareum copies everything from `/voc/startercode` into their home directory, where Bash loads `~/.bashrc` automatically in each interactive shell.

## Notes

- Students can add their own aliases in `~/.bash_aliases`; `.bashrc` sources it if present.
- Existing student files are not overwritten on subsequent logins, so edit these files in `/voc/startercode` *before* releasing the assignment.
