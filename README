# Today


## What?

Shout out on Hipchat what's on a google calendar for today


## Huh? Why?

At our office every day is different; you never know who you should expect to see there: some collegues will visit clients, some are doing part time academic work, some have a day off or work from home... you get the gist. This little project grew out of the need to be informed about how many people one can expect to see at the office today. Obviously we jot this all down in a calendar but I'm too lazy for looking it up every day. I simply want an app to shout it at me on HipChat while I have breakfast.


## How can I have this too?

You need a YAML file with your config, something like this:

```yaml
in_and_out:
  calendar_url: {{your calendar as xml}}
  hipchat_token: {{a token for HipChat}}
  hipchat_room: {{the room in which you want to read your msg}}
another_calendar:
  hipchat_room: {{your calendar as xml}}
  hipchat_token: {{a token for HipChat}}
  hipchat_room: {{the room in which you want to read your msg}}
```

You may specify as many configs as you want.

Then you feed this config to the script to see if it works:

`$ bin/today_on_hipchat < my_superawesome_configuration.yml`

And you set up the obvious cron job for it.


## Known issues

**It doesn't deal with time zones at all.**

This is not a problem for me since our company is not geographically dispersed and I just let the cron job run at 7am or so. It'll be fine in winter and summer time. But if you want to improve it: please send a pull request!
