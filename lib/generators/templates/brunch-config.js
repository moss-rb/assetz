exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files
      // joinTo: {
      //  "js/app.js": /^(app\/static\/js)/,
      //  "js/vendor.js": /^(app\/static\/vendor)|(deps)/
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // https://github.com/brunch/brunch/tree/master/docs#concatenation
      // order: {
      //   before: [
      //     "app/static/vendor/js/jquery-2.1.1.js",
      //     "app/static/vendor/js/bootstrap.min.js"
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
    // By default, we set this to "/app/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "public/static" by default.
    assets: /^(app\/static\/assets)/
  },

  // Assets paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "app/static",
    ],

    // Where to compile files to
    public: "public/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/app\/static\/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["app/static/js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
