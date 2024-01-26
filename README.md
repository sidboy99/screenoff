# screenoff

I'm running Ubuntu on an Asus Vivobook, and shutting the laptop lid causes the laptop to enter sleep mode which eventually crashes it.
You can prevent the computer from going into sleep in settings but then shutting the lid doesn't turn off the screen :/ I'm dumb if I couldn't find a trick to do it without this simple script. I'm putting this on GitHub for my own use but you may find it helpful:)

Your lid state and brightness values maybe in a different folder!

Add it to your crontab to run it on startup :)
cron -e
@reboot /path_to_file/screenoff.sh
