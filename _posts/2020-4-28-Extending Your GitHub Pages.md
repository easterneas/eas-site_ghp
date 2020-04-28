---
# basic post options
title: Extending Your GitHub Pages
slug: extending-your-github-pages
description: Now that you have your own GitHub Pages site, it's time for you to extend your site features.
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
  fb: In the last post, you have learned how to create your site with GitHub Pages. Also, you also have learned how to prepare your site for further customization locally on the same post. Now, you will learn how to extending your site features on GitHub Pages.
  li: In the last post, you have learned how to create your site with GitHub Pages. Also, you also have learned how to prepare your site for further customization locally on the same post. Now, you will learn how to extending your site features on GitHub Pages.
  tw: If you have learned from my last post about how to build your site in my last post, then it's the time to extend your @GitHub Pages site with features!

# advanced post options
layout: post
---

In the last post, you have learned [how to create your site with GitHub Pages]({% post_url 2020-4-23-Be Creative with GitHub Pages %}). Also, you also have learned how to prepare your site for further customization locally on the same post. Now, you will learn how to extending your site features on GitHub Pages.

## In this post..

I'll walk you through the more advanced steps on how to extending your Jekyll-based site on GitHub Pages, such as:
- Using NPM to add advanced CSS and JS functionality,
- Configuring Webpack for compiling CSS and JS,
- Making your own custom styling using Tailwind CSS, and
- Using PostCSS to purge unused CSS stylings to reduce file size.

Most of this post, is inspired by [the post made by Frank de Jonge](https://blog.frankdejonge.nl/setting-up-docs-with-tailwind-css-and-github-pages/) -- yup, I made my own site based on his tutorials, too. But I'll try to get down to basics, so you may be able to make your customization easy and simple enough.

So, without further ado, let's jump in!

## But first...

I didn't explain further about `_config.yml` file in my last post. But, I think it is a good time to explain this file first.

As I said in my last post, `_config.yml` consists of the site's main configurations needed for your site to run properly. Also, you can put additional site settings within this file to extend your site features, much like what we will do in this post. Even so, your site can still run without `_config.yml` file, though it will run based on [default Jekyll configuration on this documentation](https://jekyllrb.com/docs/configuration/default/).

In order to customize your site, you need to create an empty `_config.yml` to override your site default settings. To keep it easy and simple, let's just populate the configuration file with the following:

```yaml
# I use the following first config to define my site, like
title: <Your site title>
description: <Your site description>
google_analytics: # only use this if you use Analytics from Google
permalink: # only for posts: use this to override default Jekyll's post permalink
timezone: <Your timezone>

# use default layout for all pages
defaults:
  - scope:
      path: ""
    values:
      layout: "default"

# exclude source and non-essential files and folders
exclude:
  - "*.config.js"
  - "package*.js"
  - "node_modules"
  - "src"
```

Since we populated `_config.yml`, if you are still running `jekyll serve`, you need to restart it to use the configuration settings. Otherwise, Jekyll won't use the created `_config.yml` file.

Now the configuration file is prepared, it's time to jump right in!

## So what is NPM?

NPM (Node Package Manager) is the package manager that manages everything JavaScript. It is widely used in Node.js environment, but NPM also can be used on other non-JS based sites, too (like this one).

Before we can install packages, we need to download NPM first. Since NPM is bundled with Node JS, we can just [download from Node site](https://nodejs.org/en/), and just use default settings during installation.

Once that's done, you can check `node -v` and `npm -v` to see if Node and NPM are installed properly.

## Now NPM is installed, what to do next?

The next thing you need to do, is to install packages and their dependencies. To do this, you need to make a file named `package.json` (the NPM's required file), and fill with this:

```json
{
  private: true
}
```

The code above is to specify whether the project is private or open-source. If it's true, then npm will refuse to publish the project.

Then, install the following packages:

```sh
npm install --save-dev autoprefixer \
                       clean-webpack-plugin \
                       css-loader \
                       cssnano \
                       mini-css-extract-plugin \
                       postcss \
                       postcss-loader \
                       postcss-nested \
                       @fullhuman/postcss-purgecss \
                       style-loader \
                       tailwindcss \
                       webpack \
                       webpack-cli \
                       webpack-manifest-plugin
```

Note: If `\` didn't work, make it to just one line.

Once that's done, now it's time to configure the webpack.

## What is webpack?

On [their documentation](https://webpack.js.org/concepts/), webpack is a static module bundler for modern JavaScript applications. When webpack runs, it will create the dependency graph internally, which maps every single module and project needed, and generates one or more bundles.

At this time, you might be confused with how it works, so let's just jump into the code to see how it works. I'll explain on how they work later on.

### Create `webpack.config.js` file

Create a file named `webpack.config.js`, and copy the following code:

```js
const path = require('path');  
const MiniCssExtractPlugin = require('mini-css-extract-plugin');  
const ManifestPlugin = require('webpack-manifest-plugin');  
const isProduction = process.env.NODE_ENV === 'production';  
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {  
    mode: isProduction ? 'production' : 'development',
    entry: {
        docs: path.resolve(__dirname, './assets/index.css'),
    },
    output: {
        path: path.resolve(__dirname, './dist/'),
        filename: isProduction ? '[name].[hash].js' : '[name].js',
        chunkFilename: isProduction ? '[id].[hash].js' : '[id].js',
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader,
                        options: {
                            hmr: process.env.NODE_ENV === 'development',
                        },
                    },
                    'css-loader',
                    'postcss-loader',
                ]
            }
        ]
    },
    plugins: [
        new CleanWebpackPlugin(),
        new MiniCssExtractPlugin({
            filename: isProduction ? '[name].[hash].css' : '[name].css'
        }),
        new ManifestPlugin({
            fileName: '../_data/manifest.yml',
            publicPath: './dist/',
            // site.data.manifest['key']
        }),
    ],
};
```

These code above will compile the CSS and JS we will create later on, and store them inside `/dist` folder.

### Initialize `tailwind.config.js` file

After that, create Tailwind CSS init file by using `npx tailwind init` (notice that it's `npx`, not `npm`). This will create the base Tailwind CSS configuration file named `tailwind.config.js`, that we can use for further customization, if you want.

### Configure `postcss.config.js` file

Next, is to prepare the PostCSS configuration file called `postcss.config.js`, and copy contents below.

```js
const purgecss = require('@fullhuman/postcss-purgecss')({  
    content: [
        // Jekyll output directory
        './_site/**/*.html',
    ],
    defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || [],
});

