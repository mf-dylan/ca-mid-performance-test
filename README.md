# Goal

- Create a page performance testing standard by adding scripts.
- Generate basic test report for references. You still need to do datadog screenshot manually.

## Add a Test Example

⚠️ Default `duration=5s`, `rate=1`.
⚠️ HighRate `duration=5s`, `rate=5`.
⚠️ Single `duration=1s`, `rate=1`.

1. Prepare your testing script folder.
2. Add your `exec.sh` entry to `makefile`.
3. Prepare your `body.json`.
4. Set the sensitive data in `.env`.
5. Start testing.
