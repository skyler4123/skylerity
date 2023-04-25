const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/**/*.{erb,haml,html,slim,js}',
    './app/components/**/*.{erb,haml,html,slim,js}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        skyler: {
          '0%': {transform: 'translate(0px, 0px) rotate(0deg)'},
          '50%': {transform: 'translate(100x, 250px) rotate(360deg)'},
          '100%': {transform: 'translate(2000px, 2500px) rotate(720deg)'},
        },
        skyler2: {
          '0%': {transform: 'translate(0px, 0px) rotate(0deg)'},
          '50%': {transform: 'translate(0x, 0px) rotate(360deg)'},
          '100%': {transform: 'translate(0px, 1000px) rotate(720deg)'},
        }
      },
      animation: {
        skyler: 'skyler 5s linear infinite',
        skyler2: 'skyler2 3s linear infinite'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
