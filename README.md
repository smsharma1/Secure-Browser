# Containerised Browser

This project aims at creating a secure containerised browser to secure system from different malwares.

## Getting Started

## LINUX

### Clone

```git clone https://github.com/smsharma1/Secure-Browser && cd Secure-Browser```

### Installation
``` ./install_docker.sh ```

Note: The script installs all dependencies and recommendations of the package manager without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
However, you are still advised to go through 
https://store.docker.com/search?type=edition&offering=community 
to install docker as per your platform for increased transparency.

```./install.sh```

Note that installation script changes default browser to this browser. All hyperlinks will now open by default from secure-firefox. Comment out xdg-settings from install.sh line to prevent this behaviour.

```./secure-firefox``` 
and surf the internet!!

You can also pass any arguments supported by firefox like multiple urls etc.

## Windows

### Prerequisites
Docker toolbox(https://docs.docker.com/toolbox/toolbox_install_windows/)

X-Server(https://sourceforge.net/projects/vcxsrv/)


### Run
Run the X-server locally on your machine and then execute this command on your docker

```docker run -d --name firefox1 -e DISPLAY=<ip of host where xserver is running>:0  jess/firefox```

### Uninstall
```remove_images_container.sh```

