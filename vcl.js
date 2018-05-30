"use strict";

const yaml = require("js-yaml");
const fs = require("fs");
const path = require("path");

function nonAsciiToHtmlEscapeSequence(str) {
  return str.split('').map(char => {
    if (char.codePointAt(0) < 128) {
      return char;
    } else {
      return "&#" + char.codePointAt(0) + ";";
    }
  }).join('');
}

function convertToFastlyRegExpCaptureGroups(str) {
  return str.replace(/\$([0-9])+/g, 're.group.$1');
}

// Get document, or throw exception on error
const uap = yaml.safeLoad(
  fs.readFileSync(require.resolve("uap-core/regexes.yaml"), "utf8")
).user_agent_parsers;
const start = `sub useragent_parser {
  declare local var.Family STRING;
  declare local var.Major STRING;
  declare local var.Minor STRING;
  declare local var.Patch STRING;
	switch (req.http.User-Agent) {
`;
const end = `
}
  set req.http.useragent_parser_family=var.Family;
  set req.http.useragent_parser_major=var.Major;
  set req.http.useragent_parser_minor=var.Minor;
  set req.http.useragent_parser_patch=var.Patch;
}`;
let file = "";
for (const agent of uap) {
  let s = "";
  s += `case~"${agent.regex}":`;
  if (agent.family_replacement) {
    s += `set var.Family="${nonAsciiToHtmlEscapeSequence(convertToFastlyRegExpCaptureGroups(agent.family_replacement))}";`;
  } else {
    s += `set var.Family=if (re.group.1, re.group.1, "");`;
  }
  if (agent.v1_replacement) {
    s += `set var.Major="${nonAsciiToHtmlEscapeSequence(convertToFastlyRegExpCaptureGroups(agent.v1_replacement))}";`;
  } else {
    s += `set var.Major=if (re.group.2, re.group.2, "");`;
  }

  if (agent.v2_replacement) {
    s += `set var.Minor="${nonAsciiToHtmlEscapeSequence(convertToFastlyRegExpCaptureGroups(agent.v2_replacement))}";`;
  } else {
    s += `set var.Minor=if (re.group.3, re.group.3, "");`;
  }
  s += `set var.Patch=if (re.group.4, re.group.4, "");`;
  s += "break;";
  file += s;
}
fs.writeFileSync(
  path.join(__dirname, "ua_parser.vcl"),
  start + file + end,
  "utf8"
);
