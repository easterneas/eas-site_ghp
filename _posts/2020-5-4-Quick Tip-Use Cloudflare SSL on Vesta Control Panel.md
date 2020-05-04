---
# basic post options
title: "Quick Tip: Use Cloudflare SSL on Vesta Control Panel"
description: It pains me when every time I tried to access Vesta Control Panel on my server, the browser always threw me an invalid/self-signed SSL error.
categories: [quick-tips]
tags: [Quick Tips, Server, Vesta CP, Cloudflare, Manage, Deployment]

# post components
counter: true
comments: true

# post header options
header:
  fullscreen: false
  image: /assets/img/site/header/padlock.jpg
  unsplash:
    author: Markus Spiske
    username: markusspiske

# post sharing options
sharing:
  fb: I use Vesta Control Panel for managing sites. As it uses another port to be accessible, SSL doesn't work nicely with this approach. Good thing, there is a way, and if you use Cloudflare as I do, you're lucky.
  li: I use Vesta Control Panel for managing sites. As it uses another port to be accessible, SSL doesn't work nicely with this approach. Good thing, there is a way, and if you use Cloudflare as I do, you're lucky.
  tw: I use @vestacp for managing sites. As it uses another port to be accessible, SSL doesn't behave nicely with this approach. Good thing, there is a way, and if you use @Cloudflare, you're lucky.

# advanced post options
layout: post
---

As I wrote this article, I was currently setting up my server on [DigitalOcean](https://m.do.co/c/c1d659edcd3f) with [Vesta Control Panel](https://vestacp.com/) for managing sites inside my server. Every time I had to go to the control panel, the browser threw out invalid/self-signed SSL error -- which, I had to click on "Proceed to site (not recommended)".

Luckily, I use Cloudflare as my DNS management service, so managing SSL is quite easier. And in this Quick Tip, I'll show you how to use Cloudflare's SSL for your Vesta Control Panel. I assumed that you have:
- Already setup your VPS (if not, register through the link above -- that will support me, too!);
- Registered your domain on Cloudflare; and
- Setup Vesta Control Panel on your VPS.

So, without further ado, let's jump into it!

## How to change default Vesta Control Panel port

First, make sure that your DNS used for Vesta Control Panel is already proxied (that is, the cloud with orange color). This will make sure that Cloudflare's SSL can be properly implemented.

Then, if you didn't enable Cloudflare SSL feature just yet, you have to go to SSL page to enable it. And on the Overview section, set your SSL/TLS encryption to Full. 

Since [Cloudflare doesn't work nicely with Vesta's default port (8083)](https://forum.vestacp.com/viewtopic.php?t=16847#p72024), you need to go to your VPS via SSH, and do this:

```ssh
sudo nano /usr/local/vesta/nginx/conf/nginx.conf
```

You can use Vim, of course.

Then, find the following:
```
...other configs

# Vhost
server {
  listen 8083;
  ...
}

...other configs
```
and change it to other, like port {{ "now" | date: "%Y" }}, for example, as long as the port isn't used by other applications/services in your server. Save it.

Since you have changed Vesta Control Panel configuration settings, you need to restart the service. Do this in your SSH terminal:

```ssh
sudo service vesta restart
```

or...

```ssh
sudo systemctl restart vesta.service
```

## Test it out!

Now that you've updated Vesta Control Panel default port, you might want to test it. Go to Vesta Control Panel on your server to see if Cloudflare's SSL kicks in. If it does, then that's it! You've successfully set up SSL on Vesta Control Panel using Cloudflare's SSL.