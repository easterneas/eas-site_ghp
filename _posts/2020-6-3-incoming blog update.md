---
# basic post options
title: An Incoming Update for My Blog...
description: After some time, I found some layout issues on my blog...
categories: [Development]
tags: [Windows, Windows Subsystem for Linux, Bash]

# post components
comments: false

# post header options
header:
  enabled: false
  fullscreen: false
  image: /assets/img/site/header/blog.jpg
  unsplash:
    author: 
    username: 

# post sharing options
sharing:
  fb: After some time, I found some layout issues on my blog, and I decided to give it an update.
  li: After some time, I found some layout issues on my blog, and I decided to give it an update.
  tw: After some time, I found some layout issues on my blog, and I decided to give it an update.

# advanced post options
layout: post
---

Hey there! How's it going today? I hope you guys are doing okay, in the midst of the pandemic right now that is still happening by the time this article published.

[Since the first time I posted back in April]({% post_url 2020-4-10-fresh air %}), until lately, I found some issues within my blog design and layout, like:

- Weird image positioning at Home page when viewed in mobile,
- Also at Home page, the layout isn't that convincing, and
- Some backend optimizations needed.

So, I decided to give it an update in the near future. Tl;dr: This update will make my blog be more like a webapp, instead of a proper blog.

## What I'm gonna do

I've been thinking about making the layout simpler, to match my "Easy and Simple" philosophy, but still up to date with today's standards. The current design is lagging for about 7 years behind, in my opinion, and today's design is much simpler that includes shapes, and unique UI.

The future design will be something like this in my mind (it might change in the future, though).

### Mobile usability

There will be updates for mobile environment. First, your thumb won't have to reach the top part of the screen to go to other menu. Instead, the main navigation (and possibly, the logo) will be shown at the bottom. The main navbar will be hidden when you scroll down, and will show up when you scroll back up.

Second, the page and post headers will be simpler, meaning that you can jump right into the contents, without having to scroll too much. The main header at Home page will still be served at full height though. This is good, since it means faster page loading for slower, mobile data connections.

### Desktop would be basically untouched

The desktop would be pretty much the same as the old design, but with a few additions, like simpler main header, shortened page and post headers height, and some layout updates. The layout updates will be the biggest among the others for desktop, as I think there should be things that I should add, change, and remove in the next update.

## Talking about issues

Fixing issues will be the second priority for this time. Things like elements overlapped with parallax image source placeholder when the main page isn't completely loaded, shouldn't happen in production.

Adding features -- like form submitting and better GitHub showcasing -- is the next one, and after that, the performance. Though, when I tested with Lighthouse for the latter, it still has a good rating. So it's an optional thing for now.

Another important thing to do, is to include dual language in the future. As natively I speak Indonesian, so I'll be posting in Indonesian as a priority. Though, I might have to catch up first with the existing English posts, before posting new one. **In short,** I'll prioritize Indonesian posts first in the future, after catching up with existing English posts. The English posts will be posted 1-2 weeks afterwards.

## Under the hood, a.k.a. the Backend

I'll also do things under-the-hood. For some time, I host my posts within GitHub Pages, [which has restricted plugins, including using older Jekyll version of 3.x](https://pages.github.com/versions/). So I decided to move this to Netlify, which has far more customizations, and not limited to just 1 static site generator, which I think, it will open for more possibilities. Even [mini JS apps/games like Tetris and Calculator]({% post_url 2020-5-24-JS Apps %}), were hosted there, too.

I can't wait for this update!
