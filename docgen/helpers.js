module.exports = {
  toLowerCase: (str) => {
      if (typeof str === 'string' || str instanceof String)
          return str.toLowerCase();
      else
          return "";
  },
  trim: (str) => {
      if (typeof str === 'string' || str instanceof String)
          return str.trim();
      else
          return "";
  }
}