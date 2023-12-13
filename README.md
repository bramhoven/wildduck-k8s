<h4 align="center"><b>** THIS IS STILL WORK IN PROGRESS **</b></h4>

<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h1 align="center">Wildduck K8S</h1>
  <h5>Helm chart for running WildDuck in kubernetes</h5>

  <p align="center">
    WildDuck is a modern mail server software for IMAP and POP3. Modern being scalable, Unicode-first, and API-controlled. This chart bundles WildDuck with Haraka and ZoneMTA to create a complete mail server.
  </p>
</div>

## Status
The current tested status of the helm chart. Not everything is working so far but the status below shows what has been tested and works.
- [x] Receiving mail
- [x] Sending mail
- [x] IMAP service
- [x] IMAPS service
- [x] POP3 service
- [x] POP3S service
- [x] Inbound SMTP service
- [x] Inbound SMTPS service
- [x] Outbound SMTP service
- [x] Outbound SMTPS service

## Adding Helm Chart

```bash
$ helm repo add bramhoven https://bramhoven.github.io/charts
$ helm search repo bramhoven
$ helm install my-release bramhoven/wildduck
```
