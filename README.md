
hinhlab:
myPAT: q7unouc6snyumdiwnthscrakhtqaceifmdtqpasy73md5wtvplua
===============================================================

Storage account:
RESOURCE_GROUP_NAME=AzureDevops
STORAGE_ACCOUNT_NAME=tfstateudacityaccount
CONTAINER_NAME=tfstate
ACCOUNT_KEY=fjL+68Ode3aikf64+HCpNiSP9x+wtPPFTnNkM2thxQaNqKxwv9wWlEUm7Os9RtNYSnbcXSxp8ab0+ASt/VZdFQ==

===============================================================================================================







This project demonstrate how to build a pipeline that:
* Auto build and deploy a website to an app service, deploy to a virtual machine to run selenium
* 

# Prequisite
* This tutorial is performed on Linux Ubuntu 20.04 LTS
* You have to install:
    * Azure CLI
    * Visual studio code (VS code)
    * Terraform (If you wish to test terraform step on local)
    * Postman
    * Jmeter
    * Selenium


 
# I. Setup azure devops
## 1. Clone the project
* Open bash and clone project using this command:

``` bash
$ git clone https://github.com/nghianv201096/UdacityDevops3_EnsuringQualityReleases.git
```

* Go to project folder and open it with VS code:
``` bash
$ cd UdacityDevops3_EnsuringQualityReleases.git
$ code .
```   