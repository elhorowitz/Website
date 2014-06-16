module.exports = function(grunt) {
    var javascripts = [],
        stylesheets = 'app/css/styles.scss',
        images = 'app/img/**/**/*.{png,jpg,gif}';

    javascripts = [
        'app/js/**/*.js',
        '!app/js/libs/**/*.js'
    ];

    require('load-grunt-tasks')(grunt);

    grunt.initConfig({

        // Javascript Tasks
        // ---------------------------------------------

        concat: {
            scripts: {
                src: [
                    javascripts,
                    '!app/js/vendor/**/*.js',
                ],
                dest: 'public/js/scripts.js',
                separator: ';'
            },
            plugins: {
                src: [
                    'app/js/vendor/**/*.js'
                ],
                dest: 'public/js/plugins.js',
                separator: ';'
            }
        },

        jshint: {
            dev: ['Gruntfile.js', javascripts, '!app/js/vendor/**/*.js']
        },

        uglify: {
            scripts: {
                src: [
                    javascripts,
                    '!app/js/vendor/**/*.js',
                ],
                dest: 'public/js/scripts.min.js',
                separator: ';'
            },
            plugins: {
                src: [
                    'app/js/vendor/**/*.js'
                ],
                dest: 'public/js/plugins.min.js',
                separator: ';'
            }
        },


        // CSS Tasks
        // ---------------------------------------------

        sass: {
            dev: {
                options: {
                    lineNumbers: true,
                    style: 'expanded'
                },
                files: {
                    'public/css/styles.css': stylesheets
                }
            },
            dist: {
                options: {
                    style: 'compressed',
                    quiet: true
                },
                files: {
                    'public/css/styles.min.css': stylesheets
                }
            },
            styleguide: {
                options: {
                    lineNumbers: true,
                    style: 'expanded'
                },
                files: {
                    'public/css/styleguide.css': 'app/css/styleguide.scss'
                }
            }
        },


        // Image Tasks
        // ---------------------------------------------

        imagemin: {
            dynamic: {
                files: [{
                    expand: true,
                    cwd: 'app/img/',
                    src: ['**/*.{jpg,gif,png}'],
                    dest: 'public/img'
                }]
            }
        },


        // Misc Tasks
        // ---------------------------------------------

        copy: {
            main: {
                files: [{
                    expand: true,
                    cwd: 'app/',
                    src: ['**/*.html'],
                    dest: 'public/'
                }]
            },
            javascripts: {
                files: [{
                    expand: true,
                    cwd: 'app/js/',
                    src: ['**/*.js'],
                    dest: 'public/js/'
                }]
            },
            fonts: {
                files: [{
                    expand: true,
                    cwd: 'app/fonts/libs',
                    src: ['**/icomoon.*'],
                    dest: 'public/fonts/libs'
                }]
            }
        },


        watch: {
            options: {
                livereload: true
            },
            html: {
                files: 'app/*.html',
                tasks: 'copy:main'
            },
            scripts: {
                files: [javascripts, '!app/js/vendor/**/*.js'],
                tasks: [
                    'concat:scripts',
                    'jshint',
                    'uglify:scripts'
                ]
            },
            plugins: {
                files: 'app/js/vendor/**/*.js',
                tasks: [
                    'concat:plugins',
                    'jshint',
                    'uglify:plugins'
                ]
            },
            libs: {
                files: 'app/js/libs/**/*.js',
                tasks: 'copy:javascripts'
            },
            sass: {
                files: 'app/css/**/*{.scss, .sass}',
                tasks: ['sass'],
                options: {
                    livereload: false
                }
            },
            css: {
                files: 'public/css/*.css',
                tasks: ''
            },
            images: {
                files: images,
                tasks: [
                    'imagemin'
                ]
            }
        }
    });

    
    grunt.registerTask('default', ['watch']);

    grunt.registerTask('build', [
        'imagemin',
        'copy',
        'sass',
        'concat',
        'jshint',
        'uglify'
    ]);
};