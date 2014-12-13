backuppc-debian-package
=======================

Build script to produce a debian package for backuppc4

How to start?
=============

First of all, you have to init submodules, and checkout dependancies:

```no-highlight
$ git submodule init
Submodule 'BackupPC' (git@github.com:fser/BackupPC.git) registered for path 'BackupPC'
Submodule 'BackupPC-XS' (git@github.com:fser/BackupPC-XS.git) registered for path 'BackupPC-XS'
Submodule 'rsync-bpc' (git@github.com:fser/rsync-bpc.git) registered for path 'rsync-bpc'
$ git submodule update
Cloning into 'BackupPC'...
remote: Counting objects: 145, done.
remote: Compressing objects: 100% (113/113), done.
remote: Total 145 (delta 24), reused 142 (delta 24)
Receiving objects: 100% (145/145), 585.77 KiB | 226 KiB/s, done.
Resolving deltas: 100% (24/24), done.
Submodule path 'BackupPC': checked out '678caff8d03878b979e04ee1ed4d9f6b8ee40801'
Cloning into 'BackupPC-XS'...
remote: Counting objects: 59, done.
remote: Compressing objects: 100% (54/54), done.
remote: Total 59 (delta 2), reused 55 (delta 2)
Receiving objects: 100% (59/59), 298.81 KiB | 170 KiB/s, done.
Resolving deltas: 100% (2/2), done.
Submodule path 'BackupPC-XS': checked out 'e816655ea6b9d41907733c1baebee31bfcfd26b8'
Cloning into 'rsync-bpc'...
remote: Counting objects: 233, done.
remote: Compressing objects: 100% (223/223), done.
remote: Total 233 (delta 7), reused 229 (delta 6)
Receiving objects: 100% (233/233), 827.65 KiB | 369 KiB/s, done.
Resolving deltas: 100% (7/7), done.
Submodule path 'rsync-bpc': checked out '1eeab8f182f7030b6cdd262a18a9166ba6e4f692'
```
Now, you can wait for this project to go further, or contribute.

Todo
====

 * Fix the others repository
   * Create a dedicated branch for each of the dependancies for this aim, should ease the future
 * When that is done, update the references from this git submodule file
 * Maybe try to clone those projects in a dedicated folder, such as `dependancies` or something like that.
