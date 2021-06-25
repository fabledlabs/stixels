const { red, blueGray } = require('tailwindcss/colors');
const defaultTheme = require('tailwindcss/defaultTheme');

const colors = {
  white: '#ffffff',
  transparent: 'transparent',
  brand: {
    100: '#CAE6BF',
    200: '#50C5B6',
    300: '#00A1AF',
    400: '#00707A',
    500: '#064E55',
  },
  gray: blueGray,
  error: red,
};

module.exports = {
  mode: 'jit',
  purge: [ '../lib/stixel_web/**/*.{ex,leex,eex}', './js/**/*.js' ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors,
    fontFamily: {
      sans: [ 'Inter var', ...defaultTheme.fontFamily.sans ],
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [ require('@tailwindcss/typography'), require('@tailwindcss/forms'), require('@tailwindcss/aspect-ratio') ],
};
