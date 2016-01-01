exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files
      // joinTo: {
      //  "js/app.js": /^(app\/assets\/javascripts)/,
      //  "js/vendor.js": /^(vendor\/assets)/
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // https://github.com/brunch/brunch/tree/master/docs#concatenation
      // order: {
      //   before: [
      //     "vendor/assets/javascripts/jquery-2.1.1.js",
      //     "vendor/assets/javascripts/bootstrap.min.js"
      //   ]
      // }
    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/app/assets". Files in this directory
    // will be copied to `paths.public`, which is "public" by default.
    assets: /^(app\/assets\)/
  },

  // Loaded assets paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "app/assets",
      "vendor/assets"
    ],

    // Where to compile files to
    public: "public"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor\/assets/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["app/assets/javascripts/"]
    }
  },

  npm: {
    enabled: true
  }
};
