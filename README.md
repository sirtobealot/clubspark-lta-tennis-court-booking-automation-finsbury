# LTA Tennis Court Booking

## Install

On Fedora/RHEL based OSs

Assuming the repo is checked out at `/home/ben/code/benkant/clubspark-lta-tennis-court-booking-automation-finsbury`

```sh
sudo dnf install nodejs-npm cronie
cd clubspark-lta-tennis-court-booking-automation-finsbury
nvm use
nvm install
npx jest # this will test your login to the court system
```

Create the cron job

```sh
crontab -e
```

Add this line to run the script close to midnight, and it will wait until midnight to run:

(again, change the directory to match the directory you cloned the repository)

```
53 23 * * * /bin/bash ~/code/benkant/clubspark-lta-tennis-court-booking-automation-finsbury/run_tests.sh >> ~/code/benkant/clubspark-lta-tennis-court-booking-automation-finsbury/cronjob.log 2>&1
```

You will need to leave your machine on, and not asleep (you may need to check your power settings).

Read the last three bullet points below regarding your username/password and court IDs.

1. To set the environment variables, add this to end of `~/.bashrc`:

```
export LTA_USERNAME=<lta_username>
export LTA_PASSWORD=<lta_password>
```

2. Update your playing location to Queen's Park or something
3. Edit `__test__/book.test.js` to change the courtIds you want to book:

```js
  const courtIds = {
    court1Id: 'c2acbb00-af02-460d-b6db-444c2f617a80',
    court2Id: '5fed3659-9c46-44c8-bd9d-1d0061e522d6'
  }
```

## Acknowledgement

Thanks very much to dragomir.enachi.uk@gmail.com who solved the problem I was trying to!

## Did it save your time?

If so, please donate to the original developer: http://paypal.me/dragomirenachi

## Why and how?

Tennis courts can booked 6 days in advance, the booking slot opens at midnight. Finsbury Park provides free courts that get booked quickly and often don't get used. I want to automate this process.

The test script is using selenium, jest chromedriver and delay.

Jenkins will trigger the build each day at 23:53, Jenkins will perform setup, and the script will wait(using delay) till next hour starts (00:00:01) to continue booking.

The script will try to book court 1, and if that fails (someone else booked it) - will try to book court 2 in Fimsbury Park through to court 8.

It will use username and password to login to [https://auth.clubspark.uk/account/signin](https://auth.clubspark.uk/account/signin)

Jenkins build trigger set to:

TZ=Europe/London

53 23 * * 0,1,2,3,4,5,6,7

To reuse the script you would need to provide:

- Environment variable to login to Club Spark website LTA_USERNAME and LTA_PASSWORD
- Booking location needs to be changed from https://clubspark.lta.org.uk/ActonPark2/ to your location
- Court ids need to be adjusted in the book.test.js file to match your booking location