module.exports = {  
    plugins: [
        require('tailwindcss'),
        require('cssnano')(),
        require('autoprefixer'),
        ...process.env.NODE_ENV === 'production'
            ? [purgecss]
            : []
    ]
};
```

### So, how do they work?

Now, let me explain one by one. The `webpack.config.js` file consists of routines needed for compiling fhe CSS and JS files. First, it defines the base path, the environment from `npm run`, and then obtains `mini-css-extract`, `clean-webpack`, and `webpack-manifest` plugins. Then, it runs its main routine, which is in `module.exports`, that finds the `index.css` file in `/assets` directory, compiles it, and outputs 2 separate CSS and JS file in `/dist` directory as `docs.css` and `docs.js`. If you use `npm run prod`, it will add hashes into the compiled name.

The second one is the `tailwind.config.js` file. This file is mainly used for Tailwind CSS configuration file. You can customize it by customizing screen width size, its font family, or you can even add Tailwind-specific plugins in it. [Read the complete documentation](https://tailwindcss.com/docs/configuration) for more detailed information.

Last but not least, the `postcss.config.js` file. This configuration file is used to delete unused CSS styling by looking for used styling in each of compiled Jekyll sites. This is useful, especially on production sites, as it will reduce the file size considerably.

## Great! What's the next step?

Now that the files are setup correctly, it's time to test it out. Create `index.css` file in `/assets` directory, and add this:

```css
@tailwind base;

// your custom base styles here

@tailwind components;

@tailwind utilities;
```

[Tailwind sugests](https://tailwindcss.com/docs/adding-base-styles/) that you to put your custom base styles right in between of Tailwind's base and components, to avoid specificity issues.

Before we go ahead and run `npm run dev` to begin compiling file, we have to update the `package.json` file. Sure, you may run `npm run dev`, but chances are, that you might get an error where there is no such script like `dev` when doing `npm run`. To avoid this, add the following:

```json
{
// private...
  "scripts": {
    "prod": "NODE_ENV=production npx webpack",
    "dev": "NODE_ENV=development npx webpack",
    "watch": "NODE_ENV=development npx webpack --watch"
  }
// devDependencies...
}
```

<div class="bg-orange-300 text-orange-700 rounded-md p-4 mb-4 flex flex-row content-center">
  <div class="mr-2">
    <ion-icon name="alert-circle-outline" class="text-2xl"></ion-icon>
  </div>
  <div>
    If you are using Windows, chances are, that you might encounter problems when you try to run <code>npm run</code> (either <code>npm run dev</code>, <code>npm run watch</code>, or <code>npm run prod</code>). If this happens, you need to install additional package called <code>cross-env</code> by doing <code>npm install -g cross-env</code>, and then add <code>cross-env</code> right before <code>NODE_ENV</code> on each script above.
  </div>
</div>

Now, try `npm run dev` on the command prompt (or terminal, if you use *nix platforms). It should run properly.

## Speaking of Tailwind CSS customization...

If you notice the instructions I gave above, there was a step where you need to input some code inside `index.css` file. And if you look closer, there was a line where I put `// your custom base styles here`, which is where you can put your custom base settings. For complete documentation for how to use their components, head out to [Tailwind CSS documentation](https://tailwindcss.com/components).

You may ignore this if you want to define Tailwind CSS classes directly to each of HTML element in your site. But, if you want to make more consistent layout, I suggest you to use it according to your needs.

For example, you want a `.btn` class to have a light red button, slightly rounded border, and dark red text. You can achieve this by using the following:

```css
.btn {
  @apply bg-red-300 text-red-800;
  @apply rounded;
}
```

You may notice that I use 2 `@apply` directives. I made this to group according to their functions (e.g. `bg-red-300` and `text-red-800` are in colors group). It's optional, though, but I won't recommend you to cramp everything into just one line.

## Finally, CSS purging!

The final step of your site theming is to purge unused CSS classes. This is useful after you've done developing your site layout (like I do here), as it will reduce unused CSS classes (like I said before) to a reasonable file size. This will make your site loads faster.

I assume you have done styling your site, so let's jump right into it. On your command prompt (or terminal), run this command:

```bash
npm run prod
```

This command will do `prod` script inside `package.json` file, much like what you do with `npm run dev` at prior steps above. Then, after it's done, you can commit and push your changes to GitHub. Wait for up to 2 minutes for GitHub Pages to process your changes.

And after that, it's finished!

## Yay! My GitHub Pages site!

Now that you've done the steps from deploying your first page into GitHub Pages on my last post, and also customizing your site within my post here. It's time for you to go crazy with your site, and let your journey begin as a developer!

Have fun!