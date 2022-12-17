# docker-smtp-sink

A minimalist fake SMTP server for development and debugging purposes.

This is running in docker using docker-compose and is based on https://github.com/Tecnativa/docker-smtp-sink augmented with graceful stop for docker containers and rename email messages to .eml files.

## Notes

If this is used with PHP library PHPMailer use following settings:

```
$mailer->SMTPDebug = 0;
$mailer->SMTPAuth = false;
$mailer->SMTPSecure = '';
```

## Example

Use example docker-compose.yml to run server locally on port 8025 (create tmp/mail directory) and test it using telnet by runing `telnet localhost 8025` and pasting following commands to the server:

```
EHLO test.com
MAIL FROM: <foo@bar.com>
RCPT TO: <bar@baz.com>
DATA
Subject: test

This is a test message.
.
QUIT

```

You should get following output from the server:

```
250-smtp-sink
250-PIPELINING
250-8BITMIME
250-AUTH PLAIN LOGIN
250-XCLIENT NAME HELO
250-XFORWARD NAME ADDR PROTO HELO
250-ENHANCEDSTATUSCODES
250-DSN
250
250 2.1.0 Ok
250 2.1.5 Ok
354 End data with <CR><LF>.<CR><LF>
250 2.0.0 Ok
221 Bye
Connection closed by foreign host.
```

And caught email message will be saved in tmp/mail directory.

# Docker Image

Pull from [Docker Hub registry](https://cloud.docker.com/repository/registry-1.docker.io/zanne/smtp-sink):

`docker pull zanne/smtp-sink:latest`
