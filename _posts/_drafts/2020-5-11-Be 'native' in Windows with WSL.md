---
# basic post options
title: "Be 'native' in Windows with WSL"
description: If you are using the latest version of Windows 10, or you are Windows 10 insider, chances are that Windows 10 includes Windows Subsystem for Linux (WSL) version 2.
categories: [Development]
tags: [Windows, Windows Subsystem for Linux, Bash]

# post components
comments: true

# post header options
header:
  fullscreen: false
  image: /assets/img/site/header/blog.jpg
  unsplash:
    author: 
    username: 

# post sharing options
sharing:
  fb: If you are using the latest version of Windows 10, or you are Windows 10 insider, chances are that Windows 10 includes Windows Subsystem for Linux (WSL) version 2.
  li: If you are using the latest version of Windows 10, or you are Windows 10 insider, chances are that Windows 10 includes Windows Subsystem for Linux (WSL) version 2.
  tw: If you are using the latest version of @Windows 10, or you are Windows 10 insider, chances are that Windows 10 includes Windows Subsystem for Linux (WSL) version 2.

# advanced post options
layout: post
---

So you're still comfortable developing apps in Windows environment, or you still have apps that only can run inside Windows. Or even, you're just being lazy migrating your data from Windows to Linux (I don't judge you, though), but you need to operate Linux shell inside Windows. If either one of those is what you feel right now, you've come into the right place.

Well, I was comfortable using webserver apps in Windows, like [Laragon](https://laragon.org) and [Laravel's Homestead](https://laravel.com/docs/homestead). But then, the performance is rather slow, especially when operating inside a virtual machine like Homestead.

So, I decided to find alternatives, and good thing is, Windows has Windows Subsystem for Linux, or WSL. I'm talking about WSL version 2, which [has much better I/O performance and full system call compatibility](https://docs.microsoft.com/en-us/windows/wsl/wsl2-about) over WSL version 1 which was released in 2016.



## In this post...

I will teach you about how to setup 
