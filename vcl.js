"use strict";

const yaml = require("js-yaml");
const fs = require("fs");
const path = require("path");

function escapeNonAsciiCharacters(str) {
  return str
    .split('')
    .map(c => {
      if (c.charCodeAt(0) > 127) {
        return '%u' + c.charCodeAt(0).toString(16).toUpperCase().padStart(4, 0)
      } else {
        return c;
      }
    })
    .join('')
}

function convertToFastlyRegExpCaptureGroups(str) {
  return str
    .replace(/\$([0-9])+/g, 're.group.$1')
    .split(/(re\.group\.[0-9]+)/)
    .map(str => str.startsWith("re.group.") ? str : `"${str}"`)
    .join(" ");
}

// Get document, or throw exception on error
const uap = yaml.safeLoad(
  fs.readFileSync(require.resolve("uap-core/regexes.yaml"), "utf8")
).user_agent_parsers;
const start = `sub useragent_parser {
  declare local var.Family STRING;
  set var.Family = "Other";
  declare local var.Major STRING;
  set var.Major = "";
  declare local var.Minor STRING;
  set var.Minor = "";
  declare local var.Patch STRING;
  set var.Patch = "";
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
    const fastlySafeString = convertToFastlyRegExpCaptureGroups(escapeNonAsciiCharacters(agent.family_replacement));
    s += `set var.Family=${fastlySafeString};`;
  } else {
    s += `set var.Family=if (re.group.1, re.group.1, "");`;
  }
  if (agent.v1_replacement) {
    const fastlySafeString = convertToFastlyRegExpCaptureGroups(escapeNonAsciiCharacters(agent.v1_replacement));
    s += `set var.Major=${fastlySafeString};`;
  } else {
    s += `set var.Major=if (re.group.2, re.group.2, "");`;
  }

  if (agent.v2_replacement) {
    const fastlySafeString = convertToFastlyRegExpCaptureGroups(escapeNonAsciiCharacters(agent.v2_replacement));
    s += `set var.Minor=${fastlySafeString};`;
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