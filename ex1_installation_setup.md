# Ex.No: 1 - Basics of Prolog (Installation & Git Setup)

**Date:** 4.8.26

## Introduction
Prolog is a declarative programming language widely used in Artificial Intelligence and
Computational Linguistics. Unlike procedural languages, Prolog is based on formal logic.
A program is expressed in terms of relations, represented as **facts** and **rules**.

## How to Install
1. **Download GNU Prolog** - open the official GNU Prolog website and download the installer.
2. **Install GNU Prolog**
   1. Open the downloaded `.exe` file
   2. Click Next
   3. Keep the default installation location
   4. Click Install
   5. Click Finish
3. **Check the installation** - open PowerShell and run:
   ```
   gprolog --version
   ```
4. **Create a Prolog file** - create a folder (e.g. `Nowfil Prolog`) and a file `ex.pl` inside it.
5. **Configure your Git username**
   ```
   git config --global user.name "your name"
   ```
6. **Check your configuration**
   ```
   git config --global --list
   ```
7. **Initialize Git**
   ```
   git init
   ```
8. **Check files**
   ```
   git status
   ```
9. **Add all files**
   ```
   git add .
   ```
10. **Commit**
    ```
    git commit -m "Initial commit"
    ```
11. **Push to GitHub**
    ```
    git branch -M main
    git remote add origin <your-repo-url>
    git push -u origin main
    ```
12. **Load your Prolog program** (inside the `gprolog` prompt)
    ```
    ['ex.pl'].
    ```
    or `consult('ex.pl').`

## Result
The installation of GNU Prolog on Windows was successfully completed.
