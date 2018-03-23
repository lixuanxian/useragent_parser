# VCL User Agent parser

This is the VCL implementation of the [ua-parser](https://github.com/tobie/ua-parser)

# Usage

## Updating

  `uap-core` definitions are, by default, compiled and included in the package. To regenerate these definitions you can run the `npm run update` script.

# Example

```vcl
import ua_parser;

sub vcl_recv {
  call useragent_parser;
  # Now req.http.normalized-user-agent exists.
}
```
