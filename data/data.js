const { global, pages } = require("./en");
const { leadFormSubmissions } = require("./lead-form-submissions.json");

module.exports = {
  globals: [global],
  pages: [...pages],
  leadFormSubmissions,
};
