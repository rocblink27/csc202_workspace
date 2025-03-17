# CSC202_Workspace
>Version 1.0  
>Date: Spring 2025
---
### Introduction
Welcome to the CSC-202: Programming Embedded Microcontrollers in C and Assembly course at Monroe Community College. This repository contains a set of programming files that serve as the starting workspace for Code Composer Studio-Theia, a powerful IDE used in the course. These files are designed to help you get started with embedded systems development, using both C and Assembly programming languages.

By utilizing this workspace, you will be able to begin your journey of programming embedded microcontrollers with the support of a structured environment tailored to your course's needs.

### Hardware
The hardware used in these projects includes:

- MSPM0G3507 LaunchPad (LP-MSPM0G3507)
- CSC202 Expansion Board

<br></br>
## Configuring CCS-Theia to push to GitHub
---
The command used to connect repo to GitHub:

- `git config --global user.email  "blink@monroecc.edu"`  
- `git config --global user.name  "Bruce Link"`  
- `git remote add origin https://github.com/rocblink27/csc202_AdvDev.git`  
- `git push -u origin master`

**NOTE:** Do not create any file in GitHub because this will create the branch called `main`. Then, if you push, you will have two branches.

<br></br>
## Configuring CCS-Theia to push to GitHub (for another machine)
---
To create a repo on another machine (i.e., school or work computer), follow these steps to connect the repo to GitHub:

1. On another machine, create a folder where you want to store the repo.
2. In CCS Theia, open that new folder to make it a workspace.
3. In the Source Control tab, initialize the local repo.
4. Open a new terminal in CCS and issue the two git commands below:
   - Ensure globals are configured properly.
   - `git remote add origin https://github.com/rocblink27/csc202_AdvDev.git`
   - `git pull origin master`

<br></br>
## Contact Information
---
Bruce Link  
Information & Computer Technologies Department  
blink@monroecc.edu
