# CSC202_Workspace
>Version 1.0  
>Date: Spring 2025
---
## Introduction
Welcome to the CSC-202: Programming Embedded Microcontrollers in C and Assembly course at Monroe Community College. This repository contains a set of programming files that serve as the starting workspace for Code Composer Studio-Theia, a powerful IDE used in the course. These files are designed to help you get started with embedded systems development, using both C and Assembly programming languages.

By utilizing this workspace, you will be able to begin your journey of programming embedded microcontrollers with the support of a structured environment tailored to your course's needs.

## Hardware
The hardware used in these projects includes:

- MSPM0G3507 LaunchPad (LP-MSPM0G3507)
- CSC202 Expansion Board
- LCD1602 Module
- 4x4 Matrix keypad


## Configuring CCS-Theia and GitHub
---
To fully integrate CCS-Theia with Git and GitHub, you will push your local repository from your machine to GitHub. Below are the instructions to push and pull files to/from GitHub.

### Configure Git Global Configurations

Before you can use Git, you must define your global user information. This is necessary because Git tracks your identity for every commit you make. By setting up this configuration, you ensure that each commit has the correct author information attached to it.

 **Open a new terminal in CCS-Theia**
1. Enter the following command to set your e-mail address
   - `git config --global user.email "{your-email-address}"`
     - Ensure that you replace the `{your-email-address}` with your e-mail address.
     - This sets the email address that will be associated with your commits. This is especially important for identifying who made a particular change when collaborating on a project.
   
2. Enter the following command to set your username
   - `git config --global user.name "{your-name}"`
     - Ensure that you replace the `{your-name}` with your name.
     - This sets the name that will be associated with your commits. This helps identify who made the changes, which is especially useful for collaboration in shared repositories.

By using the `--global` flag, Git applies this configuration to every repository on your system. If you want to override the global configuration for a specific repository, you can set local configurations (specific to that repo) by omitting the `--global` flag and running the same commands within the repository folder.


### Pushing from CCS-Theia to GitHub

Once you have created a repository on your local machine using CCS-Theia, you need to connect it to a remote repository on GitHub. You only need to set up this connection once. CCS-Theia will remember the connection for future use.

 **Open a new terminal in CCS-Theia**

1. Configure your Git global configurations for user name and email, if they aren't already configured.

2. Connect your local repository to the remote repository on GitHub by running this command (replace `{your-git-hub-username}` and `{name-of-repo}` with your actual GitHub username and repository name):
   - `git remote add origin https://github.com/{your-git-hub-username}/{name-of-repo}.git`

3. Push your local repository to GitHub (this also sets the upstream branch for future pushes):
   - `git push -u origin master`

    The `-u` flag in the `git push` command stands for **"upstream"**. It tells Git to remember the remote repository (in this case, `origin`) and the branch (in this case, `master`) that you're pushing to. This establishes a tracking relationship between your local branch and the remote branch, which simplifies future Git commands.

**NOTE:** Do not create any files directly on GitHub before pushing your local repository. If you do, GitHub will create a branch called `main`. This can cause confusion and result in two branches when you push from your local machine.

### Pulling from GitHub to a New CCS-Theia Setup

If you have an existing repository on GitHub and now you want to work on it from a different machine (e.g., a new PC or a work/school computer), you'll need to pull the repository from GitHub to your new machine. Follow these steps to set up the repository on your new computer and access your files:

1. **On the new machine**, create a folder where you want to store the repository. This will serve as the location for the files you pull from GitHub.

2. **In CCS-Theia**, open the newly created folder to make it your workspace. This sets up your environment for the new project.

3. **In the Source Control tab**, initialize the local repository to setup Git for the workspace.

4. **Open a new terminal in CCS-Theia** and issue the following commands:
   - Git Global Configurations, if they aren't already configured on the new machine.
   - Add the GitHub repository as the remote origin (replace `{your-git-hub-username}` and `{name-of-repo}` with your actual GitHub username and repository name):
     - `git remote add origin https://github.com/{your-git-hub-username}/{name-of-repo}.git`
   - Pull the latest changes from the GitHub repository to your local machine. Replace `master` with `main` if that is your default branch on GitHub:
      - `git pull origin master`

This will download the latest version of the repository from GitHub to your local machine, so you can start working on it in CCS-Theia.

---
## Contact Information
Bruce Link  
Information & Computer Technologies Department  
blink@monroecc.edu


