---
# basic post options
title: Be Creative with GitHub Pages
slug: be-creative-github-pages
description: If you started your development journey, you might want to have your own website. Good thing is, GitHub Pages is there for you!
categories: [Web Development]
tags: [Jekyll, Web Development, GitHub Pages]

# post components
counter: true
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
  fb: If you started your development journey, you might want to have your own website. Good thing is, GitHub Pages is there for you!
  li: If you started your development journey, you might want to have your own website. Good thing is, GitHub Pages is there for you!
  tw: If you started your development journey, you might want to have your own website. Good thing is, @GitHub Pages is there for you!

# advanced post options
layout: post
---

Ever since I've been struggling to create blog with PHP (WordPress/Laravel in that matter), finally I found a solution. I scraped the whole idea of my blog project, and switch to [GitHub Pages](https://pages.github.com). The hiccup is, GitHub Pages uses [Jekyll](https://jekyllrb.com), and PHP doesn't work there. Thankfully, it's easy to learn and build.

## In this post...

I'll walk you through the steps required to build your own blog using Jekyll and GitHub Pages, such as:
- Knowing the language used for building blog on GitHub Pages,
- Building your GitHub Pages on a repository,
- Making your first post, and
- Building and testing your GitHub Pages locally (optional).

But first, make sure you have the following:
- Your GitHub account. [Create one now](https://github.com/join) if you don't have -- don't worry, I'll wait,
- [Git](https://git-scm.com/). This will clone repository, and push/pull commits in your project,
- Your favorite code editor (if you want to customize even more -- I recommend using [Visual Studio Code](https://code.visualstudio.com)), and
- Your time.

## What is Jekyll?

Jekyll is a site generator that compiles web files you've made, into a static page. Its minimal and static behavior make your blog faster to load than most popular CMS out there, such as Joomla! and WordPress.

## Why Jekyll?

I'll describe in 3 words: **fast**, **secure**, and **minimal**.

**Fast**, because your site only consists of static pages. No dynamic contents, as Jekyll processed your posts and pages into static form. 1 point for Jekyll.

**Secure**, because of the static pages. There are no dynamic contents, no authentications required, less points of failure. Another point for Jekyll.

**Minimal**, because... minimal. No server pre-processors like PHP, and you only need HTML, CSS, and JavaScript to create a page. After that, let Jekyll do the thing. Not to mention that you can optionally use Liquid tags to create dynamic-like pages, like mine. Another win for Jekyll.

So, without further ado, let's create!

## Okay... what should I do first?

The first thing to do is to create your repository first. Make sure that it has the format of `<yourusername>.github.io`, where `<yourusername>` is your GitHub username.

Once that's done, click on Create new file above the empty repository list you've just created, as shown at the image below.

![Create a new file on GitHub repository](/assets/img/uploads/20200421-step1-githubpages.jpg "Create new file")

Go ahead and make any HTML tags you want.

After that, name the file as **index.html** (as it's the default file to be looked up first) and commit the change at the bottom of the page.

![Commit change](/assets/img/uploads/20200421-step2-githubpages.jpg "Commit change")

And it should be something like this:

![New file created](/assets/img/uploads/20200421-step3-githubpages.jpg "New file created")

Now go to Settings, and on GitHub Pages section, select `master branch` on the Source options.

![Select master branch on Source options](/assets/img/uploads/20200421-step4-githubpages.jpg "Select master branch on Source options")

The settings are automatically saved, so you only need to wait for approximately 1-2 minutes. Once that's done, go ahead to your newly created website on `<yourusername>.github.io` to see your changes.

## Yay! My first page! What's next?

Nice! Now that you have your first page, it's time to take the creativity to the next level. Grab your favorite code editor, and clone your git repository!

Go to your repository page, and click on **Clone or Download ZIP**. From there, copy the URL shown on the pop-up, and do `git clone <your-copied-url>`.

**PRO TIP:** If you want to do `git` activities to your repository without being asked for password every time you do `git`, use SSH. I'll cover about this in the future article.

But hold your horses! We need to also prepare things on local PC. Otherwise, your site can't be tested locally.

The first things you need to prepare are:
- Ruby+Devkit 2.5.0 or above (2.6.x is recommended as of this article),
- `ridk install` after Ruby+Devkit is installed, and
- Bundler and Jekyll itself through `gem install jekyll bundler`.

[Head over to Jekyll installation page](https://jekyllrb.com/docs/installation/) as it has already covered the steps required, depending on what platform you use. After that, go back here. I'll wait.

Now that the installation is complete, you can check if Jekyll runs properly by going to your cloned repo folder, and then do `jekyll serve`.

## I want to expand my site! What to do?

If you want to expand your site to accomodate other features like portfolio, blog, and so on, you need to know how Jekyll works. Commonly, Jekyll has default structure like this:

```
- /_includes
- /_layouts
- /_posts
|-- /_drafts
- /_site
- _config.yml
```

Here, let me explain one by one:
- Starting with `_config.yml` file. This file consists of the configurations necessary to run your site. If you want to put additional settings in your site (like adding Google Analytics), or if you want to update specific settings, you can put everything in this file.
- Onto `/_includes` folder. This folder consists of a piece of HTML/JS/CSS code that you use. Think of it as modules, or partials. And then, you can include the file using `{{ "{% include <yourfile> " }}%}` in your HTML layout file, which I'll explain shortly.
- `/_layouts` folder, just like its name, consists of layouts for specific type of pages in your site. This will make you can go creative with how your site works. For example, you want to make your portfolio and blog site have different layouts. You can make 2 separate files `portfolio.html` and `blog.html` in `/_layouts` folder. Then, you can assign its layout on the main page's Front Matter with `layout: <layout_name>`.
- On `/_posts` folder (and `/_drafts` subfolder), is the core of blog posting. You can assign the post title, category, and tags there for each post you make. Since the parameters are using the same Front Matter, you can also customize your posts to add functionality into each of your posts.
- And last but not least, the `/_site` folder. This is where Jekyll puts the compiled posts and/or pages you make. Don't do edits here, though.

## Wait a second... what is Front Matter?

Some of my points above mentioned about Front Matter. If you want to know about Front Matter, think of it as individual classes. Each class has its own properties to make it behave properly.

The same goes for YAML's Front Matter (or YFM, for short). The thing is, YFM acts as metadata for your pages and posts. When you put some data on YFM, Jekyll will process the data, which will be used for other components while compiling your pages and posts.

YFM takes a form like this at the top of your page or post file:

```yaml
---
some: data
other: data
---
```

[There are some predefined global variables](https://jekyllrb.com/docs/front-matter/) that you can use, but you're free to define everything in the Front Matter. If you put something inside the Front Matter, you can call its values or use it as an expression in Liquid Tags, like so:

Put the values like this...<br>`{{ "{{ page.variable" }} }}`

...or use as an expression...<br>`{{ "{% if page.variable == true" }} %}`

## Whoa... so cool!

Now that you have learned the basics, it's time to practice on it! 😊

Oh, I forgot to add something. If you have done creating pages, you'll likely want to see the compiled output. To see it locally, follow these steps:
- Open the command prompt (or Terminal if you use *nix-based operating systems).
- Go to your project folder through command prompt.
- Use `jekyll serve` command.

If you don't see any errors during `jekyll serve`, you can go straight to `127.0.0.1:4000` to see your site in preview. If you're satisfied with the change, you can commit the changes by typing `git add <changed-file>` (or `git add .` to stage all files) on the command prompt. Then, commit changes by typing `git commit -m "your message"`.

Once that's done, you can push your changes by typing `git push` command.

Congratulations! Your site is now updated! 🎉

## Yay! What's next?

Now, relax... while you're learning the basics I explained above. On the next part, I will explain how to:
- Use NPM to add advanced CSS and JS functionality,
- Make your own custom styling based on Tailwind CSS (my favorite utility-first CSS framework), and
- Use PostCSS to purge unused CSS stylings to reduce the file size.

If you have any questions, you can comment down below.

Happy creating things!