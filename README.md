java-pi
=======

A RESTful API in Java on a Raspberry Pi

Installation Instructions
------
- After installing Raspbian Wheezy and booting for the first time, do the following.
- Make the following changes in raspi-config
  * Expand filesystem  
  * Set correct timezone (Internationalisation Options)  
  * Change keyboard layout (Internationalisation Options)  
  * Decrease amount of memory for the GPU to 16M (Advanced Options)  
  * Enable SSH (Advanced Options)  
- Download and run the install script via the command line  
``` wget https://raw.githubusercontent.com/codenozzle/java-pi/master/install.sh ```  
``` sudo chmod 755 install.sh ```  
``` ./install.sh ```  
- Follow the onscreen prompts and answer "Y" to all. 
- You will be asked to create a MySQL password. I would suggest "raspberry". 
- You will be asked to pick a default Java version. I suggest the Java 8 ARM version. It should be #2.
- Run the configure script
  * ``` ./configure.sh ```  
- Use a browser and navigate to the url given by the script
  * It can take 60 secs or more for the page to load for the first time
- Congratulations!
