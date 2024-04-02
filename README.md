![](https://img.shields.io/badge/STATUS-NOT%20CURRENTLY%20MAINTAINED-red.svg?longCache=true&style=flat)

# Build an iOS and MacOS App with One Code Line Using SAP BTP SDK for iOS - Sample Project

[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/cloud-sdk-ios-maccatalyst-mission-project)](https://api.reuse.software/info/github.com/SAP-samples/cloud-sdk-ios-maccatalyst-mission-project)

## Description
This repository contains an Xcode Swift project using the SAP BTP SDK for iOS frameworks. With the newest version of the SAP BTP SDK for iOS 6.0 and later you will not only have all the latest and greatest technology available but also Mac Catalyst support. The tutorial series which this project belongs too, will show you how to build an app with the Apple SDK, SAP BTP SDK for iOS and Xcode. This app you will make fit to run on iOS as well as MacOS.

The project included in this repository is basically what you will have when you fully completed the tutorial series. The project is suppossed to be used as a reference for you on your journey to your own app.

The project is documented with the inline comments you also see in the tutorials.

## Requirements
You will find the requirements also in the tutorial series.

To just run this project, make sure to fulfill the following requirements:
- You have signed up for a SAP BTP trial
- You have SAP BTP Mobile Services enabled
- You have an application configuration created in SAP BTP Mobile Service and has the SAMPLE ODATA ESPM feature.
- You have the latest Xcode installed but at least Xcode 11.3
- You can sign the app for development
- You have downloaded the SAP BTP SDK for iOS latest version but at least 6.0

## Download and Installation
In order to get the project running please follow the following steps:

1. Clone the [cloud-sdk-ios-maccatalyst-mission-project](https://github.com/SAP-samples/cloud-sdk-ios-maccatalyst-mission-project) to your local machine
2. Open the project in Xcode
3. Make sure to set your development team and signing settings properly
4. Make sure to import the SAP BTP SDK for iOS frameworks
!![Frameworks Import](https://user-images.githubusercontent.com/9074514/81099982-97363a80-8ec0-11ea-965e-3cd4fac316ae.png)
5. Make sure to change the **ConfigurationProvider.plist** file to match your SAP BTP Mobile Services settings.
[ConfigurationProvider](https://user-images.githubusercontent.com/9074514/81100142-dfedf380-8ec0-11ea-802e-f4268e432ef8.png)

You can find the needed parameters in your application configuration on SAP BTP Mobile Services. Simply go into the details of your application configuration and then **Security**.
!![Security Mobile Services](https://user-images.githubusercontent.com/9074514/81100650-ba151e80-8ec1-11ea-9500-3c6a1757fdf6.png)

6. Make sure to change the **Application Identifier** in the **AppParameters.plist** file.
[AppParameters](https://user-images.githubusercontent.com/9074514/81100149-e2504d80-8ec0-11ea-97ad-8d01bfb0d172.png)

You will need the application identifier defined in SAP BTP Mobile Services.
!![ID Mobile Services](https://user-images.githubusercontent.com/9074514/81100979-3dcf0b00-8ec2-11ea-9c3e-bbca4fbc2c3a.png)

## Known Issues
None

> If you find any issues with the project or the instructions, feel free to open an issue.

## How to obtain support
This project is provided "as-is": there is no guarantee that raised issues will be answered or addressed in future releases.

## License
Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/cloud-sdk-ios-maccatalyst-mission-project/tree/master/LICENSES) file.

