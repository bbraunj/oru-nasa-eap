# How to Connect Simulink to this Git Repository

If on Windows, first get https://msysgit.github.io/. Default settings on the installer should be fine. Make sure you select Git BASH instead of Git GUI or Shell Integration.

Once you open up MATLAB, add this project from GitHub using the following menu:
<img width="492" alt="Screen Shot 2019-10-18 at 4 37 41 PM" src="https://user-images.githubusercontent.com/3528169/67130163-1d5d8e80-f1c6-11e9-93f8-d8dbd5880b14.png">

Then, enter the following into the dialog:
<img width="800" alt="Screen Shot 2019-10-18 at 4 38 23 PM" src="https://user-images.githubusercontent.com/3528169/67130264-5d247600-f1c6-11e9-9050-d115825bd08b.png">

When adding files and changes to Git, the current setup will require you to enter your GitHub username and password every time you want to push those changes to the internet. To avoid this, we will follow these steps:

## Setting Up Your Computer to Automatically Authenticate with GitHub

1. Open Git BASH. This was installed in the first step.
2. Run the following command, replacing the email address with the one used for your GitHub account:
```
ssh-keygen -t rsa -m PEM -b 4096 -C "email_address@example.com"
```
3. Enable the ssh-agent using the following commands:
```
eval $(ssh-agent -s)
```
```
ssh-add ~/.ssh/id_rsa
```
4. Next, print out your ssh key using the following command:
```
cat ~/.ssh/id_rsa.pub
```
5. Copy the printed key to the clipboard, then head over to [GitHub.com](www.github.com). Navigate to `Settings > SSH and GPG keys > New SSH Key` and paste the key into the key box. The title can be whatever you want.
6. You can verify that this worked using the following command:
```
ssh -T git@github.com
```
7. Go to the directory where you created the Simulink project using the following command and your directory:
```
cd /path/to/the/oru-nasa-eap/directory
```
8. Execute the following command:
```
git remote set-url origin git@github.com:bbraunj/oru-nasa-eap.git
```
9. Check that the following command:
```
git remote -v
```
Produces the following output:
```
origin	git@github.com:bbraunj/oru-nasa-eap.git (fetch)
origin	git@github.com:bbraunj/oru-nasa-eap.git (push)
```
10. If MATLAB is open, close it and open it back up for changes to take effect.

Now you should be able to push changes to the server without typing in your username and password every time.

# Pushing Changes to GitHub
1. Let's say you create a new Simulink model named `Hello_World.slx` from the Project tab in MATLAB as shown below: 
<img width="790" alt="Screen Shot 2019-10-18 at 5 01 13 PM" src="https://user-images.githubusercontent.com/3528169/67131097-f3599b80-f1c8-11e9-8a4b-c3bc3f444934.png">

2. You make some changes and feel ready to save those changes to the server. The first step is to make **add** any files that you created, as shown in the figure below.
<img width="903" alt="Screen Shot 2019-10-18 at 5 06 58 PM" src="https://user-images.githubusercontent.com/3528169/67131390-205a7e00-f1ca-11e9-8f16-c04b0e78afbb.png">

3. Next, you **commit** these files. Committing in Git is like a savepoint that contains your files exactly as they are in this point of time. To do this, press the button shown in the following figure and enter a concise message of what changes/additions you made. This is very helpful for tracking what changes were made over time.
<img width="823" alt="Screen Shot 2019-10-18 at 5 11 54 PM" src="https://user-images.githubusercontent.com/3528169/67131484-792a1680-f1ca-11e9-9eae-35fa1f588246.png">

4. Once you click submit, these changes are saved in the local copy of the Git repository. Next, you need to **push** these to GitHub. This is simply done by clicking the button shown below:
<img width="825" alt="Screen Shot 2019-10-18 at 5 14 36 PM" src="https://user-images.githubusercontent.com/3528169/67131612-f6ee2200-f1ca-11e9-801c-b64e6227e216.png">

Your changes should now be on GitHub!

# Getting Updates from the Server
If your local copy of the Git repository is behind the GitHub copy, you will want to pull those changes down to your computer. To do this, simply click the <img width="50" alt="Screen Shot 2019-10-18 at 5 26 23 PM" src="https://user-images.githubusercontent.com/3528169/67131953-6fa1ae00-f1cc-11e9-9be5-b806a37e1eb6.png"> button in the source control menu.

Let's say you and someone else both have a certain copy of `oru-nasa-eap` on your computers. The other person makes changes to a file and pushes those to the server. If you make changes to the same file and try to pull changes from the server, you will encounter the following error message:
<img width="547" alt="Screen Shot 2019-10-18 at 5 31 09 PM" src="https://user-images.githubusercontent.com/3528169/67132160-5ea56c80-f1cd-11e9-9fce-2b9be91d2eec.png">

In this case, contact @bbraunj and he can help you figure this out.
